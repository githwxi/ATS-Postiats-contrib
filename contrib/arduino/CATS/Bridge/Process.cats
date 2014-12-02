/*
** Process library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_BRIDGE_PROCESS
#define ARDUINO_CATS_BRIDGE_PROCESS

/* ****** ****** */

#include <Process.h>

/* ****** ****** */
//
#define \
Process_started(p0) \
  (static_cast<Process*>(p0))->started()
//
/* ****** ****** */
//
#define \
Process_run(p0) \
  (static_cast<Process*>(p0))->run()
#define \
Process_runAsynchronously(p0) \
  (static_cast<Process*>(p0))->runAsynchronously()
//
/* ****** ****** */
//
#define \
Process_runShellCommandAsynchronously(p0, command) \
  (static_cast<Process*>(p0))->runShellCommandAsynchronously(command)
//
/* ****** ****** */
//
#define \
Process_running(p0) \
  (static_cast<Process*>(p0))->running()
//
/* ****** ****** */
//
#define \
Process_close(p0) \
  (static_cast<Process*>(p0))->close()
//
/* ****** ****** */
//
#define \
Process_exitValue(p0) \
  (static_cast<Process*>(p0))->exitValue()
//
/* ****** ****** */
//
#define \
Process_available(p0) \
  (static_cast<Process*>(p0))->available()
//
/* ****** ****** */
//
#define \
Process_read(p0) (static_cast<Process*>(p0))->read()
#define \
Process_peek(p0) (static_cast<Process*>(p0))->peek()
//
/* ****** ****** */
//
#define \
Process_write_char(p0, char) \
  (static_cast<Process*>(p0))->write_char(p0, char)
//
/* ****** ****** */
//
#define \
Process_flush(p0) (static_cast<Process*>(p0))->flush()
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_BRIDGE_PROCESS)

/* ****** ****** */

/* end of [Process.cats] */
