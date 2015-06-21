(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)
//
fun
neg_bool0
  : bool -> bool = "mac#%"
fun
neg_bool1
  : {b:bool} bool(b) -> bool(~b) = "mac#%"
//
overload ~ with neg_bool0 of 100
overload ~ with neg_bool1 of 110
//
overload not with neg_bool0 of 100
overload not with neg_bool1 of 110
//
(* ****** ****** *)
//
fun int2bool0 : int -> bool = "mac#%"
fun int2bool1 : {i:int} int(i) -> bool(i != 0) = "mac#%"
//
fun bool2int0 : bool -> natLt(2) = "mac#%"
fun bool2int1 : {b:bool} bool(b) -> int(bool2int(b)) = "mac#%"
//
(* ****** ****** *)

(* end of [bool.sats] *)
