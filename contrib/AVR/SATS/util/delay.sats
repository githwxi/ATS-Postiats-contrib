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

fun _delay_ms (ms: double): void = "mac#"
fun _delay_us (us: double): void = "mac#"

(* ****** ****** *)

(* end of [delay.sats] *)
