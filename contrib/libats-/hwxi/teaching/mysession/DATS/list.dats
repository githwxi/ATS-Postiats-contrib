(*
** Lists
*)

(* ****** ****** *)
//
staload
"./../SATS/basis.sats"
//
staload
LIST = "./../SATS/list.sats"
//
(* ****** ****** *)
//
staload "./basis_chan0.dats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
$LIST.chanpos_list_nil
  (chpos) = () where
{
//
vtypedef
chan0 = channel0(ptr)
val
chan0 =
$UN.castvwtp1{chan0}(chpos)
//
val () =
channel0_send (chan0, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_nil] *)

(* ****** ****** *)

implement
{}(*tmp*)
$LIST.chanpos_list_cons
  (chpos) = () where
{
//
vtypedef
chan0 = channel0(ptr)
val
chan0 =
$UN.castvwtp1{chan0}(chpos)
//
val ((*void*)) =
  channel0_send (chan0, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_cons] *)

(* ****** ****** *)

implement
{}(*tmp*)
$LIST.channeg_list
  (chneg) = let
//
vtypedef
chan0 = channel0(ptr)
val
chan0 =
$UN.castvwtp0{chan0}(chneg)
//
val tag = channel0_recv_val (chan0)
//
in
//
if
iseqz(tag)
then let
//
prval () =
  $UN.castview2void(chan0) in $LIST.channeg_list_nil(chan0)
// end of [prval]
end // end of [then]
else let
prval () =
  $UN.castview2void(chan0) in $LIST.channeg_list_cons(chan0)
// end of [prval]
end // end of [else]
//
end // end of [channeg_list]

(* ****** ****** *)

stadef sslist = $LIST.sslist

(* ****** ****** *)

implement
{a}(*tmp*)
$LIST.list2sslist(xs) = let
//
fun
fserv
(
  chp: chanpos(sslist(a)), xs: List(a)
) : void =
(
case+ xs of
| list_nil () => let
    val () =
    $LIST.chanpos_list_nil(chp) in chanpos_nil_wait(chp)
  end // end of [list_nil]
| list_cons (x, xs) => let
    val () =
    $LIST.chanpos_list_cons(chp) in chanpos_send(chp, x); fserv(chp, xs)
  end // end of [list_cons]
)
//
in
//
channeg_create_exn(llam(chp) => fserv(chp, xs))
//
end // end of [list2sslist]

(* ****** ****** *)
//
implement
{a}(*tmp*)
$LIST.sslist2list(chn) =
  list_vt2t($LIST.sslist2list_vt(chn))
//
(* ****** ****** *)

implement
{a}(*tmp*)
$LIST.list2sslist_vt(xs) = let
//
fun
fserv
(
  chp: chanpos(sslist(a)), xs: List_vt(a)
) : void =
(
case+ xs of
| ~list_vt_nil () => let
    val () = $LIST.chanpos_list_nil(chp) in chanpos_nil_wait(chp)
  end // end of [list_nil]
| ~list_vt_cons (x, xs) => let
    val () = $LIST.chanpos_list_cons(chp) in chanpos_send(chp, x); fserv(chp, xs)
  end // end of [list_cons]
)
//
in
//
channeg_create_exn(llam(chp) => fserv(chp, xs))
//
end // end of [list2sslist_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
$LIST.sslist2list_vt
  (chn) = let
//
fun
loop
(
  chn: channeg(sslist(a))
, res: &ptr? >> List0_vt(a)
) : void = let
//
val
opt = $LIST.channeg_list(chn)
//
in
//
case+ opt of
| ~$LIST.channeg_list_nil(chn) =>
  (
    res := list_vt_nil;
    channeg_nil_close(chn)
  ) (* end of [channeg_list_nil] *)
| ~$LIST.channeg_list_cons(chn) =>
  {
    val x =
      channeg_send_val(chn)
    val () =
      res :=
      list_vt_cons{a}{0}(x, _)
    // end of [val]
    val+list_vt_cons(_, res1) = res
    val ((*void*)) = loop (chn, res1)
    prval ((*fold*)) = fold@res
  } (* end of [channeg_list_cons] *)
//
end // end of [loop]
//
var res: ptr
//
in
  let val () = loop(chn, res) in res end
end // end of [sslist2list_vt]

(* ****** ****** *)

(* end of [list.dats] *)
