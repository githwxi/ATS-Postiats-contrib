(* ****** ****** *)

%{#
//
#include \
"APUE/CPTR/CATS/sys/types.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)

abst@ype mode_t = $extype"mode_t"

(* ****** ****** *)
//
fun
mode2int (m: mode_t):<> int = "mac#"
fun
mode2uint (m: mode_t):<> uint = "mac#"
//
(* ****** ****** *)
//
fun
eq_mode_mode
  (m1: mode_t, m2: mode_t):<> bool = "mac#"
fun
neq_mode_mode
  (m1: mode_t, m2: mode_t):<> bool = "mac#"
//
overload = with eq_mode_mode
overload != with neq_mode_mode
overload <> with neq_mode_mode
//
(* ****** ****** *)
//
fun
lor_mode_mode
  (m1: mode_t, m2: mode_t):<> mode_t = "mac#"
fun
land_mode_mode
  (m1: mode_t, m2: mode_t):<> mode_t = "mac#"
//
overload lor with lor_mode_mode
overload land with land_mode_mode
//
(* ****** ****** *)

(* end of [types.sats] *)
