#ifndef TFPYTHON_H
#define TFPYTHON_H

#ifdef TFPYTHON

#include "Python.h"
#include "tfconfig.h"
#include "port.h"
#include "tf.h"
#include "util.h"
#include "pattern.h"
#include "search.h"
#include "tfio.h"
#include "cmdlist.h"
#include "command.h"
#include "world.h"	/* World, find_world() */
#include "socket.h"	/* openworld() */
#include "output.h"	/* oflush(), dobell() */
#include "attr.h"
#include "macro.h"
#include "keyboard.h"	/* find_key(), find_efunc() */
#include "expand.h"     /* macro_run() */
#include "signals.h"    /* suspend(), shell() */
#include "variable.h"

struct Value *handle_python_function( conString *args );
struct Value *handle_python_command( String *args, int offset );
struct Value *handle_python_kill_command( String *args, int offset );
struct Value *handle_python_call_command( String *args, int offset );
struct Value *handle_python_load_command( String *args, int offset );

#endif

#endif
