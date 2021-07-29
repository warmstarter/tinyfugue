/*************************************************************************
 *  TinyFugue - programmable mud client
 *  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
 *
 *  TinyFugue (aka "tf") is protected under the terms of the GNU
 *  General Public License.  See the file "LICENSE" for details.
 ************************************************************************/

#ifndef HISTORY_H
#define HISTORY_H

extern void   init_histories(void);
extern struct History *init_history(struct History *hist, int maxsize);
extern void   free_history(struct History *hist);
extern void   recordline(struct History *hist, conString *line);
extern void   record_input(const conString *line);
extern String*recall_input(int n, int mode);
extern int    is_watchdog(struct History *hist, String *line);
extern int    is_watchname(struct History *hist, String *line);
extern String*history_sub(String *line);
extern void   sync_input_hist(void);
extern int    do_recall(String *args, int offset);
extern long   hist_getsize(const struct History *w);

#if USE_DMALLOC
extern void   free_histories(void);
#endif

#define record_global(line)  recordline(globalhist, (line))
#define record_local(line)   recordline(localhist, (line))

extern struct History * const globalhist, * const localhist;
extern int log_count, norecord, nolog;

#endif /* HISTORY_H */
