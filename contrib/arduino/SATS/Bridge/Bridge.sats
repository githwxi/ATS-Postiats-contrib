(*
** Bridge library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/Bridge/Bridge.cats"
%} // end of [%{#]

(* ****** ****** *)
//
(*
class BridgeClass
*)
abst@ype
BridgeClass =
$extype"BridgeClass"
abstype BridgeClass_ptr = ptr
//
(* ****** ****** *)
//
macdef
Bridge =
$extval(BridgeClass, "Bridge")
macdef
Bridge_ptr =
$extval(BridgeClass_ptr, "Bridge_ptr")
//
(* ****** ****** *)
//
fun
Bridge_begin
  (BridgeClass_ptr): void = "mac#"
//
overload ._begin with Bridge_begin
//
(* ****** ****** *)
//
fun
Bridge_getBridgeVersion
  (p0: BridgeClass_ptr): uint16 = "mac#"
//
overload .getBridgeVersion with Bridge_getBridgeVersion
//
(* ****** ****** *)

(* end of [Bridge.sats] *)
