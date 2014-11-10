(*
** For programming Arduino
*)

(* ****** ****** *)
//
staload _ =
"prelude/DATS/integer.dats"
staload _ =
"prelude/DATS/pointer.dats"
//
staload _ =
"prelude/DATS/char.dats"
staload _ =
"prelude/DATS/string.dats"
//
(* ****** ****** *)
//
staload _(*UN*) = "prelude/DATS/unsafe.dats"
//
(* ****** ****** *)

staload "./SATS/Arduino.sats"

(* ****** ****** *)

staload "./SATS/HardwareSerial.sats"

(* ****** ****** *)

(* end of [staloadall.hats] *)