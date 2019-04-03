/* ****** ****** */
//
// API in ATS for X11
// Author: Ryan King <rtking@bu.edu>
//
/* ****** ****** */

#ifndef ATSCNTRB_X11_CATS
#define ATSCNTRB_X11_CATS

#include "Xlib.cats"

/* ****** ****** */

// Functions

/* ****** ****** */

void XClientSetMessageChar(XClientMessageEvent* xclient, int i, char x) {
  if (i < 20) xclient->data.b[i] = x;
}

void XClientSetMessageShort(XClientMessageEvent* xclient, int i, short x) {
  if (i < 10) xclient->data.s[i] = x;
}

void XClientSetMessageLong(XClientMessageEvent* xclient, int i, long x) {
  if (i < 5) xclient->data.l[i] = x;
}


/* ****** ****** */

#endif

/* End of [X11.cats] */
