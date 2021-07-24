#ifdef HAVE_SQLITE3
#include <sqlite3.h>

typedef struct dbnode {
    int id;
    ListEntry *node;
    sqlite3 *db;
} dbnode;

typedef struct statementnode {
    int id;
    ListEntry *node;
    sqlite3_stmt *stmt;
} statementnode;

extern int handle_dbopen_func(const char *filename);
extern int handle_dbclose_func(const char *handle);
extern int handle_dbprepare_func(const char *dbhandle, const char *query);
extern int handle_dbbind_func(const char *stmthandle, int col, const char *val);
extern int handle_dbstep_func(const char *stmthandle);
extern int handle_dbfinalize_func(const char *statementhandle);
#endif /* HAVE_SQLITE3 */
