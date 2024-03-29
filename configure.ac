dnl  TinyFugue - programmable mud client
dnl  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
dnl
dnl  TinyFugue (aka "tf") is protected under the terms of the GNU
dnl  General Public License.  See the file "LICENSE" for details.

################################################################
# 1. autoconf requirements
################################################################

AC_PREREQ([2.69])

m4_include([m4/ax_check_icu.m4])
m4_include([m4/ax_compiler_vendor.m4])
m4_include([m4/ax_python.m4])

define(
    [PROGRAM_STRING],
    [TinyFugue])

define(
    [VERSION_STRING],
    [50ws8])

define(
    [URL_STRING],
    [https://github.com/warmstarter/tinyfugue])

define(
    [EXE_STRING],
    [tf])

################################################################
# 2. AC_INIT
################################################################

AC_INIT(
    [PROGRAM_STRING],
    [VERSION_STRING],
    [URL_STRING][/issues],
    [EXE_STRING][-][VERSION_STRING],
    [URL_STRING])

AC_MSG_NOTICE([Configuring $PACKAGE_STRING])

AC_CONFIG_HEADERS([src/tfconfig.h])
AC_CONFIG_SRCDIR([src/tf.h])
AC_PREFIX_DEFAULT([/usr/local])

################################################################
# 3. Info on the package
################################################################

PACKAGE_EXE=EXE_STRING
AC_SUBST([PACKAGE_EXE])

AC_COPYRIGHT([Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)])
AC_REVISION([$Revision: 1.00 $])

################################################################
# 4. Process ./configure command line options
################################################################

AC_ARG_ENABLE(
    [version],
    [AS_HELP_STRING(
        [--enable-version],
        [insert version number into names of installed files])],
    [enable_version=${enableval}],
    [enable_version=default])

AC_ARG_ENABLE(
    [symlink],
    [AS_HELP_STRING(
        [--enable-symlink[=NAME]],
        [make a symlink NAME to the executable])],
    [enable_symlink=${enableval}],
    [enable_symlink=default])

AC_ARG_ENABLE(
    [core],
    [AS_HELP_STRING(
        [--enable-core],
        [enable core dumps for debugging])],
    [enable_core=${enableval}],
    [enable_core=default])

AC_ARG_ENABLE(
     [ssl],
     [AS_HELP_STRING(
         [--disable-ssl],
         [disable SSL support])],
     [enable_ssl=${enableval}],
     [enable_ssl=yes])

AC_ARG_ENABLE(
    [getaddrinfo],
    [AS_HELP_STRING(
        [--disable-getaddrinfo],
        [disable getaddrinfo implies --disable-inet6])],
    [enable_getaddrinfo=${enableval}],
    [enable_getaddrinfo=default])

AC_ARG_ENABLE(
    [inet6],
    [AS_HELP_STRING(
        [--disable-inet6],
        [disable IPV66 support])],
    [enable_inet6=${enableval}],
    [enable_inet6=yes])

AC_ARG_ENABLE(
    [256colors],
    [AS_HELP_STRING(
        [--disable-256colors],
        [disable 256 COLOR support])],
    [enable_256colors=${enableval}],
    [enable_256colors=yes])
if test "$enable_256colors" = "yes"; then
    AC_DEFINE(
        [NCOLORS],
       	[256],
       	[256 color mode enabled])
fi

AC_ARG_ENABLE(
    [python],
    [AS_HELP_STRING(
        [--enable-python],
	[enable PYTHON scripting])],
    [enable_python=${enableval}],
    [enable_python=no])

AC_ARG_ENABLE(
    [widechar],
    [AS_HELP_STRING(
        [--disable-widechar],
        [disable wide character UTF-8 support])],
    [enable_widechar=${enableval}],
    [enable_widechar=yes])

AC_ARG_ENABLE(
    [termcap],
    [AS_HELP_STRING(
        [--disable-termcap],
 	[use hardcoded vt100 codes instead of termcap])
AS_HELP_STRING(
[--enable-termcap=LIB],
[enable termcap with library LIB (e.g., "ncurses") (needed only if configure guesses incorrectly)])],
    [enable_termcap=${enableval}],
    [enable_termcap=default])

AC_ARG_ENABLE(
    [mailcheck],
    [AS_HELP_STRING(
        [--disable-mailcheck],
        [disable mail checking])
AS_HELP_STRING(
[--enable-mailcheck=DIR],
[enable checking for mail in directory DIR (needed only if configure guesses incorrectly)])],
    [enable_mailcheck=${enableval}],
    [enable_mailcheck=yes])

AC_ARG_ENABLE(
    [atcp],
    [AS_HELP_STRING(
        [--enable-atcp],
        [enable ATCP support])],
    [enable_atcp=${enableval}],
    [enable_atcp=no])
if test "$enable_atcp"      = "yes"; then
    AC_DEFINE(
        [ENABLE_ATCP],
       	[1],
       	[ATCP enabled])
fi

AC_ARG_ENABLE(
    [gmcp],
    [AS_HELP_STRING(
        [--enable-gmcp],
        [enable GMCP support])],
    [enable_gmcp=${enableval}],
    [enable_gmcp=no])
if test "$enable_gmcp"      = "yes"; then
    AC_DEFINE(
        [ENABLE_GMCP],
       	[1],
       	[GMCP enabled])
fi

AC_ARG_ENABLE(
    [option102],
    [AS_HELP_STRING(
        [--enable-option102],
        [enable OPTION102 support])],
    [enable_option102=${enableval}],
    [enable_option102=no])
if test "$enable_option102" = "yes"; then
    AC_DEFINE(
        [ENABLE_OPTION102],
       	[1],
       	[OPTION102 enabled])
fi

AC_ARG_ENABLE(
    [mccp],
    [AS_HELP_STRING(
        [--enable-mccp],
        [enable MCCP support])],
    [enable_mccp=${enableval}],
    [enable_mccp=no])

AC_ARG_WITH(
    [incdirs],
    [AS_HELP_STRING(
        [--with-incdirs=DIRS],
	[search for include files in DIRS])],
    [],
    [])

AC_ARG_WITH(
    [libdirs],
    [AS_HELP_STRING(
        [--with-libdirs=DIRS],
     	[search for libraries in DIRS])],
    [],
    [])

AC_ARG_WITH(
    [inclibdirs],
    [AS_HELP_STRING(
        [--with-inclibdirs=DIRS],
        [same as --with-incdirs=DIRS --with-libdirs=DIRS])],
    [],
    [])

AC_ARG_WITH(
    [inclibpfx],
    [AS_HELP_STRING(
        [--with-inclibpfx=DIRS],
        [same, but appends '/include' and '/lib'])],
    [],
    [])

# Hidden options.
AC_ARG_ENABLE(
    [manpage],
    [],
    [],
    [enable_manpage=yes])

# Developer options
# --enable-development implies --enable-core --disable-symlink

AC_ARG_ENABLE(
    [development],
    [],
    [],
    [enable_development=no])

AC_ARG_ENABLE(
    [dmalloc],
    [],
    [],
    [enable_dmalloc=no])
if test "$enable_dmalloc" = "yes"; then
    AC_MSG_NOTICE([Debug malloc enabled.])
    OTHER_OBJS="$OTHER_OBJS dmalloc.o"
    AC_DEFINE(
        [USE_DMALLOC],
       	[1],
       	[dmalloc enabled])
fi

AC_ARG_ENABLE(
    [mmalloc],
    [],
    [],
    [enable_mmalloc=no])
if test "$enable_mmalloc" = "yes"; then
    AC_MSG_NOTICE([GNU malloc enabled.])
    CPPFLAGS="${CPPFLAGS} -DUSE_MMALLOC"
    AC_DEFINE(
        [USE_MMALLOC],
       	[1],
       	[GNU malloc enabled])
fi

################################################################
# 5. Checks for programs, including ${CC} and its ${CFLAGS}
################################################################

AC_LANG([C])
AC_PROG_CC([clang gcc cc])
AX_COMPILER_VENDOR
AC_C_INLINE
AC_HEADER_STDC
AC_EXEEXT
AC_OBJEXT
AC_PROG_MAKE_SET
AC_PROG_EGREP
AC_PROG_LN_S
AC_PROG_SED

AC_CHECK_PROG(
    [RANLIB],
    [ranlib],
    [ranlib],
    [:])

if test "$enable_development" = "yes"; then
    AC_MSG_NOTICE([Development version.])
fi

if test "$enable_core" = "default"; then
    enable_core=$enable_development
fi

if test "$enable_version" = "default"; then
    enable_version=$enable_development
fi

if test "$enable_development" = "yes"; then
    if test "$enable_symlink" = "default"; then
	enable_symlink=no
    fi
else
    AC_DEFINE(
	[NDEBUG],
	[1],
	[debug disabled])
fi

if test "$enable_core" = "yes"; then
    AC_MSG_NOTICE([Core dumps enabled.])
    CFLAGS="${CFLAGS} -g"
    STRIP=":"
else
    AC_DEFINE(
	[DISABLE_CORE],
	[1],
	[core dumps disabled])
    AC_CHECK_PROG(
	[STRIP],
	[strip],
	[strip],
	[:])
fi
AC_SUBST(STRIP)

UNAME=`{ uname -s && uname -v && uname -r || uname -a; } 2>/dev/null`
UNAME=`echo $UNAME`  # remove newlines
AC_SUBST(UNAME)

################################################################
# 6. Checks for libraries
#################################################################

### Library testing.
# If libfoo.a make references to libbar.a, the order must be "-lfoo -lbar".
# So we test incrementally, building the list from right to left.
# Dynix/ptx needs: -lsocket -linet -lnsl
# SysV needs: -lsocket -lnsl

dnl TF_DIRS(src, dst[, prefix[, suffix]])
AC_DEFUN(TF_DIRS, [
    if test "${$1}" != "no" && test "${$1}" != ""; then
        for dir in ${$1}; do
            $2="${$2} $3${dir}$4"
        done
    fi
])

TF_DIRS(
    [with_incdirs],
    [CPPFLAGS],
    [-I])
TF_DIRS(
    [with_inclibdirs],
    [CPPFLAGS],
    [-I])
TF_DIRS(
    [with_inclibpfx],
    [CPPFLAGS],
    [-I],
    [/include])

LIBDIRS=""

TF_DIRS(
    [with_libdirs],
    [LIBDIRS],
    [-L])
TF_DIRS(
    [with_inclibdirs],
    [LIBDIRS],
    [-L])
TF_DIRS(
    [with_inclibpfx],
    [LIBDIRS],
    [-L],
    [/lib])

dnl Must append LIBDIRS to LDFLAGS now so it's present for AC_CHECK_LIB.
dnl (LIBDIRS will not work in the OTHER-LIBRARIES argument of AC_CHECK_LIB
dnl on all platforms since it will _follow_ the -l option for the library
dnl being tested.)
LDFLAGS="$LDFLAGS $LIBDIRS"

if test "$ax_cv_c_compiler_vendor" = "gnu"; then
    LDFLAGS="-Wl,--allow-multiple-definition $LDFLAGS"
fi

AC_SEARCH_LIBS(
    [sqrt],
    [m],
    [],
    [AC_MSG_ERROR([TF can not work without math library.])])

AC_SEARCH_LIBS(
    [select],
    [bsd],
    [],
    [AC_MSG_ERROR([TF can not work without select function.])])

# gethostbyname may not be in default libraries.
# QNX keeps gethostbyname in lsocket.
AC_SEARCH_LIBS(
    [gethostbyname],
    [bsd nsl_s nsl resolv socket],
    [],
    [AC_MSG_WARN([Host name resolution will not be available.])])

### If -linet exists, assume we need it.
AC_CHECK_LIB(
    [inet],
    [main])

### If -lnet exists, assume we need it.
AC_CHECK_LIB(
    [net],
    [main])

## If we haven't found connect(), look for -lsocket.
## Note: on IRIX 5, -lsocket exists, but we mustn't use its gethostbyname().
AC_SEARCH_LIBS(
    [connect],
    [socket])

### I'm guessing setlocale() is in libintl on some systems, if not in libc.
AC_SEARCH_LIBS(
    [setlocale],
    [intl],
    [],
    [AC_MSG_WARN([Locales will not be supported.])])

### OpenSSL
if test "$enable_ssl" = "yes"; then
    ok=0
    old_LIBS="$LIBS"
    old_CFLAGS="$CFLAGS"
    old_CPPFLAGS="$CPPFLAGS"
    while true; do
	dnl -lssl needs -lcrypto
	dnl Try in default locations first, then /usr/local/ssl, then try the
        dnl GnuTLS compatibility layer
	LIBS="$LIBS -lssl -lcrypto"
	AC_MSG_CHECKING([for libcrypto and libssl])
	AC_TRY_LINK_FUNC(SSL_new, AC_MSG_RESULT([yes]),
	    CFLAGS="$CFLAGS -L/usr/local/ssl/lib";
	    CPPFLAGS="-I/usr/local/ssl/include $CPPFLAGS";
	    AC_TRY_LINK_FUNC(SSL_new, AC_MSG_RESULT([/usr/local/ssl]),
		LIBS="$old_LIBS -lgnutls-openssl"
		CFLAGS="$old_CFLAGS"
		CPPFLAGS="$old_CPPFLAGS"
		AC_TRY_LINK_FUNC(SSL_new, AC_MSG_RESULT([gnutls]),
		    AC_MSG_RESULT([no]); break)))
	dnl Red Hat 9 and Yellow Dog Linux have ssl.h in a standard place,
	dnl but it depends on krb5.h which isn't in a standard place.
	AC_MSG_CHECKING(for ssl kerberos dependency)
	if test -r /usr/kerberos/include/krb5.h; then
	    AC_MSG_RESULT([yes])
	    CPPFLAGS="-I/usr/kerberos/include $CPPFLAGS"
	else
	    AC_MSG_RESULT([no])
	fi
	AC_CHECK_HEADERS([openssl/ssl.h openssl/err.h openssl/x509v3.h], ok=1,
	    [AC_CHECK_HEADERS([gnutls/openssl.h], [ok=1])])
	if test "$ok" = "1"; then
	    AC_DEFINE(
                [HAVE_SSL],
                [1],
                [SSL enabled])
            AC_CHECK_FUNCS(ERR_peek_error)
	fi
	break
    done
    if test "$ok" = "0"; then
	AC_MSG_WARN([SSL support will not be enabled.])
	LIBS="$old_LIBS"
	CFLAGS="$old_CFLAGS"
	CPPFLAGS="$old_CPPFLAGS"
    fi
fi

if test "$enable_python" = "yes"; then
    AX_PYTHON
    AC_DEFINE(
        [ENABLE_PYTHON],
        [1],
        [python scripting enabled])
    PYTHON_INCLUDES="$PYTHON_INCLUDE_DIRS"
    PYTHON_LIBS="$PYTHON_LIBS"
    AC_SUBST(PYTHON_INCLUDES)
    AC_SUBST(PYTHON_LIBS)
fi

########### terminal ############

if test "$enable_widechar" = "yes"; then
    AX_CHECK_ICU(
        [1],
        [AC_DEFINE(
	    [WIDECHAR],
	    [1],
	    [widechar unicode enabled]
	)],
        [AC_MSG_ERROR([libicuuc not found. Check README or explicitly disable widechar option.])])
    AC_CHECK_HEADERS(
        [wchar.h wctype.h],
       	[],
        [AC_MSG_ERROR([wchar.h and wctype.h not found. Check README or explicitly disable widechar option.])])
fi

terminal_hardcode="TERM_vt100";

if test "$enable_termcap" = "default"; then
    enable_termcap="yes";
fi

if test "$enable_termcap" = "no"; then
    AC_DEFINE_UNQUOTED(
        [HARDCODE],
       	[$terminal_hardcode],
       	[termcap disabled - hardcoding terminal])
else
    if test "$enable_termcap" = "yes"; then enable_termcap=""; fi
    AC_SEARCH_LIBS(
        [tgetent],
       	[$enable_termcap termcap ncurses curses],
        [AC_DEFINE(TERMCAP)],
        [AC_DEFINE_UNQUOTED(
	    [HARDCODE],
	    [$terminal_hardcode])
            AC_MSG_WARN([Hardcoding terminal codes.])])
fi

if test "$enable_mccp" = "yes"; then
    AC_SEARCH_LIBS(
        [inflate],
        [z],
        [AC_DEFINE(ENABLE_MCCP)],
        [AC_MSG_ERROR([libz is required for mccp support, but could not be found])])
    AC_CHECK_HEADERS(
        [zlib.h],
        [AC_DEFINE(ENABLE_MCCP)],
        [AC_MSG_ERROR([zlib.h is required for mccp support, but could not be found])])
fi

AC_SEARCH_LIBS(
    [pcre_compile],
    [pcre],
    [],
    [AC_MSG_ERROR([libpcre is required, but could not be found])])


################################################################
# 7. Checks for headers
################################################################

AC_CHECK_HEADERS([unistd.h memory.h sys/select.h])
AC_HEADER_SYS_WAIT

### For optional language support.
AC_CHECK_HEADERS(
    [locale.h],
    [],
    [AC_MSG_WARN([Locales will not be supported.])])

AC_CHECK_HEADERS(
    [pcre.h],
    [],
    [AC_MSG_ERROR([pcre.h is required, but could not be found])])

### Find pwd.h
AC_CHECK_HEADERS(
    [pwd.h],
    [],
    [AC_MSG_WARN([Filename '~user' expansion will not be supported.])])

dnl TF_SEARCH_HEADERS(SYMBOL, HEADERS... [, DO-IF-FOUND [, DO-IF-NOT-FOUND]])
dnl Searches for each header in HEADERS, and defines SYMBOL to the first one
dnl found.
AC_DEFUN(TF_SEARCH_HEADERS, [
    found=0;
    for f in $2; do
	AC_CHECK_HEADERS([$f],
            AC_DEFINE_UNQUOTED([$1], [<$f>], [$1 defined])
            found=1
            break)
	if test $found -eq 1; then break; fi
    done
    if test $found -eq 1; then
	:; $3
    else
	:; $4
    fi
    unset found
])

### Find internet structure header
TF_SEARCH_HEADERS(
    [NETINET_IN_H],
    [netinet/in.h sys/in.h sys/netinet/in.h],
    [],
    [AC_MSG_WARN([I will use my own internet structures.  Good luck.])])

### Find internet address header
TF_SEARCH_HEADERS(
    [ARPA_INET_H],
    [arpa/inet.h sys/inet.h])

### Find netdb header
TF_SEARCH_HEADERS(
    [NETDB_H],
    [netdb.h sys/netdb.h],
    [] ,
    [AC_MSG_ERROR([can't find netdb.h])])

AC_CACHE_CHECK([whether struct sockaddr has sa_len], tf_cv_sa_len,
    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
#include<sys/types.h>
#include <sys/socket.h>]], [[struct sockaddr sa; return
        sa.sa_len;]])],[tf_cv_sa_len=yes],[tf_cv_sa_len=no]))

