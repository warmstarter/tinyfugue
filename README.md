TinyyFugue 50ws8
================
================

TinyFugue 50b8 with numerous patches and improvements
=====================================================

General feature list and installation follows. The UTF8 section is
what you probably what everyone should be aware of, so starting with
it for those that tend to skip reading these.

UTF8 setup information
======================

UTF8 Widechar support is enabled by default, but you need to install
libicu to get this to work. It is highly recommended that you use this
as it makes the game experience much much nicer. If this is working,
you will notice immediately as the default status line goes from a
dashed line to a solid line. While I am working on many things with
this client and happy to take requests or bug reports, proper UTF8
is my main personal interest.

On Debian this requires the following packages:
icu-devtools libicu-dev libicu63

You might also need to enable UTF8 support for individual worlds. For
example, when connecting to a RhostMUSH server, this requires you to
set:

@toggle me=utf8

There are tends of thousands of characters this enables, and no one
font supports them all, though the most common core ones tend to be
supported by all. I've found a powerline patched font gives me the
best experience, and there are a number of options available here:

https://github.com/powerline/fonts

This site rates the support of various fonts and allows you to test
specific characters out ahead of time:

https://www.fileformat.info/info/unicode/font/index.htm

Personally, I use DeJa Vu Sans Mono with the powerline patch

Python Setup
============

Setup:

   - autoconf

   - ./configure --enable-python

Python 2.7 or Python 3+ are required for support, as older versions are
missing certain features that this version of TF is targetting. If you need
to run Python 2.1-2.6, it's recommended to use the the stock 50b8 with the
Python patch, available here:

http://sizer99.com/tf/

In the future, Python 2.7 support might be removed if the required featureset
begins to diverge too much.

To run Python, you will need a few pieces of additional software targetting
the specific version f Python you wish to run. On Debian for example, these
would be variants of:

libpython-dev python-cxx-dev python python python-config

Usage:

   - run TinyFugue (tf) and then
       /help tf python

   - scripts are installed in the tf-lib/python directory for a few packaged ones,
     but you can obviously ad our own.

   - Check out tf-lib/python/urlwatch.py for a simple scripting example. This uses
     only a tiny fraction of what you can do, but I've been so busy making
     this patch I haven't had time to write all the scripts I want!

Features and Changes in this version
======================================

This list covers the changes in this version, though some minor details
might have been missed. It will be cleaned up once we're out of
pre-release. Game related changes are documented in tf-help

UTF8 support (--enable-widechar=yes) on by default
UTF8 now default_charset when UTF8 compiled (previously US-ASCII)
PYTHON interpreter support for interfacing with client and macros
PYTHON 2.7 and 3 are both supported (--enable-python) off by default
PYTHON interpreter debugger available (/help tfpy_debug) off by default
/HELP has been spell checked, along with everything else
HTML documentation and html2tf found and returned to repo
ANSI log output (/help ansi_log) off by default
LOGs output prefix, such as timestamp (/help log_prefix) off by default
ERROR output prefix now adjustable (/help error_prefix) '%' by default
UNNAMED worlds not wrapped in () (/help oldunnamed) no-() by default
FG world switching can use TF4 style (/help oldstylefg) off by default
@ALERT picks up on messages that could have been lost
/ as a prefix to /command sends to MU, as opposed to ///command
SSL looks for GNU TLS
ATCP support (--enable-atcp=yes) off by default
GMCP support (--enable-gmcp=yes) off by default
OPTION 102 support (--enable-option102=yes) off by default
MCCP supprt (--enable-mccp) changed to off by default
MCCP protocol lockup issue resolved
RFC 2066 compliance for Telnet Charset Negotiation
PCRE unbundled and now can use system libraries
GCC 10 and CLANG support
64-bit crash issues resolved
MULTI-address hostname crash issue resolved
OS X compile issues resolved
BUFFERS increased to reflect more modern computing resources
GZIP now standard for file compression (COMPRESS_SUFFIX)
TF-LIB being updated and modernized (see tf-lib/README)

