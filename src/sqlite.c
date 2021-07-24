#include "tfconfig.h" /* autoconf stuff? */
#ifdef HAVE_SQLITE3
#include "port.h"
#include "tf.h"
#include "search.h"
#include "malloc.h"
#include "sqlite.h"
#include "variable.h"

#include <sqlite3.h>

List dblist;
List statementlist;
int dblist_max_id=1;
int statementlist_max_id=1;

/* Called from main.c */
void init_sqlite(void) {
    init_list(&dblist);
    init_list(&statementlist);
}

int add_db_to_list(sqlite3 *db) {
    dbnode *node;
    node = XMALLOC(sizeof(dbnode));
    node->id=dblist_max_id++;
    node->db=db;
    node->node = inlist(node, &dblist, (&dblist)->tail);
    return node->id;
}

int add_statement_to_list(sqlite3_stmt *stmt) {
    statementnode *node;
    node = XMALLOC(sizeof(statementnode));
    node->id=statementlist_max_id++;
    node->stmt=stmt;
    node->node = inlist(node, &statementlist, (&statementlist)->tail);
    return node->id;
}

ListEntry *find_db_from_handle(const char *handle) {
    ListEntry *node;
    int id;
    id = atoi(handle);
    for (node=(&dblist)->head; node; node=node->next) {
        if(((dbnode*)node->datum)->id == id)
            break;
    }
    return node;
}

ListEntry *find_statement_from_handle(const char *handle) {
    ListEntry *node;
    int id;
    id = atoi(handle);
    for (node=(&statementlist)->head; node; node=node->next) {
        if(((statementnode*)node->datum)->id == id)
            break;
    }
    return node;
}

static int callback(void *NotUsed, int argc, char **argv, char **azColName){
  int i;
  for(i=0; i<argc; i++){
    eprintf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
  }
  eprintf("\n");
  return 0;
}


int handle_dbopen_func(const char *filename) {
    sqlite3 *db;
    char *zErrMsg;
    int rc;

    rc = sqlite3_open(filename, &db);
    if (rc) {
        eprintf("Can't open database: %s", sqlite3_errmsg(db));
        sqlite3_close(db);
        return -1;
    }
    
    rc = add_db_to_list(db);
    return rc;
}

int handle_dbclose_func(const char *handle) {
    ListEntry *node;
    node = find_db_from_handle(handle);
    if (node) {
        sqlite3_close(((dbnode*)node->datum)->db);
        free(node->datum);
        unlist(node, &dblist);
        return 0;
    }
    eprintf("%s: invalid handle.", handle);
    return -1;
}

int handle_dbprepare_func(const char *dbhandle, const char *query) {
    sqlite3_stmt *stmt;
    ListEntry *node;
    sqlite3 *db;
    const char *pzTail;
    int rc;

    node = find_db_from_handle(dbhandle);
    if (!node) {
        eprintf("%s: invalid database handle.", dbhandle);
        return -1;
    }
    db = ((dbnode*)node->datum)->db;
    
    rc = sqlite3_prepare(db, query, -1, &stmt, &pzTail);
    if (rc != SQLITE_OK) {
        eprintf("Can't prepare query: %s", sqlite3_errmsg(db));
        return -2;
    }
    rc = add_statement_to_list(stmt);
    return rc;
}

int handle_dbbind_func(const char *stmthandle, int col, const char *val) {
    int rc;
    ListEntry *node;
    sqlite3_stmt *stmt;

    node = find_statement_from_handle(stmthandle);
    if (!node) {
        eprintf("%s: invalid statement handle.", stmthandle);
        return -1;
    }
    stmt = ((statementnode*)node->datum)->stmt;

    rc = sqlite3_bind_text(stmt, col, val, -1, SQLITE_TRANSIENT);
    switch (rc) {
        case SQLITE_RANGE:
            eprintf("Error: Too many paramaters to bind to prepared "
                    "statement.");
            return -2;
        case SQLITE_MISUSE:
            eprintf("Error: dbbind called incorrectly. "
                    "Perhaps the prepared statement is no longer valid?");
            return -3;
        case SQLITE_NOMEM:
            eprintf("Error: Malloc failed. Out of memory.");
            return -4;
        case SQLITE_OK:
            return 0;
        default:
            eprintf("Error binding value: %s",
                    sqlite3_errmsg(sqlite3_db_handle(stmt)));
            return -255;
    }
}

/* Returns -
 * 0 - Row returned
 * 1 - Done - row returned?
 * 2 - Busy - no row returned, try again later?
 * -1 - Invalid handle
 * -2 - Misuse (E.g. called again after done returned)
 * -255 - Other error
 */
int handle_dbstep_func(const char *stmthandle) {
    int rc;
    int numcols;
    int i;
    ListEntry *node;
    sqlite3_stmt *stmt;

    node = find_statement_from_handle(stmthandle);
    if (!node) {
        eprintf("%s: invalid statement handle.", stmthandle);
        return -1;
    }
    stmt = ((statementnode*)node->datum)->stmt;

    rc = sqlite3_step(stmt);
    switch (rc) {
        case SQLITE_BUSY:
            eprintf("Warning: Database busy. No rows returned");
            return 2;
        case SQLITE_DONE:
            sqlite3_reset(stmt);
            return 1;
        case SQLITE_MISUSE:
            eprintf("Error: dbstep called incorrectly "
                    "(Perhaps all rows have already been returned?");
            return -2;
        case SQLITE_ROW: {
            char varname[] = "D?";
            numcols = sqlite3_data_count(stmt);
            const unsigned char *value;
            const unsigned char empty[] = "NULL\0";
            conString *str;
            for (i=0; i<numcols; i++) {
                /* Variables from D0-D9, then DA-DZ */
                if (i < 10) {
                    varname[1] = i+48;
                } else if (i < 36) {
                    varname[1] = i+55;
                } else {
                    /* Only go up to DZ, then just stop retrieving columns */
                    break;
                }
                value = sqlite3_column_text(stmt, i);
                if (!value) value=empty;
                str=CS(Stringnew((const char *)value, -1, 0));
                setlocalstrvar(varname, str);
            }
            return 0;
        }
        case SQLITE_ERROR:
        default:
            eprintf("Error executing query: %s",
                    sqlite3_errmsg(sqlite3_db_handle(stmt)));
            return -255;
    }
}

/* Finalize statement */
int handle_dbfinalize_func(const char *stmthandle) {
    ListEntry *node;
    node = find_statement_from_handle(stmthandle);
    if (node) {
        sqlite3_finalize(((statementnode*)node->datum)->stmt);
        free(node->datum);
        unlist(node, &statementlist);
        return 0;
    }
    eprintf("%s: invalid statment handle.", stmthandle);
    return -1;
}

/* Reset statement - let's dbstep restart from the beginning */
int handle_dbreset_func(const char *stmthandle) {
    ListEntry *node;
    node = find_statement_from_handle(stmthandle);
    if (node) {
        sqlite3_reset(((statementnode*)node->datum)->stmt);
        return 0;
    }
    eprintf("%s: invalid statment handle.", stmthandle);
    return -1;
}

#endif /* HAVE_SQLITE3 */
