(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
*)

(* ****** ****** *)
//
fun
option_some
  {a:t0p}
  (x0: a): option(a, true) = "mac#%"
fun
option_none
  {a:t0p}
  ((*void*)): option(a, false) = "mac#%"
//
(* ****** ****** *)
//
fun
option_is_some
  {a:t0p}{b:bool}
  (opt: option(a, b)): bool(b) = "mac#%"
fun
option_is_none
  {a:t0p}{b:bool}
  (opt: option(a, b)): bool(~b) = "mac#%"
//
overload is_some with option_is_some
overload is_none with option_is_none
//
overload .is_some with option_is_some
overload .is_none with option_is_none
//
(* ****** ****** *)

(* end of [option.sats] *)
