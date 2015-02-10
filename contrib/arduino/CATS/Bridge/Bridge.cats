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
//
#define \
SerialBridge_begin(p0) \
  (static_cast<SerialBridgeClass*>(p0))->begin()
//
/* ****** ****** */
//
#define \
SerialBridge_put_string(p0, k, v) \
  (static_cast<SerialBridgeClass*>(p0))->put((char*)k, (char*)v)
//
#define \
SerialBridge_get_buffer(p0, k, buf, bsz) \
  (static_cast<SerialBridgeClass*>(p0))->get((char*)k, buf, bsz)
//
/* ****** ****** */
//
#define \
SerialBridge_TRANSFER_TIMEOUT(p0) \
  (static_cast<SerialBridgeClass*>(p0))->TRANSFER_TIMEOUT
//
/* ****** ****** */
//
#define \
SerialBridge_getBridgeVersion(p0) \
  (static_cast<SerialBridgeClass*>(p0))->getBridgeVersion()
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_BRIDGE_BRIDGE)

/* ****** ****** */

/* end of [Bridge.cats] */
