(*
** Session Combinators
*)

(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#define
ATS_EXTERN_PREFIX "libats2erl_session_"
#define
ATS_STATIC_PREFIX "_libats2erl_session_sscmbntr_"
//
(* ****** ****** *)
//
#include "share/atspre_define.hats"
#include "{$LIBATSCC2ERL}/staloadall.hats"
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../SATS/basis.sats"
staload "./../SATS/sscmbntr.sats"
//
(* ****** ****** *)

vtypedef
chanpos(ss:type) = chanpos(ss)
vtypedef
channeg(ss:type) = channeg(ss)

(* ****** ****** *)
//
staload CHAN0 = "./basis_chan0.dats"
//
vtypedef chanpos() = $CHAN0.chanpos()
vtypedef channeg() = $CHAN0.channeg()
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_append
  {ss1,ss2}
  (chp, fserv) = let
//
val chp0 =
  $UN.castvwtp1{chanpos()}(chp)
val chp1 =
  $UN.castvwtp0{chanpos(ss1)}(chp0)
val ((*void*)) = fserv(chp1)
val ((*void*)) = $UN.cast2void(chp1)
//
val ((*freed*)) =
  cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
//
in
  $UN.castvwtp2void{chanpos(ss2)}(chp)
end // end of [chanpos_append]

implement
{}(*tmp*)
channeg_append
  {ss1,ss2}
  (chp, fserv) = let
//
val chp0 =
  $UN.castvwtp1{channeg()}(chp)
val chp1 =
  $UN.castvwtp0{channeg(ss1)}(chp0)
val ((*void*)) = fserv(chp1)
val ((*void*)) = $UN.cast2void(chp1)
//
val ((*freed*)) =
  cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
//
in
  $UN.castvwtp2void{channeg(ss2)}(chp)
end // end of [channeg_append]

(* ****** ****** *)

implement
{}(*tmp*)
chanpos_repeat_conj
  (chp, fserv) =
  loop(chp, fserv) where
{
//
typedef
loop =
$d2ctype
  (chanpos_repeat_conj<>)
//
fun
loop: loop =
lam(chp, fserv) => let
  val chp0 =
    $UN.castvwtp1{chanpos()}(chp)
  // end of [val]
  val tag0 =
    $CHAN0.chanpos0_recv{natLt(2)}(chp0)
  // end of [val]
  val ((*void*)) =
    chanpos_repeat_conj$fwork_tag<>(tag0)
  // end of [val]
in
//
case+ tag0 of
//
| 0 => let
    prval () =
      $UN.cast2void(chp0)
    prval () =
      $UN.castvwtp2void{chanpos_nil}(chp)
    // end of [val]
  in
    cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
  end // end of [0]
//
| 1 => let
    val chp1 =
      $UN.castvwtp0(chp0)
    // end of [val]
    val ((*void*)) = fserv(chp1)
    prval ((*void*)) = $UN.cast2void(chp1)
  in
    loop (chp, fserv)
  end // end of [1]
//
end // end of [loop]
//
} (* end of [chanpos_repeat_conj] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_repeat_conj
  (chn, fserv) =
  loop(chn, fserv) where
{
//
typedef
loop =
$d2ctype
  (channeg_repeat_conj<>)
//
fun
loop: loop =
lam(chn, fserv) => let
  val chn0 =
    $UN.castvwtp1{channeg()}(chn)
  // end of [val]
  val tag0 =
    channeg_repeat_conj$choose()
  // end of [val]
  val ((*void*)) =
    channeg_repeat_conj$fwork_tag<>(tag0)
  // end of [val]
  val ((*void*)) = 
    $CHAN0.channeg0_recv{int}(chn0, tag0)
  // end of [val]
in
//
case+ tag0 of
//
| 0 => let
    prval () =
      $UN.cast2void(chn0)
    prval () =
      $UN.castvwtp2void{channeg_nil}(chn)
    // end of [val]
    val ((*void*)) =
      channeg_repeat_conj$fwork_tag<>(tag0)
    // end of [val]
  in
    cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
  end // end of [0]
//
| 1 => let
    val chn1 =
      $UN.castvwtp0(chn0)
    // end of [val]
    val ((*void*)) = fserv(chn1)
    prval ((*void*)) = $UN.cast2void(chn1)
  in
    loop (chn, fserv)
  end // end of [1]
//
end // end of [loop]
//
} (* end of [channeg_repeat_conj] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
chanpos_repeat_conj$fwork_tag(tag0) = ()
implement
{}(*tmp*)
channeg_repeat_conj$fwork_tag(tag0) = ()
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_repeat_disj
  (chp, fserv) =
  loop(chp, fserv) where
{
//
typedef
loop =
$d2ctype
  (chanpos_repeat_disj<>)
//
fun
loop: loop =
lam(chp, fserv) => let
  val chp0 =
    $UN.castvwtp1{chanpos()}(chp)
  // end of [val]
  val tag0 =
    chanpos_repeat_disj$choose()
  // end of [val]
  val ((*void*)) =
    chanpos_repeat_disj$fwork_tag<>(tag0)
  // end of [val]
  val ((*void*)) = 
    $CHAN0.chanpos0_send{int}(chp0, tag0)
  // end of [val]
in
//
case+ tag0 of
| 0 => let
    prval () =
      $UN.cast2void(chp0)
    prval () =
      $UN.castvwtp2void{chanpos_nil}(chp)
    // end of [val]
  in
    cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
  end // end of [0]
| 1 => let
    val chp1 =
      $UN.castvwtp0(chp0)
    // end of [val]
    val ((*void*)) = fserv(chp1)
    prval ((*void*)) = $UN.cast2void(chp1)
  in
    loop (chp, fserv)
  end // end of [1]
//
end // end of [loop]
//
} (* end of [chanpos_repeat_disj] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_repeat_disj
  (chn, fserv) =
  loop(chn, fserv) where
{
//
typedef
loop =
$d2ctype
  (channeg_repeat_disj<>)
//
fun
loop: loop =
lam(chn, fserv) => let
  val chn0 =
    $UN.castvwtp1{channeg()}(chn)
  // end of [val]
  val tag0 =
    $CHAN0.channeg0_send{natLt(2)}(chn0)
  // end of [val]
  val ((*void*)) =
    channeg_repeat_disj$fwork_tag<>(tag0)
  // end of [val]
in
//
case+ tag0 of
| 0 => let
    prval () =
      $UN.cast2void(chn0)
    prval () =
      $UN.castvwtp2void{channeg_nil}(chn)
    // end of [val]
  in
    cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
  end // end of [0]
| 1 => let
    val chn1 =
      $UN.castvwtp0(chn0)
    // end of [val]
    val ((*void*)) = fserv(chn1)
    prval ((*void*)) = $UN.cast2void(chn1)
  in
    loop (chn, fserv)
  end // end of [1]
//
end // end of [loop]
//
} (* end of [channeg_repeat_disj] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
chanpos_repeat_disj$fwork_tag(tag0) = ()
implement
{}(*tmp*)
channeg_repeat_disj$fwork_tag(tag0) = ()
//
(* ****** ****** *)

(* end of [sscmbntr.dats] *)
