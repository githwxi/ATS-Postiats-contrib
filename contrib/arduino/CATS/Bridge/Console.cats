/*
** Console library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_BRIDGE_CONSOLE
#define ARDUINO_CATS_BRIDGE_CONSOLE

/* ****** ****** */

#include <Console.h>

/* ****** ****** */

#define Console_ptr (&Console)

/* ****** ****** */
//
#define \
Console_begin(p0) \
  (static_cast<ConsoleClass*>(p0))->begin()
//
#define \
Console_end(p0) (static_cast<ConsoleClass*>(p0))->end()
//
/* ****** ****** */
//
#define \
Console_connected(p0) \
  (static_cast<ConsoleClass*>(p0))->connected()
//
/* ****** ****** */
//
#define \
Console_available(p0) \
  (static_cast<ConsoleClass*>(p0))->available()
//
/* ****** ****** */
//
#define \
Console_read(p0) (static_cast<ConsoleClass*>(p0))->read()
#define \
Console_peek(p0) (static_cast<ConsoleClass*>(p0))->peek()
//
/* ****** ****** */
//
#define \
Console_write_char(p0, char) \
  (static_cast<ConsoleClass*>(p0))->write_char(p0, char)
//
/* ****** ****** */
//
#define \
Console_flush(p0) (static_cast<ConsoleClass*>(p0))->flush()
//
/* ****** ****** */
//
#define \
Console_print_int(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_uint(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_lint(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_ulint(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_char(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_uchar(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_double(p0, x) (static_cast<ConsoleClass*>(p0))->print(x)
#define \
Console_print_string(p0, x) (static_cast<ConsoleClass*>(p0))->print((char*)x)
//
#define \
Console_println(p0) (static_cast<ConsoleClass*>(p0))->println()
#define \
Console_println_int(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_uint(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_lint(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_ulint(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_char(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_uchar(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_double(p0, x) (static_cast<ConsoleClass*>(p0))->println(x)
#define \
Console_println_string(p0, x) (static_cast<ConsoleClass*>(p0))->println((char*)x)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_BRIDGE_CONSOLE)

/* ****** ****** */

/* end of [Console.cats] */
