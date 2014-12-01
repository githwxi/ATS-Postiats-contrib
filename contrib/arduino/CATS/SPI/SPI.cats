/*
** SPI library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_SPI
#define ARDUINO_CATS_SPI

/* ****** ****** */

#include <SPI.h>

/* ****** ****** */

#define SPI_ptr (&SPI)

/* ****** ****** */
//
#define \
SPI_end(p0) (static_cast<SPIClass*>(p0))->end()
#define \
SPI_begin(p0) (static_cast<SPIClass*>(p0))->begin()
//
/* ****** ****** */
//
#define \
SPI_attachInterrupt(p0) \
  (static_cast<SPIClass*>(p0))->attachInterrupt()
#define \
SPI_detachInterrupt(p0) \
  (static_cast<SPIClass*>(p0))->detachInterrupt()
//
/* ****** ****** */
//
#define \
SPI_setBitOrder(p0, x) (static_cast<SPIClass*>(p0))->setBitOrder(x)
#define \
SPI_setDataMode(p0, x) (static_cast<SPIClass*>(p0))->setDataMode(x)
#define \
SPI_setClockDivider(p0, x) (static_cast<SPIClass*>(p0))->setClockDivider(x)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_SPI)

/* ****** ****** */

/* end of [SPI.cats] */