if test "${tf_cv_sa_len}" = "yes"; then
    AC_DEFINE(
        [HAVE_SOCKADDR_SA_LEN],
       	[1],
       	[struct sockaddr has sa_len])
fi

### Figure out which terminal driver to use.
AC_CHECK_HEADERS(
    [termios.h termio.h],
    [break])

# Some brain damaged systems (Xenix) need <sys/ptem.h> for struct winsize.
AC_EGREP_HEADER(
    [struct winsize],
    [sys/ptem.h],
    [AC_DEFINE(
        [NEED_PTEM_H],
       	[1],
       	[ptem.h needed])])

################################################################
# 8. Checks for types
################################################################

AC_CHECK_SIZEOF([short])
AC_CHECK_SIZEOF([int])
AC_CHECK_SIZEOF([long])

################################################################
# 9. Checks for structures
#################################################################

################################################################
# 10. Checks for compiler characteristics
#################################################################

################################################################
# 11. Checks for library functions
################################################################

# SCO keeps strftime() in -lintl
AC_FUNC_STRFTIME

# h_errno is a variable, not a function.  But AC_CHECK_FUNCS only checks
# that the symbol is defined, so this works.
AC_CHECK_FUNCS([h_errno])

# required standard functions
AC_CHECK_FUNCS(
    [strstr],
    [],
    [AC_MSG_ERROR([Missing required standard function.])])