Plus numerous bug fixes, clean-up, and needed code base
clean-up and modernization.

Significant effort has been put into finding the various community
patches for TF50b8 and integrating them all into one place. There
are still several patches in the queue waiting to be examined and
then potentially applied.

In addition, new work has been added to this code base and will
probably continue to be for some time. The intention is to make sure
a well loved piece of software is still able to be run on modern
platforms and future platforms, increased stability, and then lastly
to add some additional features in-line with the existing codebase.

Similar efforts are being done with TinyFugue Macros, and some may later
be integrated into tf-lib:

https://github.com/warmstarter/tinyfugue-scripts

Deprecations:

NO_FLOAT deprecated. This has been broken for over a decade and has little
purpose on modern computer systems.

OS/2 deprecated. This was not being maintained and likely not used by anyone.
If needed the old sources are in the git history.

CYGWIN deprecated in favor of WSL for Windows, to better keeps platofmrs
in-sync and remove issues.

BeOS deprecated as likely no longer used. Should still compile, but might
require some modifications for installation of binary, no way to test.

SOCKS deprecated as it was broken and mostly removed anyway. Very little
use in modern world and can be handled by a separate application.

NO_HISTORY and NO_PROCESS options deprecated as modern systems can handle
them just fine. If you don't use these features, you can simply ignore
them or use the existing tfrc options to set things like histsize to 0.

systype is deprecated and removed, as all modern platforms support
unix-like features (this mostly relates to OS/2 deprecation)

auto_fg was already deprecated, now fully removed.

oldstyle filenames are deprecated in favor of newstyle, can always be
changed manually, newstyle was the default.

ancient bad keyboards no ones uses anymore no longer supported. If needed
the .tf files can be founds in the git archive

.tinytalk deprecated and seemed to be broken anyway.

RECEIVELIMIT check no longer works, as there's really no meaningful way to do
it. This number was raised so high for servers using 102+ACTP+etc.. That it's
no longer meaningful. On some servers 256+ bytes is broken subnegotiation,
on others 32K+ is broken subnegotiation. Likely someday it will be 64K+.

======

Unicode notes:
  "Release" is the branch you want.
  On Debian or Ubuntu, make sure you apt-get libicu-dev before running
  ./configure.
  There is a known and easily triggered bug: The backspace, delete, and
  arrow keys move by bytes, not by characters. For now, editing a line
  with multibyte characters will send XML hexadecimal escape codes
  if unencodeable bytes are in the input box.
  I will gladly accept pull requests.

  Setting your terminal to send ^H instead of ^? for backspace mitigates
  some, but not all of the backspace issues.

  For servers that don't negotiate charsets, /set default_charset=NAME
  before defining a world with /addworld or /test addworld(). I recommend
  putting /set default_charset=Latin-1 at the top of your worlds.tf.

======


Credits
-------

This fork of TinyFugue is currently being maintained by wstarter.
It also includes assorted patches developed by various community members
in the years since TF saw saw it's final release. More complete credits
will be added as this moves out of pre-release

TinyFugue is Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)

For a long time TinyFugue was written, maintained, and copyrighted
by Ken Keys ("Hawkeye"), who can be reached by email at kkeys@ucsd.edu.
His final release was 50b8 in January 2007, but he is still active
in giving support at https://sourceforge.net/p/tinyfugue

TinyFugue versions 1.5.3 and earlier were written by Greg Hudson
("Explorer_Bob"), without whom I would have never gotten into this mess.

TinyFugue was initially derived from tinytalk, a unix client written by
Anton Rang ("Tarrant") and modified by Leo Plotkin ("Grod").

Additional thanks to Jeff Prothero ("Cynbe"), Bruce Sterling Woodcock
("Bruce"), David Moore ("OliverJones"), Ben Jackson ("Ben"), the mudders of
glia.biostr.washington.edu, and everyone else who tested, found bugs,
or came up with suggestions, and to Jim Lick ("Jingoro") for providing
tcp.com services.

