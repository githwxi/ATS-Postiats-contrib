/*
** EEPROM library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_EEPROM
#define ARDUINO_CATS_EEPROM

/* ****** ****** */

#include <EEPROM.h>

/* ****** ****** */
//
#define \
EEPROM_read(p0, a) \
  (static_cast<EEPROMClass*>(p0))->read(a)
#define \
EEPROM_write(p0, a, x) \
  (static_cast<EEPROMClass*>(p0))->write(a, x)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_EEPROM)

/* ****** ****** */

/* end of [EEPROM.cats] */
