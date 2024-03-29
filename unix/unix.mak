########################################################################
#  TinyFugue - programmable mud client
#  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
#
#  TinyFugue (aka "tf") is protected under the terms of the GNU
#  General Public License.  See the file "COPYING" for details.
########################################################################

#
# unix section of src/Makefile.
#

SHELL      = /bin/sh
BUILDERS   = Makefile

default: all

install:  _all PREFIXDIRS $(TF) LIBRARY $(MANPAGE) $(SYMLINK)
	@echo
	@echo '#####################################################'
	@echo '## TinyFugue installation successful.'
	@echo '##    tf binary: $(TF)'
	@echo '##    library:   $(TF_LIBDIR)'
	@echo '##    manpage:   $(MANPAGE)'
	@DIR=`echo $(TF) | sed 's;/[^/]*$$;;'`; \
	echo ":$(PATH):" | egrep ":$${DIR}:" >/dev/null 2>&1 || { \
	    echo "##"; \
	    echo "## Note:  $$DIR is not in your PATH."; \
	    echo "## To run tf, you will need to type its full path name"; \
	    echo "## or add $$DIR to your PATH."; \
	}
	@if test $(TF_LIBDIR) != `cat TF_LIBDIR.build`; then \
	    echo "##"; \
	    echo "## Note:  installed and compiled-in libraries disagree."; \
	    echo "## To run tf, you will need TFLIBDIR=\"$(TF_LIBDIR)\""; \
	    echo "## in your environment or the -L\"$(TF_LIBDIR)\" option."; \
	fi

all files:  _all
	@echo '$(TF_LIBDIR)' > TF_LIBDIR.build
	@echo
	@echo '#####################################################'
	@echo '## TinyFugue build successful.'
	@echo '## Use "$(MAKE) install" to install:'
	@echo '##    tf binary: $(TF)'
	@echo '##    library:   $(TF_LIBDIR)'
	@echo '##    manpage:   $(MANPAGE)'

_all: tf$(X) ../tf-lib/tf-help.idx

_failmsg:
	@echo '#####################################################'
	@echo '## TinyFugue installation FAILED.'
	@echo '## See README for help.'

TF tf$(X): $(OBJS) $(BUILDERS)
	$(CC) $(LDFLAGS) -o tf$(X) $(OBJS) $(LIBS) -lpcre
#	@# Some stupid linkers return ok status even if they fail.
	@test -f "tf$(X)"
#	@# ULTRIX's sh errors here if strip isn't found, despite "true".
	-test -z "$(STRIP)" || $(STRIP) tf$(X) || true

PREFIXDIRS:
	test -d "$(bindir)" || mkdir -p $(bindir)
	test -d "$(datadir)" || mkdir -p $(datadir)

install_TF $(TF): tf$(X) $(BUILDERS)
	-@rm -f $(TF)
	cp tf$(X) $(TF)
	chmod $(MODE) $(TF)

SYMLINK $(SYMLINK): $(TF)
	test -z "$(SYMLINK)" || { rm -f $(SYMLINK) && ln -s $(TF) $(SYMLINK); }

# There's a lot of unecessary steps below here.

LIBRARY $(TF_LIBDIR): ../tf-lib/tf-help ../tf-lib/tf-help.idx
	@echo '## Creating library directory...'
#	@# Overly simplified shell commands, to avoid problems on ultrix
	-@test -n "$(TF_LIBDIR)" || echo "TF_LIBDIR is undefined."
	test -n "$(TF_LIBDIR)"
	test -d "$(TF_LIBDIR)" || mkdir -p $(TF_LIBDIR)
	-@test -d "$(TF_LIBDIR)" || echo "Can't make $(TF_LIBDIR) directory.  See if"
	-@test -d "$(TF_LIBDIR)" || echo "there is already a file with that name."
	test -d "$(TF_LIBDIR)"
#	@#rm -f $(TF_LIBDIR)/*;  # wrong: this would remove local.tf, etc.
	@echo '## Copying library files...'
	cd ../tf-lib; \
	for f in *; do test -f $$f && files="$$files $$f"; done; \
	( cd $(TF_LIBDIR); rm -f $$files tf.help tf.help.index; ); \
	cp $$files $(TF_LIBDIR); \
	cd $(TF_LIBDIR); \
	chmod $(MODE) $$files; chmod ugo-wx $$files
	-rm -f $(TF_LIBDIR)/CHANGES
	cp ../CHANGES $(TF_LIBDIR)
	chmod $(MODE) $(TF_LIBDIR)/CHANGES; chmod ugo-wx $(TF_LIBDIR)/CHANGES
	chmod $(MODE) $(TF_LIBDIR)

makehelp: makehelp.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o makehelp makehelp.c

__always__:

../tf-lib/tf-help: __always__
	if test -d ../help; then cd ../help; $(MAKE) tf-help; fi
# Skip this step for now.
# Currently the HTML documents are the least up to date, so they
# shouldn't be blowing away the most up to date documents.
#	if test -d ../help; then cp ../help/tf-help ../tf-lib; fi

../tf-lib/tf-help.idx: ../tf-lib/tf-help makehelp
	$(MAKE) -f ../unix/unix.mak CC='$(CC)' CFLAGS='$(CFLAGS)' makehelp
	./makehelp < ../tf-lib/tf-help > ../tf-lib/tf-help.idx

MANPAGE $(MANPAGE): $(BUILDERS) tf.1.$(MANTYPE)man
	cp tf.1.$(MANTYPE)man $(MANPAGE)
	chmod $(MODE) $(MANPAGE)
	chmod ugo-x $(MANPAGE)

Makefile: ../unix/vars.mak ../unix/unix.mak ../configure ../configure.ac
	@echo
	@echo "## WARNING: configuration should be rerun."
	@echo

uninstall:
	@echo "Remove $(TF_LIBDIR) $(TF) $(MANPAGE)"
	@echo "Is this okay? (y/n)"
	@read response; test "$$response" = "y"
	rm -f $(TF) $(MANPAGE)
	rm -rf $(TF_LIBDIR)

clean distclean cleanest:
	cd ..; make -f unix/Makefile $@

# The next line is a hack to get around a bug in BSD/386 make.
make:

