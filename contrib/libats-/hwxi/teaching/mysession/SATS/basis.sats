(*
** Basis for session types
*)

(* ****** ****** *)
//
abstype chsnd (a:vt@ype)
abstype chrcv (a:vt@ype)
//
(* ****** ****** *)

abstype chnil
abstype chcons (a:type, ss:type)

(* ****** ****** *)

stadef nil = chnil
stadef :: = chcons
stadef cons = chcons

(* ****** ****** *)

absvtype chanpos (type) = ptr
absvtype channeg (type) = ptr

(* ****** ****** *)
//
fun
{a:vt0p}
chanpos_send{ss:type}
  (!chanpos(chsnd(a)::ss) >> chanpos(ss), a): void
//
fun
{a:vt0p}
channeg_recv{ss:type}
  (!channeg(chrcv(a)::ss) >> channeg(ss), a): void
//
(* ****** ****** *)
//
fun
{a:vt0p}
chanpos_recv{ss:type}
(
  !chanpos(chrcv(a)::ss) >> chanpos(ss), x: &a? >> a
) : void // end of [chanpos_recv]
fun
{a:vt0p}
channeg_send{ss:type}
(
  !channeg(chsnd(a)::ss) >> channeg(ss), x: &a? >> a
) : void // end of [channeg_send]
//
(* ****** ****** *)
//
fun
{a:vt0p}
chanpos_recv_val
  {ss:type}(!chanpos(chrcv(a)::ss) >> chanpos(ss)): (a)
//
fun
{a:vt0p}
channeg_send_val
  {ss:type}(!channeg(chsnd(a)::ss) >> channeg(ss)): (a)
//
(* ****** ****** *)

fun{}
chanpos_nil_wait(chanpos(nil)): void
fun{}
channeg_nil_close(channeg(nil)): void

(* ****** ****** *)
//
fun
chanposneg_link
  {ss:type}(chp: chanpos(ss), chn: channeg(ss)): void
//
(* ****** ****** *)
//
fun{}
channeg_create_exn{ss:type}
  (fserv: chanpos(ss) -<lincloptr1> void): channeg(ss)
//
(* ****** ****** *)

(* end of [basis.sats] *)