# optional functions
AC_CHECK_FUNCS(bcopy bzero connect fileno \
    gethostname gethostbyname getipnodebyname \
    getpwnam gettimeofday hstrerror index inet_aton)

# uncommented functions, presumably all optional
AC_CHECK_FUNCS(kill memcpy memset raise setlocale \
    setrlimit srand srandom strcasecmp strchr \
    strcmpi strcspn strerror stricmp tzset waitpid)

########### networking ############

if test "$enable_getaddrinfo" = "default"; then
    if test `uname -s` = 'Darwin'; then
	AC_MSG_WARN([getaddrinfo() may be broken, so IPv6 support is disabled.  Use --enable-getaddrinfo to override.])
	enable_getaddrinfo=no
    else
	enable_getaddrinfo=yes
    fi
fi
if test "$enable_getaddrinfo" = "no"; then
    enable_inet6=no
else
    AC_CHECK_FUNCS(getaddrinfo gai_strerror)
fi

if test "$enable_inet6" = "yes"; then
    AC_MSG_CHECKING([for IPv6 address structure])
    for type in in6_addr in_addr6; do
	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
#include <sys/types.h>
#include <sys/socket.h>
#include NETINET_IN_H
]],[[
#ifndef AF_INET6
# error AF_INET6 not defined
#endif
	    struct ${type} foo;
	    ]])],[AC_DEFINE_UNQUOTED([IN6_ADDR], [$type], [IN6_ADDR defined])
	    AC_MSG_RESULT($type)
	    break],[])
    done
    AC_DEFINE(
        [ENABLE_INET6],
       	[1],
       	[IPV6 networking enabled])
