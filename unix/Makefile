########################################################################
#
#  TinyFugue - programmable mud client
#  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
#
#  TinyFugue (aka "tf") is protected under the terms of the GNU
#  General Public License.  See the file "COPYING" for details.
#
########################################################################

# unix Makefile.
# This is invoked from top level make, so the working directory is the root.

SHELL = /bin/sh

default: __always__
	@case `pwd` in; \
	*/tf*/unix) cd ..;; \
	esac; \
	make

# If the next rule were first, a few strange versions of make would try
# to make "install", "all", "files", AND "tf", instead of just "install".
install all files tf: default

clean:
	cd ./src; rm -f *.o core* *.core

uninstall:
	cd ./src; $(MAKE) uninstall

./src/tf.1.catman: ./src/tf.1.nroffman
	TERM=vt100; nroff -man ./src/tf.1.nroffman > ./src/tf.1.catman

srcdist: ./src/tf.1.catman

help ./tf-lib/tf-help ./tf-lib/tf-help.idx: __always__
	if test -d ./help; then cd ./help; $(MAKE); fi

__always__:

# hack to get around a bug in BSDi (and FreeBSD?) make.
make:

