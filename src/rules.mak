########################################################################
#  TinyFugue - programmable mud client
#  Copyright (C) 1993-2007 Ken Keys (kenkeys@users.sourceforge.net)
#
#  TinyFugue (aka "tf") is protected under the terms of the GNU
#  General Public License.  See the file "LICENSE" for details.
########################################################################

#### This is missing some of the newer source files, and is not
#### really up to date.

# Predefined variables:
#   SYS          - required system type (unix)
#   O            - required object suffix (e.g., "o" or "obj")
#   BUILDERS     - optional list of system-specific dependencies

attr.$(O): attr.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h output.h attr.h variable.h parse.h \
  opcodes.h $(BUILDERS)
command.$(O): command.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h cmdlist.h command.h world.h socket.h \
  output.h attr.h macro.h keyboard.h expand.h signals.h variable.h $(BUILDERS)
dstring.$(O): dstring.c tfconfig.h tfdefs.h port.h malloc.h tf.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h signals.h $(BUILDERS)
expand.$(O): expand.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h macro.h signals.h socket.h keyboard.h \
  parse.h opcodes.h expand.h expr.h cmdlist.h command.h variable.h $(BUILDERS)
expr.$(O): expr.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h macro.h signals.h socket.h output.h \
  attr.h keyboard.h parse.h opcodes.h expand.h expr.h cmdlist.h command.h \
  variable.h tty.h history.h world.h funclist.h $(BUILDERS)
help.$(O): help.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h search.h pattern.h \
  tfio.h cmdlist.h variable.h $(BUILDERS)
history.$(O): history.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h history.h socket.h world.h output.h \
  attr.h macro.h cmdlist.h keyboard.h variable.h signals.h $(BUILDERS)
keyboard.$(O): keyboard.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h macro.h keyboard.h output.h history.h \
  expand.h cmdlist.h variable.h keylist.h $(BUILDERS)
macro.$(O): macro.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h world.h macro.h keyboard.h expand.h \
  socket.h output.h attr.h cmdlist.h command.h parse.h opcodes.h \
  variable.h $(BUILDERS)
main.$(O): main.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h history.h world.h socket.h macro.h \
  output.h attr.h signals.h command.h keyboard.h variable.h tty.h \
  expand.h expr.h process.h $(BUILDERS)
makehelp.$(O): makehelp.c $(BUILDERS)
malloc.$(O): malloc.c tfconfig.h tfdefs.h port.h signals.h malloc.h $(BUILDERS)
output.$(O): output.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h socket.h output.h attr.h macro.h tty.h \
  variable.h expand.h parse.h opcodes.h keyboard.h cmdlist.h $(BUILDERS)
pattern.$(O): pattern.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h $(BUILDERS)
process.$(O): process.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h history.h world.h process.h socket.h \
  expand.h cmdlist.h output.h signals.h $(BUILDERS)
search.$(O): search.c tfconfig.h tfdefs.h port.h malloc.h search.h $(BUILDERS)
signals.$(O): signals.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h world.h process.h tty.h output.h \
  signals.h variable.h expand.h $(BUILDERS)
socket.$(O): socket.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h tfselect.h history.h world.h socket.h \
  output.h attr.h process.h macro.h keyboard.h cmdlist.h command.h \
  signals.h variable.h $(BUILDERS)
tfio.$(O): tfio.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h tfselect.h output.h attr.h macro.h \
  history.h signals.h variable.h keyboard.h expand.h cmdlist.h $(BUILDERS)
timers.$(O): timers.c tfconfig.h tfdefs.h port.h malloc.h search.h $(BUILDERS)
tty.$(O): tty.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h globals.h \
  varlist.h enumlist.h hooklist.h util.h search.h tty.h output.h macro.h \
  variable.h $(BUILDERS)
util.$(O): util.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h output.h tty.h signals.h variable.h \
  parse.h opcodes.h $(BUILDERS)
variable.$(O): variable.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h output.h attr.h socket.h cmdlist.h \
  process.h expand.h parse.h opcodes.h variable.h $(BUILDERS)
world.$(O): world.c tfconfig.h tfdefs.h port.h tf.h malloc.h dstring.h \
  globals.h varlist.h enumlist.h hooklist.h util.h pattern.h \
  search.h tfio.h history.h world.h process.h macro.h \
  cmdlist.h socket.h output.h $(BUILDERS)
