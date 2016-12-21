(* ****** ****** *)
//
// API in ATS for X11
// Author: Ryan King <rtking@bu.edu>
//
// Xlib.sats: X11 Structure and Functions
//
(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/HATS/atslib_staload_libats_libc.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

#include "./X.sats"

#define Status int

(* ****** ****** *)

// Pointer Structures

(* ****** ****** *)

(* Display Pointer *)

absvtype Display_ptr (l:addr) = ptr(l)
vtypedef Display_ptr0 = [l:agez] Display_ptr(l)
vtypedef Display_ptr1 = [l:addr | l > null] Display_ptr(l)

fun Display_ptr_is_null{l:addr} (dpy_p: !Display_ptr(l)): bool (l == null) =
  "atspre_ptr_is_null"
fun Display_ptr_isnot_null{l:addr} (dpy_p: !Display_ptr(l)): bool (l > null) =
  "atspre_ptr_isnot_null"

overload iseqz with Display_ptr_is_null
overload isneqz with Display_ptr_isnot_null

(* Screen Pointer *)

absvtype Screen_ptr (l:addr) = ptr(l)
vtypedef Screen_ptr0 = [l:agez] Screen_ptr(l)
vtypedef Screen_ptr1 = [l:addr | l > null] Screen_ptr(l)

(* Visual Pointer *)

absvtype Visual_ptr (l:addr) = ptr(l)
vtypedef Visual_ptr0 = [l:agez] Visual_ptr(l)
vtypedef Visual_ptr1 = [l:addr | l > null] Visual_ptr(l)

(* Graphics Content Pointer *)

absvtype GC_ptr (l:addr) = ptr(l)
vtypedef GC_ptr0 = [l:agez] GC_ptr(l)
vtypedef GC_ptr1 = [l:addr | l > null] GC_ptr(l)

(* ****** ****** *)

// General

(* ****** ****** *)

(* Structures *)

typedef XColor = $extype_struct "XColor" of {
  pixel= ulint,
  red = usint, green= usint, blue= usint,
  flags= char, pad= char
}

(* Functions *)

fun XInternAtom{l:agz}(Display_ptr(l), string, bool): Atom = "mac#%"

fun XAllocNamedColor{l:agz}(
  !Display_ptr(l), Colormap, string, &XColor? >> opt (XColor, i <> 0),
  &XColor? >> opt (XColor, i <> 0)
): #[i:int] Status(i) = "mac#%"

(* ****** ****** *)

// Displays

(* ****** ****** *)

(* Structures *)

typedef XWindowChanges = $extype_struct "XWindowChanges" of {
  x = int, y = int,
  width = int, height = int,
  border_width = int,
  sibling = Window,
  stack_mode = int
}

(* Functions *)

fun XOpenDisplay(Stropt): Display_ptr0 = "mac#%"

fun XCloseDisplay(Display_ptr1): void = "mac#%"

fun XDisplayWidth{l:agz}(!Display_ptr(l), int): int = "mac#%"

fun XDisplayHeight{l:agz}(!Display_ptr(l), int): int = "mac#%"

fun XRootWindow{l:agz} (!Display_ptr l, int) : Window = "mac#%"

fun XConnectionNumber{l:agz}(!Display_ptr(l)): int = "mac#%"

fun XDefaultColormap{l:agz}(!Display_ptr(l), int):<> Colormap = "mac#%"

fun XDefaultScreen{l:agz}(!Display_ptr(l)): int = "mac#%"

(* ****** ****** *)

// Windows

(* ****** ****** *)

fun XDestroySubwindows{l:agz}(Display_ptr(l), Window): void = "mac#%"

fun XRaiseWindow{l:agz}(Display_ptr(l), Window): int = "mac#%"

fun XMapWindow{l:agz}(Display_ptr(l), Window): void = "mac#%"

fun XUnmapWindow{l:agz}(Display_ptr(l), Window): void = "mac#%"

fun XConfigureWindow{l:agz}
  (Display_ptr(l), Window, uint, values: &XWindowChanges): void = "mac#%"

fun XMoveResizeWindow{l:agz}
  (!Display_ptr(l), Window, int, int, uint, uint) : void = "mac#%"

fun XSetWindowBorder{l:agz}(!Display_ptr(l), Window, ulint): void = "mac#%"

fun XSetWindowBorderWidth{l:agz}(
  !Display_ptr l,
  Window,
  uint
): void = "mac#%"

(* ****** ****** *)

// Events

(* ****** ****** *)

(* Structures *)

typedef XKeyEvent = $extype_struct"XKeyEvent" of {
  type = int,
  serial = ulint,
  window = Window, root = Window, subwindow = Window,
  x = int, y = int, x_root = int, y_root = int,
  state = uint,
  keycode = uint,
  same_screen = bool,
  _rest = undefined_t0ype
}

typedef XMapRequestEvent = $extype_struct"XMapRequestEvent" of {
  type = int,
  serial = ulint,
  event = Window, window = Window, parent = Window,
  x = int, y = int,
  override_redirect = bool,
  _rest = undefined_t0ype
}

typedef XDestroyWindowEvent = $extype_struct"XDestroyWindowEvent" of {
  type = int,
  serial = ulint,
  event = Window, window = Window,
  x = int, y = int,
  _rest = undefined_t0ype
}

typedef XConfigureRequestEvent = $extype_struct"XConfigureRequestEvent" of {
  type = int,
  serial = ulint,
  event = Window, window = Window,
  x = int, y = int, width = int, height = int,
  border_width = int,
  above = Window,
  detail = int,
  value_mask = ulint,
  _rest = undefined_t0ype
}

typedef XClientMessageEvent = $extype_struct"XClientMessageEvent" of {
  type = int,
  serial = ulint,
  window = Window,
  message_type = Atom,
  format = int,
  _rest = undefined_t0ype
}

typedef XEvent = $extype_struct"XEvent" of {
  type = int,
  xkey = XKeyEvent,
  xmaprequest = XMapRequestEvent,
  xdestroy = XDestroyWindowEvent,
  xconfigurerequest = XConfigureRequestEvent,
  xclient = XClientMessageEvent,
  _rest = undefined_t0ype
}

(* Functions *)

fun XSendEvent{l:agz}(!Display_ptr(l), &XEvent? >> XEvent): void = "mac#%"

fun XNextEvent{l:agz}(!Display_ptr(l), &XEvent? >> XEvent): void = "mac#%"

fun XKeysymToKeycode{l:agz}(!Display_ptr(l), KeySym): KeyCode = "mac#%"

fun XKeycodeToKeysym{l:agz}(!Display_ptr(l), KeyCode): KeySym = "mac#%"

fun XGrabKey{l:agz}
  (!Display_ptr(l), int, uint, Window, bool, int, int): void = "mac#%"

fun XUngrabKey{l:agz}(!Display_ptr(l), int, uint, Window): void = "mac#%"

fun XSelectInput{l:agz}(!Display_ptr(l), Window, ulint): void = "mac#%"

fun XSetInputFocus{l:agz}(!Display_ptr(l), Window, int, Time): void = "mac#%"

fun XSetClientMessageChar(cPtr1(XClientMessageEvent), int, char): void = "mac#%"

fun XSetClientMessageShort
  (cPtr1(XClientMessageEvent), int, sint): void = "mac#%"

fun XSetClientMessageLong
  (cPtr1(XClientMessageEvent), int, lint): void = "mac#%"

(* End of [Xlib.sats] *)
