/* ****** ****** */
//
// For AVR programming
//
/* ****** ****** */

#ifndef AVR_CATS_AVR_IOM328P
#define AVR_CATS_AVR_IOM328P

/* ****** ****** */

/*
#include <avr/iom328p.h> // see: io.h
*/

/* ****** ****** */

#define \
reg8_get_at(r, i) ((r)&(1 << i))
#define \
reg8_set0_at(r, i) (r &= ~(1 << i))
#define \
reg8_set1_at(r, i) (r |=  (1 << i))
//
#define \
reg8_set_at(r, i, b) \
do { \
  if (b) reg8_set1_at(r, i); else reg8_set0_at(r, i); \
} while(0) // end of [reg8_set_at]
//
/* ****** ****** */

#endif // end of [AVR_CATS_AVR_IOM328P]

/* ****** ****** */

/* end of [avr/iom328p.cats] */
