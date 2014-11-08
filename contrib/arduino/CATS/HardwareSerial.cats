/*
** The prelude for Ardunio
*/

/* ****** ****** */
//
#define \
HardwareSerial_begin_int(Serial, baud) Serial.begin(baud)
#define \
HardwareSerial_begin_ulint(Serial, baud) Serial.begin(baud)
//
#define HardwareSerial_end(Serial) Serial.end()
//
/* ****** ****** */

#define \
HardwareSerial_print_int(Serial, x) Serial.print(x)
#define \
HardwareSerial_print_string(Serial, x) Serial.print(x)
#define \
HardwareSerial_println_string(Serial, x) Serial.print(x)

/* ****** ****** */

/* end of [HardwareSerial.cats] */
