/*************************************************************************
 *  TinyFugue - programmable mud client
 *  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
 *
 *  TinyFugue (aka "tf") is protected under the terms of the GNU
 *  General Public License.  See the file "LICENSE" for details.
 ************************************************************************/

#ifndef PROCESS_H
#define PROCESS_H

extern void kill_procs_by_world(struct World *world);
extern void kill_procs(void);
extern void nuke_dead_procs(void);
extern void runall(int prompted, struct World *world);
extern int  ch_lpquote(Var *var);

extern struct timeval proctime;		/* when next process should run */

#endif /* PROCESS_H */
