/*
** HttpClient library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_BRIDGE_HTTPCLIENT
#define ARDUINO_CATS_BRIDGE_HTTPCLIENT

/* ****** ****** */

#include <HttpClient.h>

/* ****** ****** */

typedef HttpClient *HttpClient_ptr;

/* ****** ****** */
//
#define \
HttpClient_ready(p0) \
  (static_cast<HttpClient*>(p0))->ready()
//
#define \
HttpClient_available(p0) \
  (static_cast<HttpClient*>(p0))->available()
//
#define \
HttpClient_getResult(p0) \
  (static_cast<HttpClient*>(p0))->getResult()
//
#define \
HttpClient_checkSSL(p0) \
  (static_cast<HttpClient*>(p0))->checkSSL()
#define \
HttpClient_noCheckSSL(p0) \
  (static_cast<HttpClient*>(p0))->noCheckSSL()
//
/* ****** ****** */

#define \
HttpClient_get_string(p0, url) \
  (static_cast<HttpClient*>(p0))->get(url)
#define \
HttpClient_getAsynchronously_string(p0, url) \
  (static_cast<HttpClient*>(p0))->getAsynchronously(url)

/* ****** ****** */

#define \
HttpClient_post_string(p0, url, data) \
  (static_cast<HttpClient*>(p0))->post(url, data)
#define \
HttpClient_postAsynchronously_string(p0, url, data) \
  (static_cast<HttpClient*>(p0))->postAsynchronously(url, data)

/* ****** ****** */
//
#define \
HttpClient_setHeader_string(p0, header) \
  (static_cast<HttpClient*>(p0))->setHeader(header)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_BRIDGE_HTTPCLIENT)

/* ****** ****** */

/* end of [HttpClient.cats] */
