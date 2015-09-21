/*
** LedControl library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_LED_CONTROL
#define ARDUINO_CATS_LED_CONTROL

/* ****** ****** */

#include <LedControl.h>

/* ****** ****** */
//
#define \
LedControl_getDeviceCount(led) \
  (static_cast<LedControl*>(led))->getDeviceCount()
//
/* ****** ****** */
//
#define \
LedControl_shutdown(led, addr, status) \
  (static_cast<LedControl*>(led))->shutdown(addr, status)
//
/* ****** ****** */
//
#define \
LedControl_setScanLimit(led, addr, limit) \
  (static_cast<LedControl*>(led))->setScanLimit(addr, limit)
#define \
LedControl_setIntensity(led, addr, value) \
  (static_cast<LedControl*>(led))->setIntensity(addr, value)
//
/* ****** ****** */
//
#define \
LedControl_clearDisplay(led, addr) \
  (static_cast<LedControl*>(led))->clearDisplay(addr)
//
/* ****** ****** */
//
#define \
LedControl_setLed(led, addr, row, col, state) \
  (static_cast<LedControl*>(led))->setLed(addr, row, col, state)
//
/* ****** ****** */
//
#define \
LedControl_setRow(led, addr, row, value) \
  (static_cast<LedControl*>(led))->setRow(addr, row, value)
#define \
LedControl_setColumn(led, addr, col, value) \
  (static_cast<LedControl*>(led))->setColumn(addr, col, value)
//
/* ****** ****** */
//
#define \
LedControl_setChar(led, addr, digit, value, dp) \
  (static_cast<LedControl*>(led))->setChar(addr, digit, value, dp)
#define \
LedControl_setDigit(led, addr, digit, value, dp) \
  (static_cast<LedControl*>(led))->setDigit(addr, digit, value, dp)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_LED_CONTROL)

/* ****** ****** */

/* end of [LedControl.cats] */
