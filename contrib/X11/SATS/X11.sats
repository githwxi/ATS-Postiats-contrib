(* ****** ****** *)
//
// API in ATS for X11
// Author: Ryan King <rtking@bu.edu>
//
// X11.sats: Primary X11 Header
//
(* ****** ****** *)

%{#

#include "../contrib/contrib/X11/CATS/X11.cats"

%}

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.X11"
#define ATS_EXTERN_PREFIX "atscntrb_X11_"

(* ****** ****** *)

#include "./X.sats"
#include "./Xlib.sats"
#include "./keysymdef.sats"

(* ****** ****** *)

(* End of [X11.sats] *)