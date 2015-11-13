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
chanpos_repeat0_conj
  (f, chp) =
  loop(f, chp) where
{
//
typedef
loop =
$d2ctype
  (chanpos_repeat0_conj<>)
//
fun
loop: loop =
lam(f, chp) => let
  val chp0 =
    $UN.castvwtp1{chanpos()}(chp)
  // end of [val]
  val tag0 =
    $CHAN0.chanpos0_recv{natLt(2)}(chp0)
  // end of [val]
in
//
case+ tag0 of
| 0 => let
    prval () =
      $UN.cast2void(chp0)
    prval () =
      $UN.castvwtp2void{chanpos(chnil)}(chp)
    // end of [val]
  in
    cloptr_free($UN.castvwtp0{cloptr(void)}(f))
  end // end of [0]
| 1 => let
    val chp1 =
      $UN.castvwtp0(chp0)
    // end of [val]
    val ((*void*)) = f(chp1)
    prval ((*void*)) = $UN.cast2void(chp1)
  in
    loop (f, chp)
  end // end of [1]
//
end // end of [loop]
//
} (* end of [chanpos_repeat0_conj] *)

(* ****** ****** *)

implement
{}(*tmp*)
chanpos_repeat0_disj
  (f, chp) =
  loop(f, chp) where
{
//
typedef
loop =
$d2ctype
  (chanpos_repeat0_disj<>)
//
fun
loop: loop =
lam(f, chp) => let
  val chp0 =
    $UN.castvwtp1{chanpos()}(chp)
  // end of [val]
  val tag0 =
    chanpos_repeat0_disj$choose()
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
      $UN.castvwtp2void{chanpos(chnil)}(chp)
    // end of [val]
  in
    cloptr_free($UN.castvwtp0{cloptr(void)}(f))
  end // end of [0]
| 1 => let
    val chp1 =
      $UN.castvwtp0(chp0)
    // end of [val]
    val ((*void*)) = f(chp1)
    prval ((*void*)) = $UN.cast2void(chp1)
  in
    loop (f, chp)
  end // end of [1]
//
end // end of [loop]
//
} (* end of [chanpos_repeat0_disj] *)

(* ****** ****** *)

(* end of [sscmbntr.dats] *)