fi

#################################################################
# 12. System services
#################################################################

### Find mail directory by looking at $MAIL, then in the usual places.
if test "$enable_mailcheck" = "no"; then
    MAILDIR=""
elif test "$enable_mailcheck" = "yes"; then
    AC_MSG_CHECKING([location of mail directory])
    if test -n "$MAIL" ; then
        # Not every system has dirname.  sigh.
        changequote(, )dnl We need brackets for the regexp.
        MAILDIR=`echo $MAIL | sed 's;/[^/]*$;;'`
        changequote([, ])dnl Restore bracket quotes.
    elif test -d /usr/spool/mail ; then
        MAILDIR="/usr/spool/mail"
    elif test -d /var/spool/mail ; then
        MAILDIR="/var/spool/mail"
    elif test -d /usr/mail ; then
        MAILDIR="/usr/mail"
    elif test -d /var/mail ; then
        MAILDIR="/var/mail"
    else
	MAILDIR=""
    fi
    AC_MSG_RESULT([${MAILDIR-(none)}])
else
    MAILDIR="$enable_mailcheck"
fi
if test -n "$MAILDIR"; then
    AC_DEFINE_UNQUOTED(
        [MAILDIR],
       	["$MAILDIR"],
       	[mail enabled])
fi


if test "$enable_version" != "no" && test "$program_suffix" == "NONE"; then
    program_suffix="-${PACKAGE_VERSION}"
