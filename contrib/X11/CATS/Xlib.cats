/* ****** ****** */
//
// API in ATS for X11
// Author: Ryan King <rtking@bu.edu>
//
/* ****** ****** */

#ifndef ATSCNTRB_X11_XLIB_CATS
#define ATSCNTRB_X11_XLIB_CATS

#include <X11/keysym.h>
#include <X11/keysymdef.h>
#include <X11/X.h>
#include <X11/Xlib.h>

/* ****** ****** */

// Function Definitions

/* ****** ****** */

/* General */

#define atscntrb_X11_XInternAtom           XInternAtom
#define atscntrb_X11_XAllocNamedColor      XAllocNamedColor

/* Display */

#define atscntrb_X11_XOpenDisplay          XOpenDisplay
#define atscntrb_X11_XCloseDisplay         XCloseDisplay
#define atscntrb_X11_XDisplayWidth         XDisplayWidth
#define atscntrb_X11_XDisplayHeight        XDisplayHeight
#define atscntrb_X11_XConnectionNumber     XConnectionNumber
#define atscntrb_X11_XDefaultColormap      XDefaultColormap
#define atscntrb_X11_XDefaultScreen        XDefaultScreen

/* Window */

#define atscntrb_X11_XRaiseWindow          XRaiseWindow
#define atscntrb_X11_XMapWindow            XMapWindow
#define atscntrb_X11_XUnmapWindow          XUnmapWindow
#define atscntrb_X11_XConfigureWindow      XConfigureWindow
#define atscntrb_X11_XMoveResizeWindow     XMoveResizeWindow
#define atscntrb_X11_XSetWindowBorder      XSetWindowBorder
#define atscntrb_X11_XSetWindowBorderWidth XSetWindowBorderWidth
#define atscntrb_X11_XDestroySubwindows    XDestroySubwindows

/* Events */

#define atscntrb_X11_XSendEvent            XSendEvent
#define atscntrb_X11_XNextEvent            XNextEvent
#define atscntrb_X11_XKeysymToKeycode      XKeysymToKeycode
#define atscntrb_X11_XKeycodeToKeysym      XKeycodeToKeysym
#define atscntrb_X11_XGrabKey              XGrabKey
#define atscntrb_X11_XUngrabKey            XUngrabKey
#define atscntrb_X11_XSelectInput          XSelectInput
#define atscntrb_X11_XSetInputFocus        XSetInputFocus

/* ****** ****** */

#endif

/* End of [X11.cats] */
