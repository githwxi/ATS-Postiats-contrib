(* ****** ****** *)
//
// HX-2014-12-25:
// For the purpose of
// studying session types
//
(* ****** ****** *)
//
abstype send (a:vt@ype)
abstype recv (a:vt@ype)
//
(* ****** ****** *)

abstype
chseq (a:type, b:type)

(* ****** ****** *)

stadef nil = unit
stadef :: (a:type, b:type) = chseq (a, b)

(* ****** ****** *)
//
absvtype chpos(type)
absvtype chneg(type)
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
chpos_send{ss:type}
  (ch: !chpos(send(a) :: ss) >> chpos(ss), x: a): void
extern
fun{a:vt0p}
chpos_recv{ss:type}
  (ch: !chpos(recv(a) :: ss) >> chpos(ss), x: &a? >> _): void
extern
fun{a:vt0p}
chpos_recv_val{ss:type}(ch: !chpos(recv(a) :: ss) >> chpos(ss)): a
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
chneg_recv{ss:type}
  (ch: !chneg(recv(a) :: ss) >> chneg(ss), x: a): void
extern
fun{a:vt0p}
chneg_send{ss:type}
  (ch: !chneg(send(a) :: ss) >> chneg(ss), x: &a? >> _): void
extern
fun{a:vt0p}
chneg_send_val{ss:type}(ch: !chneg(send(a) :: ss) >> chneg(ss)): a
//
(* ****** ****** *)

(*
extern
fun chpos_recv_close (ch: chpos(nil)): void
extern
fun chneg_recv_close (ch: chneg(nil)): void
*)

(* ****** ****** *)
//
extern
fun
chpos_chneg_connect
  {ss:type}(ch1: chpos(ss), ch2: chneg(ss)): void
//
(* ****** ****** *)
//
datatype
sslist (a:t@ype) =
| sslist_nil of (nil)
| sslist_cons of (send(a) :: sslist(a))
//
(*
datavtype
chpos_sslist (a:t@ype) =
| chpos_sslist_nil of ()
| chpos_sslist_cons of (chpos(send(a) :: sslist(a)))
*)
//
datavtype
chneg_sslist (a:t@ype) =
| chneg_sslist_nil of ()
| chneg_sslist_cons of (chneg(send(a) :: sslist(a)))
//
(* ****** ****** *)
//
(*
extern
fun
chpos_sslist
  {a:t0p}(chpos(sslist(a))): chpos_sslist(a)
*)
extern
fun
chpos_sslist_nil{a:t0p}(chpos(sslist(a))): void
and
chpos_sslist_cons
  {a:t0p}(chpos(sslist(a))): chpos(send(a) :: sslist(a))
//
(* ****** ****** *)
//
extern
fun
chneg_sslist
  {a:t0p}(chneg(sslist(a))): chneg_sslist(a)
(*
extern
fun
chneg_sslist_nil{a:t0p}(chneg(sslist(a))): void
and
chneg_sslist_cons
  {a:t0p}(chneg(sslist(a))): chneg(send(a) :: sslist(a))
*)
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
abst@ype bit = int
//
macdef B0 = $UN.cast{bit}(0)
macdef B1 = $UN.cast{bit}(1)
//
(* ****** ****** *)
//
extern
fun
chneg_create{ss:type}
  (f: chpos(ss) -<lincloptr1> void): chneg(ss)
//
(* ****** ****** *)

extern
fun int2bits{n:nat} (int(n)): chneg(sslist(bit))

(* ****** ****** *)

implement
int2bits(n) = let
//
fun
fserv{n:nat}
(
  n: int(n), ch: chpos(sslist(bit))
) : void = (
//
if
n > 0
then let
  val n2 = half(n)
  val bit =
  (
    if n = 2*n2 then B0 else B1
  ) : bit // end of [val]
  val ch = chpos_sslist_cons (ch)
  val ((*void*)) = chpos_send (ch, bit)
in
  fserv (n2, ch)
end // end of [then]
else chpos_sslist_nil (ch)
//
) (* end of [fserv] *)
//
in
  chneg_create{sslist(bit)}(llam(ch) => fserv (n, ch))
end // end of [int2bits]

(* ****** ****** *)
//
extern
fun succ_bits (chneg(sslist(bit))): chneg(sslist(bit))
extern
fun add_bits_bits (chneg(sslist(bit)), chneg(sslist(bit))): chneg(sslist(bit))
//
(* ****** ****** *)

typedef bit_ = natLt(2)

(* ****** ****** *)

implement
succ_bits(ch1) = let
//
fun
fserv
(
  ch: chpos(sslist(bit))
, ch1: chneg(sslist(bit))
) : void = let
//
val opt = chneg_sslist (ch1)
//
in
//
case+ opt of
| ~chneg_sslist_nil () => let
    val ch = chpos_sslist_cons (ch)
    val () = chpos_send (ch, B1)
    val () = chpos_sslist_nil (ch)
  in
    // nothing
  end // end of [chneg_sslist_nil]
| ~chneg_sslist_cons (ch1) => let
    val ch = chpos_sslist_cons (ch)
    val bit = chneg_send_val (ch1)
    val bit_ = $UN.cast{bit_}(bit)
  in
    if bit_ = 0
      then let
        val () = chpos_send (ch, B1)
      in
        chpos_chneg_connect (ch, ch1)
      end // end of [then]
      else let
        val () = chpos_send (ch, B0)
      in
        fserv (ch, ch1)
      end // end of [else]
  end // end of [chneg_sslist_cons]
//
end // end of [fserv]
//
in
  chneg_create{sslist(bit)}(llam(ch) => fserv (ch, ch1))
end // end of [succ_bits]
  
(* ****** ****** *)

implement
add_bits_bits
  (ch1, ch2) = let
//
fun
fserv
(
  ch: chpos(sslist(bit))
, ch1: chneg(sslist(bit))
, ch2: chneg(sslist(bit))
) : void = let
//
val opt1 = chneg_sslist (ch1)
//
in
//
case+ opt1 of
| ~chneg_sslist_nil () =>
    chpos_chneg_connect (ch, ch2)
| ~chneg_sslist_cons (ch1) => let
    val ch =
      chpos_sslist_cons (ch)
    // end of [val]
    val opt2 = chneg_sslist (ch2)
  in
    case+ opt2 of
    | ~chneg_sslist_nil () =>
        chpos_chneg_connect(ch, ch1)
      // end of [chneg_sslist_nil]
    | ~chneg_sslist_cons (ch2) => let
        val b1 = chneg_send_val(ch1)
        and b2 = chneg_send_val(ch2)
        val b1_ = $UN.cast{bit_}(b1)
        and b2_ = $UN.cast{bit_}(b2)
      in
        case+ b1_ of
        | 0 => (chpos_send (ch, b2); fserv (ch, ch1, ch2))
        | 1 => (
          case+ b2_ of
          | 0 => (chpos_send (ch, B1); fserv (ch, ch1, ch2))
          | 1 => (chpos_send (ch, B0); fserv (ch, ch1, succ_bits(ch2)))
          ) (* end of [1] *)
      end // end of [chneg_sslist_cons]
  end // end of [chneg_sslist_cons]
//
end // end of [fserv]
//
in
  chneg_create{sslist(bit)}(llam(ch) => fserv (ch, ch1, ch2))
end // end of [add_bits_bits]

(* ****** ****** *)

(* end of [scratch08.dats] *)