fi

dnl The "right" way of using program_transform_name, program_prefix, and
dnl program_suffix expects you to use AC_ARG_PROGRAM here and do transformation
dnl in the Makefile, but we want the values now, so we do it ourselves.
EXENAME="${PACKAGE_EXE}"
test "${program_prefix}" != "NONE" && EXENAME="${program_prefix}${EXENAME}"
test "${program_suffix}" != "NONE" && EXENAME="${EXENAME}${program_suffix}"
if test "${program_transform_name}" != "NONE"; then
    EXENAME=`echo "${EXENAME}" | sed "${program_transform_name}"`
fi
LIBNAME="${EXENAME}-lib"

if test "$enable_symlink" = "no"; then
    SYMLINK=""
elif test "$enable_symlink" = "yes"; then
    SYMLINK='${bindir}/tf'
else
    SYMLINK="$enable_symlink"
fi

if test "$enable_manpage" = "yes"; then
    MANPAGE='man1/'${PACKAGE_EXE}.1
    MANTYPE='nroff'
else
    MANPAGE=''
    MANTYPE=''
fi
AC_SUBST(MANPAGE)
AC_SUBST(MANTYPE)

AC_SUBST(EXENAME)
AC_SUBST(LIBNAME)
AC_SUBST(SYMLINK)

