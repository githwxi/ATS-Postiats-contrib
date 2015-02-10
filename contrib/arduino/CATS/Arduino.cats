/*
** The prelude for Ardunio
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_ARDUINO
#define ARDUINO_CATS_ARDUINO

/* ****** ****** */

#include <Arduino.h>

/* ****** ****** */

#define delay_int(ms) delay(ms)
#define delay_ulint(ms) delay(ms)

/* ****** ****** */
//
#define random_int_1(x) random(x)
#define random_int_2(x, y) random(x, y)
#define random_lint_1(x) random(x)
#define random_lint_2(x, y) random(x, y)
//
#define randomSeed_int(x) randomSeed(x)
#define randomSeed_uint(x) randomSeed(x)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_ARDUINO)

/* ****** ****** */

/* end of [Arduino.cats] */
