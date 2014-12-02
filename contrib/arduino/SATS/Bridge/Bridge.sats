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
class SerialBridgeClass
*)
abst@ype
BridgeClass =
$extype"BridgeClass"
abstype BridgeClass_ptr = ptr
abst@ype
SerialBridgeClass =
$extype"SerialBridgeClass"
abstype SerialBridgeClass_ptr = ptr
//
(* ****** ****** *)
//
macdef
Bridge =
$extval(SerialBridgeClass, "Bridge")
macdef
Bridge_ptr =
$extval(SerialBridgeClass_ptr, "Bridge_ptr")
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
//
fun
SerialBridge_begin
  (SerialBridgeClass_ptr): void = "mac#"
//
overload ._begin with SerialBridge_begin
//
(* ****** ****** *)

(* end of [Bridge.sats] *)