============================================
TinyFugue for Mac OS X

You must have developer tools installed on your system, and of course
this is setup and used through Terminal or an equivalent program. I
hear most people think iTerm2 is the way to go, should you want more
features in your terminal emulator.

----------------------------------------------------------------

TinyFugue for Win32

The likely best option for running TinyFugue under Windows is to
get 'Windows Subsystem for Linux'. This should be straight-forward
and give you an almost identical experience to a TinyFugue on UNIX
like systems, but it has not yet been tested.

https://docs.microsoft.com/en-us/windows/wsl/install-win10

======================================================================

Installing TinyFugue
--------------------

TinyFugue should work on any Unix-like system that has an ANSI compiler
and BSD-style select().  This includes almost everything except some old
SVR3-like systems which either do not have select(), or have a select()
that works only on STREAMS devices but not terminals.

Installing TinyFugue is quite easy on most Unix-like systems.
In the top directory, execute these commands:
  autoconf
  ./configure
  make
  make install

The configure script will attempt to figure out everything it needs to
know about your system and install all files in their proper location.
If you have any problems, or want to change a default installation
option, be sure to read the rest of this file.

In addition to the usual GNU configure options, TinyFugue's configure script
has these options:

Optional Features:
  --disable-option-checking  ignore unrecognized --enable/--with options
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
  --enable-version        insert version number into names of installed files
  --enable-symlink=NAME   make a symlink NAME to the executable
  --enable-core           enable core dumps for debugging
  --disable-ssl           disable SSL connections
  --disable-getaddrinfo   disable getaddrinfo implies --disable-inet6
  --disable-inet6         disable IPv6 network support
  --disable-256colors     disable 256 color support
  --enable-python         enable python interpreter for scripting
  --disable-widechar      disable wide character UTF-8 support
  --disable-termcap       use hardcoded vt100 codes instead of termcap
  --enable-termcap=LIB    enable termcap with library LIB (e.g., "ncurses")
                          (needed only if configure guesses incorrectly)
  --disable-mailcheck     disable mail checking
  --enable-mailcheck=DIR  enable checking for mail in directory DIR (needed
                          only if configure guesses incorrectly)
  --enable-atcp           enable ATCP protocol support
  --enable-gmcp           enable GMCP protocol support
  --enable-option102      enable option102 protocl support

For a complete list of options, run "./configure --help".

The following environment variables are meaningful to configure.  Their
default values are listed in brackets after the description.  They can
be set on the command line like this:
  env CPPFLAGS=-I/my/include ./configure

  CC		C compiler ["gcc" or "cc"]
  CFLAGS	Options for C compiler ["-g -O2" or "-O2" for gcc,
		"-g" for others]
  CPPFLAGS	Options for C preprocessor (e.g. -I) [""]
  LIBS		"-l" and "-L" options for the linker (in addition to the ones
		determined automatically by configure).

Example:
If your system has SSL libraries and headers installed in
/usr/local/SSL/{lib,include}, use the "--with-inclibpfx=/usr/local/SSL"
option with configure.

File Locations
--------------

If you do not define the file prefix with ./configure --prefix=PREFIX,
configure will choose a prefix:

   "/usr/local" if you can write to /usr/local/bin and /usr/local/share;
   otherwise, $HOME.

The executable is installed in ${bindir}; the macro libraries are installed
in ${datadir}.  These can be modified with the standard configure options
--bindir, --datadir, and --prefix.

If --enable-version is given, the tf executable and library directory will
have a version number embedded in their names (e.g., PREFIX/bin/tf-50a1 and
PREFIX/lib/tf-50a1-lib).  This is useful if you want to keep old versions
around.  To create a symlink from "tf" to the actual executable, use
--enable-symlink (this is not implied by --enable-version, as in earlier
releases).

There is no man page for tf.  For basic usage options, run "tf -?".  For
more information, use "/help" within tf.

