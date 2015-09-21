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
LedControl_shutdown(led) (static_cast<LedControl*>(led))->shutdown()
//
/* ****** ****** */
//
#define \
LedControl_setScanLimit(led) (static_cast<LedControl*>(led))->setScanLimit()
#define \
LedControl_setIntensity(led) (static_cast<LedControl*>(led))->setIntensity()
//
/* ****** ****** */
//
#define \
LedControl_clearDisplay(led) (static_cast<LedControl*>(led))->clearDisplay()
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_LED_CONTROL)

/* ****** ****** */

/* end of [LedControl.cats] */
