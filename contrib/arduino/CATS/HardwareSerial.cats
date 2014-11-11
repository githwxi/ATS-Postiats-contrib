/*
** The prelude for Ardunio
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_HARDWARE_SERIAL
#define ARDUINO_CATS_HARDWARE_SERIAL

/* ****** ****** */

#include <HardwareSerial.h>

/* ****** ****** */
//
#define \
HardwareSerial_begin_int(p0, baud) \
  (static_cast<HardwareSerial*>(p0))->begin(baud)
#define \
HardwareSerial_begin_ulint(p0, baud) \
  (static_cast<HardwareSerial*>(p0))->begin(baud)
//
#define HardwareSerial_end(p0) (static_cast<HardwareSerial*>(p0))->end()
//
/* ****** ****** */
//
#define \
HardwareSerial_print_int(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_uint(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_lint(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_ulint(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_char(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_uchar(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_double(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
#define \
HardwareSerial_print_string(p0, x) (static_cast<HardwareSerial*>(p0))->print(x)
//
#define \
HardwareSerial_println(p0) (static_cast<HardwareSerial*>(p0))->println()
#define \
HardwareSerial_println_int(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_uint(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_lint(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_ulint(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_char(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_uchar(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_double(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
#define \
HardwareSerial_println_string(p0, x) (static_cast<HardwareSerial*>(p0))->println(x)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_HARDWARE_SERIAL)

/* ****** ****** */

/* end of [HardwareSerial.cats] */