If you move or rename any files after installing (this includes copying
TF to another machine where the file paths are different), you must let
TF know.  To do this without reinstalling, you can set the environment variable
TFLIBDIR to the new path before running tf, or run tf with the -L option.
This can be done with a shell script like this:

    #! /bin/sh
    exec /new/location/bin/tf -L"/new/location/lib/tf-lib" "$@"

The variables TFHELP and TFLIBRARY can also be set in the environment,
but this should not normally be necessary, since their default values are
based on TFLIBDIR.

If you want build tf for installation in one directory ("{FINAL}"), but you
want to be able to test it by installing it in another directory ("{TEMP}")
first, do:
    ./configure --prefix={FINAL}
    make
    env prefix={TEMP} make -e install
Then, you can test tf by running
    {TEMP}/bin/tf -L{TEMP}/lib
When you are satisfied it works, do
    make install
to install tf in {FINAL}.


"Make" options
--------------

Options are not available on all systems.  To use an option, give it as
an argument to the installation program (e.g., "make clean").

 all		Compile, but do not install (the "install" option should be
			run later to install the files).
 install	Compile (if you haven't already) and install.  The default
			installation locations depend on the operating system.
 clean		Remove object files and other junk from source directory.
 uninstall	Remove tf executable, help files, and library from their
			installed locations.


Public Installation
-------------------

Some features of TF can be disabled for secure public installation, by
using one of these /restrict commands in %{TFLIBDIR}/local.tf:

    /restrict SHELL  Prevents all access to shell or external commands.
                     Disables TF builtins "/sh" and "/quote !", and
                     uncompression during /load and /help.

    /restrict FILE   Prevents reading and writing of files.  Disables
                     TF builtins "/load", "/save", "/saveworld", "/log",
                     and "/quote '", and sockmload feature.
                     Implies /restrict shell.

    /restrict WORLD  Prevents the user from defining new worlds and
                     connecting to undefined worlds.  TF builtins
                     /addworld and the "/world <host> <port>" semantics
                     are disabled.  Implies /restrict file.

If you have write permission in /usr/local/bin and /usr/local/lib, TinyFugue
will be installed there by default.  Or you can change the locations by using
the options described above.  The Makefile will then put all files in their
proper location with the proper permissions.

Some features of TF can be disabled for secure public installation, by using
the /restrict commands in %{TFLIBDIR}/local.tf.

Terminal Handling
-----------------

If the default terminal handling option does not work, tf can be
configured to use vt100 codes or nothing at all.

On a UNIX-like system, ./configure will try to find a termcap-compatible library
in this order: the one specified in --enable-termcap=LIB, if any; termcap;
ncurses; curses.  If none of those work, tf will use hardcoded vt100 codes.

You will be much, much happier not using a hardcoded situation. The proper
libraries should be available on any modern system. If for some reason you
find you are stuck in hardcoded mode after having installed appropriate libs,
create an issue with system details so this can be looked into. hardcoded
is ancient and undesirable enough that it might likely stop being supported
in the future.

Compression
-----------

If you are short on disk space, you can compress the helpfile and
library files (except stdlib.tf).  Make sure the COMPRESS_SUFFIX
and COMPRESS_READ macros are set correctly; set them in the
%{TFLIBDIR}/local.tf file if needed.  Note that compression can not
be used if /restrict is used.


Firewalls
---------

TF can be made to connect through a generic proxy server by setting
the %proxy_host variable at runtime.  See "/help proxy".

Also see the README file in the subdirectory corresponding to your
operating system to see if tf has transparent firewall support on your
system.


Installation Problems
---------------------

The ./configure script can usually figure out everything it needs to
know to configure TinyFugue for your unix-like system.  But if it fails
because your system is non-standard, you may need to change some environment
variables or disable some features.

If you run into issues with a specific platform, please put details into the
issue tracker. I will work to make everything work more automatically, but
some issues are outside the scope of TF. Common problems and their fixes will
be noted.


