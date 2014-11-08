(* ****** ****** *)
//
// For applying ATS
// to AVR programming
//
(* ****** ****** *)

%{#
//
#include \
"AVR/CATS/UTIL/delay.cats"
//
%} // end of [%{#]

(* ****** ****** *)

fun _delay_ms (ms: double) = "mac#"
fun _delay_us (us: double) = "mac#"

(* ****** ****** *)

(* end of [delay.sats] *)
