########################################################################
#  TinyFugue - programmable mud client
#  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
#
#  TinyFugue (aka "tf") is protected under the terms of the GNU
#  General Public License.  See the file "LICENSE" for details.
########################################################################

# Makefile variables common to all systems.
# This file should be included or concatenated into a system Makefile.
# Predefined variables:
#   O - object file suffix (e.g., "o" or "obj")

TFVER=50ws8

SOURCE = attr.c command.c dstring.c expand.c expr.c help.c history.c \
  keyboard.c macro.c main.c malloc.c output.c pattern.c process.c search.c \
  signals.c socket.c tfio.c tfpython.c tty.c util.c variable.c world.c

OBJS = $(subst .c,.$O,$(SOURCE)) $(OTHER_OBJS)

