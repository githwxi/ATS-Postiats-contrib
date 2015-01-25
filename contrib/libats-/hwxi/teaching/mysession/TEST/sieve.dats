(*
** Erathosthene's sieve
*)

(* ****** ****** *)

staload "./../SATS/basis.sats"
staload "./../SATS/co-list.sats"

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
  channeg_create(llam(chp) => fserv(chp, n))
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
  channeg_create(llam(chp) => fserv(chp, chn))
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
  channeg_create(llam(chp) => fserv(chp, ints_from(2)))
end // end of [primes_gen]

(* ****** ****** *)

(* end of [sieve.dats] *)
