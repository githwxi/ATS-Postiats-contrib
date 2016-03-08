(*
** Session-typed channels
*)

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
"./../SATS/basis_ssntype.sats"
//
staload "./basis_channel0.dats"
//
(* ****** ****** *)
//
datavtype
boxed (a:vt@ype) = BOX of (a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
channel1_close
  {n}(tchan) = let
//
vtypedef bxa = boxed(a)
vtypedef channel0 = channel0(bxa, n)
//
in
  channel0_free($UN.castvwtp0{channel0}(tchan))
end // end of [channel1_close]

(* ****** ****** *)

implement
{a}(*tmp*)
channel1_send
  {n}(tchan, i, j, x0) = let
//
vtypedef bxa = boxed(a)
vtypedef channel0 = channel0(bxa, n)
//
val chan0 =
  $UN.castvwtp1{channel0}(tchan)
val ((*void*)) =
  channel0_send(chan0, i, j, BOX(x0))
//
prval ((*void*)) = $UN.cast2void(chan0)
prval ((*void*)) = $UN.castview2void(tchan)
//
in
  // nothing
end // end of [channel1_send]

(* ****** ****** *)

implement
{a}(*tmp*)
channel1_recv
  (tchan, i, j, x0) =
(
  x0 := channel1_recv_val(tchan, i, j)
) (* end of [channel1_recv] *)

implement
{a}(*tmp*)
channel1_recv_val
  {n}(tchan, i, j) = (x0) where
{
//
vtypedef bxa = boxed(a)
vtypedef channel0 = channel0(bxa, n)
//
val chan0 =
  $UN.castvwtp1{channel0}(tchan)
//
val~BOX(x0) = channel0_recv_val(chan0, i, j)
//
prval ((*void*)) = $UN.cast2void(chan0)
prval ((*void*)) = $UN.castview2void(tchan)
//
} (* end of [channel1_recv_val] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
channel1_link{n}
  (tchan0, tchan1) = let
//
val cap = channel_cap<>()
//
vtypedef
channel0 = channel0(ptr, n)
//
val
chan0 =
$UN.castvwtp0{channel0}(tchan0)
val
chan1 =
$UN.castvwtp0{channel0}(tchan1)
//
in
  $UN.castvwtp0(channel0_link{ptr}(cap, chan0, chan1))
end // end of [channel1_link]
//
(* ****** ****** *)

staload "libats/SATS/athread.sats"

(* ****** ****** *)
//
implement
{}(*tmp*)
channel_cap ((*void*)) = 2
//
(*
implement
{}(*tmp*)
channel_cap ((*void*)) = 1024
*)
//
(* ****** ****** *)
//
(*
//
fun{}
cchannel1_create_exn
  {n:int}{ssn:type}{G:iset}
  (fserv: channel1(G, n, ssn) -<lincloptr1> void): cchannel1(G, n, ssn)
//
*)
//
implement
{}(*tmp*)
cchannel1_create_exn
  {n}{ssn}{G}
  (nrole, G, fserv) = let
//
val cap = channel_cap()
//
val
(chan0, chan1) =
channel0_posneg<ptr>(cap, nrole, G)
//
val
tchan =
$UN.castvwtp0{channel1(G, n, ssn)}(chan0)
//
val tid =
athread_create_cloptr_exn
(
//
llam () => let
  val () = fserv(tchan)
in
  cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
end // end of [let]
//
) (* end of [val] *)
//
in
  $UN.castvwtp0{cchannel1(G, n, ssn)}(chan1)
end // end of [channeg_create_exn]
//
(* ****** ****** *)

(* end of [basis_channel1.dats] *)