MODE=755
AC_SUBST(MODE)

### Make sure the PATH is sane.
# Ideally, this should be done before the compiler check.  But a compiler
# found now in the extended PATH won't be found in src/Makefile, because it
# won't inherit this PATH.
PATH="$PATH:/bin:/usr/bin:/usr/local/bin:/usr/ucb:/usr/local:/usr/lbin:/etc:/usr/new:/usr/new/bin:/usr/nbin:/usr/ccs/bin"

CPPFLAGS="${CPPFLAGS} -DDATADIR=\${datadir}"
AC_SUBST(CFLAGS)
AC_SUBST(CPPFLAGS)
AC_SUBST(LIBS)
AC_SUBST(OTHER_OBJS)

#################################################################
# 13. Write out AC_CONFIG_FILES
#################################################################

dnl Note: autoconf uses <<EOF, so we use <<END instead.
### Create src/Makefile from pieces.
AC_CONFIG_FILES([Makefile unix/vars.mak src/tfdefs.h])
AC_CONFIG_COMMANDS([default],[
cat >src/Makefile <<END
#### DO NOT EDIT THIS FILE.
#### This src/Makefile was automatically generated by configure.  The correct
#### installation precedure is to run ./configure in the top directory.  You
#### should not edit this file; all configuration changes should be made
#### via arguments to configure.
END
cat unix/vars.mak src/vars.mak unix/unix.mak src/rules.mak >> src/Makefile
],[])

#################################################################
# 14. Write out AC_OUTPUT
#################################################################

AC_OUTPUT

echo "
#####################################################
## prefix: $prefix
## exec_prefix: $exec_prefix
## bindir: $bindir
## datarootdir: $datarootdir
## datadir: $datadir
## executable: \${bindir}/$EXENAME
## library: \${datadir}/$LIBNAME
## manpage: ${mandir}/$MANPAGE
##
## TinyFugue configuration successful.
## Use \"make\" to build.
#####################################################
"
