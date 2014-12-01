/*
** Bridge library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_BRIDGE_BRIDGE
#define ARDUINO_CATS_BRIDGE_BRIDGE

/* ****** ****** */

#include <Bridge.h>

/* ****** ****** */

#define Bridge_ptr (&Bridge)

/* ****** ****** */
//
#define \
Bridge_begin(p0) \
  (static_cast<BridgeClass*>(p0))->begin()
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_BRIDGE_BRIDGE)

/* ****** ****** */

/* end of [Bridge.cats] */
