(*
** Testing session types
*)

(* ****** ****** *)

%{^
//
#include <pthread.h>
//
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./../SATS/basis.sats"
//
(* ****** ****** *)

staload
_ = "libats/DATS/deqarray.dats"

(* ****** ****** *)
//
staload
_ = "libats/DATS/athread.dats"
staload
_ = "libats/DATS/athread_posix.dats"
//
(* ****** ****** *)
//
staload _ = "./../DATS/basis_uchan.dats"
staload _ = "./../DATS/basis_chan0.dats"
//
staload _ = "./../DATS/basis_ssntyp.dats"
//
(* ****** ****** *)

implement
main0() = let
//
val chn =
channeg_create_exn
(
  llam (chp) => chanpos_nil_wait(chp)
) (* end of [val] *)
//
in
  channeg_nil_close(chn)
end // end of [main0]

(* ****** ****** *)

(* end of [test00.dats] *)
