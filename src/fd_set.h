/*************************************************************************
 *  TinyFugue - programmable mud client
 *  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
 *
 *  TinyFugue (aka "tf") is protected under the terms of the GNU
 *  General Public License.  See the file "LICENSE" for details.
 ************************************************************************/

#ifndef FD_SET_H
#define FD_SET_H

#ifndef FD_ZERO
/* For BSD 4.2 systems. */
VEC_TYPEDEF(fd_vector, 256); /* fd_vector in case fd_set is already typedef'd */
# undef fd_set               /* in case fd_set is already #define'd */
# define fd_set fd_vector
# define FD_SET(n, p)    VEC_SET(n, p)
# define FD_CLR(n, p)    VEC_CLR(n, p)
# define FD_ISSET(n, p)  VEC_ISSET(n, p)
# define FD_ZERO(p)      VEC_ZERO(p)
extern int select();
#endif

#endif /* FD_SET_H */
