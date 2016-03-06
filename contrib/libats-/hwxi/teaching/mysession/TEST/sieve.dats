(*
** Erathosthene's sieve
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
staload "./../SATS/co-list.sats"
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
staload _(*anon*) = "./../DATS/co-list.dats"
//
(* ****** ****** *)
//
extern
fun
ints_from (n: int): channeg(sslist(int))
//
extern
fun
ints_filter
  (channeg(sslist(int)), n: int): channeg(sslist(int))
//
(* ****** ****** *)
  
implement
ints_from (n) = let
//
fun
fserv
(
  chp: chanpos(sslist(int)), n: int
) : void = let
//
val opt = chanpos_list (chp)
//
in
//
case+ opt of
| ~chanpos_list_nil(chp) =>
    chanpos_nil_wait(chp)
| ~chanpos_list_cons(chp) =>
    (chanpos_send<int>(chp, n); fserv(chp, n+1))
//
end // end of [fserv]
//
in
  channeg_create_exn(llam(chp) => fserv(chp, n))
end // end of [ints_from]

(* ****** ****** *)

implement
ints_filter
  (chn, n) = let
//
fun
getfst
(
  chn: !channeg(sslist(int))
) : int = let
//
val () = channeg_list_cons(chn)
val fst = channeg_send_val(chn)
//
in
  if fst mod n > 0 then fst else getfst(chn)
end // end of [getfst]
//
fun
fserv
(
  chp: chanpos(sslist(int))
, chn: channeg(sslist(int))
) : void = let
//
val opt = chanpos_list (chp)
//
in
//
case+ opt of
| ~chanpos_list_nil(chp) =>
  (
    chanpos_nil_wait(chp);
    channeg_list_nil(chn); channeg_nil_close(chn)
  )
| ~chanpos_list_cons(chp) =>
  (
    chanpos_send(chp, getfst(chn)); fserv(chp, chn)
  )
//
end // end of [fserv]
//
in
  channeg_create_exn(llam(chp) => fserv(chp, chn))
end // end of [ints_filter]

(* ****** ****** *)

extern
fun
primes_gen(): channeg(sslist(int))

(* ****** ****** *)

implement
primes_gen() = let
//
fun
fserv
(
  chp: chanpos(sslist(int))
, chn: channeg(sslist(int))
) : void = let
//
val opt = chanpos_list (chp)
//
in
//
case+ opt of
| ~chanpos_list_nil(chp) =>
  (
    chanpos_nil_wait(chp);
    channeg_list_nil(chn); channeg_nil_close(chn)
  )
| ~chanpos_list_cons(chp) => let
    val () =
      channeg_list_cons(chn)
    // end of [val]
    val p0 = channeg_send_val(chn)
  in
    chanpos_send(chp, p0); fserv(chp, ints_filter(chn, p0))
  end // end of [channeg_list_cons]
//
end // end of [fserv]
//
in
  channeg_create_exn(llam(chp) => fserv(chp, ints_from(2)))
end // end of [primes_gen]

(* ****** ****** *)
//
extern
fun
fprint_primes
  (out: FILEref, n: int, chn: !channeg(sslist(int))): void
//
implement
fprint_primes
  (out, n, chn) =
(
if
n > 0
then let
//
val () =
  channeg_list_cons(chn)
// end of [val]
val px = channeg_send_val<int> (chn)
val () = fprintln! (out, px)
//
in
  fprint_primes (out, n-1, chn)
end // end of [then]
else () // end of [else]
) (* end of [fprint_primes] *)
//
(* ****** ****** *)

implement
main0(argc, argv) =
{
//
val N =
(
//
if argc >= 2
  then g0string2int(argv[1]) else 10
//
) : int // end of [val]
//
val N = g1ofg0(N)
val () = assertloc (N >= 0)
//
val out = stdout_ref
//
val chn = primes_gen()
//
val () = fprint_primes(out, N, chn)
//
val () = channeg_list_nil(chn)
val () = channeg_nil_close(chn)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [sieve.dats] *)
