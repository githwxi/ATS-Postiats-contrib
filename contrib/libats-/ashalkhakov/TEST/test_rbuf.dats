#include
"share/atspre_define.hats"  
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "./../SATS/rbuf.sats"
staload _ = "./../DATS/rbuf.dats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
main (argc, argv) = let
  var A = @[uint8]($UN.cast {uint8} (3), $UN.cast {uint8} (2), $UN.cast {uint8} (4), $UN.cast {uint8} (5), $UN.cast {uint8} (1))
  var buf: rbuf_vt0 (uint8)
  val () = rbuf_make (view@(A) | addr@(A), g1int2uint_int_size (5), buf)
  
  val c0 = rbuf_read<uint8> (buf)
  val c1 = rbuf_read<uint8> (buf)
  val c2 = rbuf_read<uint8> (buf)
  val c3 = rbuf_read<uint8> (buf)
  val c4 = rbuf_read<uint8> (buf)
//  val c5 = rbuf_read<uint8> (buf) // ill-typed
  
  val () = println!("Elements: ", c0, " ", c1, " ", c2, " ", c3, " ", c4)
  
  val (pf_arr | ()) = rbuf_free (buf)
  prval () = view@(A) := pf_arr
in
  1
end // end of [main]

(* ****** end of [test_rbuf.dats] ******* *)

