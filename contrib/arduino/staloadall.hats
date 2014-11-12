(*
** For programming Arduino
*)

(* ****** ****** *)
//
staload _ =
"prelude/DATS/basics.dats"
//
staload _ =
"prelude/DATS/integer.dats"
staload _ =
"prelude/DATS/pointer.dats"
//
staload _ =
"prelude/DATS/integer_fixed.dats"
//
staload _ =
"prelude/DATS/char.dats"
staload _ =
"prelude/DATS/string.dats"
//
(* ****** ****** *)
//
staload _ =
"prelude/DATS/gorder.dats"
staload _ =
"prelude/DATS/gnumber.dats"
//
(* ****** ****** *)

staload _ = "prelude/DATS/array.dats"
staload _ = "prelude/DATS/arrayptr.dats"
staload _ = "prelude/DATS/arrayref.dats"

(* ****** ****** *)
//
staload _(*UN*) = "prelude/DATS/unsafe.dats"
//
(* ****** ****** *)

staload "./SATS/Arduino.sats"

(* ****** ****** *)

staload "./SATS/Print.sats"
staload "./SATS/HardwareSerial.sats"

(* ****** ****** *)

(* end of [staloadall.hats] *)