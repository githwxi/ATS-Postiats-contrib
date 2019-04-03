(*
** The Great Computer Language Shootout
** http://shootout.alioth.debian.org/
**
** contributed by Hongwei Xi (gmhwxiATgmailDOTcom)
*)

(* ****** ****** *)

(*
revcomp_mt: revcomp_mt.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -std=c99 $< -o $@ -lpthread
*)

(* ****** ****** *)
//
// HX: if we forget about safety, ...
//
(* ****** ****** *)
//
// Ported to ATS2 by HX-2013-11-13
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

%{^
#include <pthread.h>
%} // end of [%{^]

(* ****** ****** *)

%{^
#undef ATSextfcall
#define ATSextfcall(f, args) f args
%} // end of [%{^]

(* ****** ****** *)

staload "libats/libc/SATS/stdio.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#define BYTE_MAX 255

(* ****** ****** *)

extern
fun eq_byte_byte
  (b1: byte, b2: byte): bool = "atspre_eq_uchar_uchar"
overload = with eq_byte_byte
extern
fun neq_byte_byte
  (b1: byte, b2: byte): bool = "atspre_neq_uchar_uchar"
overload != with neq_byte_byte

(* ****** ****** *)
//
sta l_iubcmpltarr: addr
extern
prval pfbox_iubcmpltarr
  : vbox (bytes(BYTE_MAX+1) @ l_iubcmpltarr)
val p_iubcmpltarr =
  $extval (ptr(l_iubcmpltarr), "&iubcmpltarr[0]")
//
(* ****** ****** *)

fun iubcmplt_get
  (b: byte): byte = let
  val i = $UN.cast{natLt(256)}(b)
  prval vbox pf = pfbox_iubcmpltarr in p_iubcmpltarr->[i]
end // end of [iubcmplt_get]

(* ****** ****** *)
//
fun ptrget
  (p: ptr): byte = $UN.ptr0_get<byte> (p)
fun ptrset
  (p: ptr, b: byte): void = $UN.ptr0_set<byte> (p, b)
//
(* ****** ****** *)
//
fun ptrsucc (p: ptr) = ptr_succ<byte> (p)
fun ptrpred (p: ptr) = ptr_pred<byte> (p)
//
overload succ with ptrsucc of 1000000
overload pred with ptrpred of 1000000
//
(* ****** ****** *)
//
extern
fun
reverse_buf
  (pi: ptr, pj: ptr): void 
//
implement
reverse_buf (pi, pj) = let
  macdef NL = $UN.cast{byte}('\n')
in
//
if pi < pj then let
  val xi = ptrget (pi)
in
  if (xi != NL) then let
    val xj = ptrget (pj)
  in
    if (xj != NL) then let
      val () = ptrset (pi, iubcmplt_get (xj))
      and () = ptrset (pj, iubcmplt_get (xi))
    in
      reverse_buf (succ(pi), pred(pj))
    end else reverse_buf (pi, pred(pj))
  end else reverse_buf (succ(pi), pj)
end // end of [if]
//
end // end of [reverse_buf]
//
(* ****** ****** *)
//
#define
LIBATSHWXI_targetloc
"$PATSCONTRIB/contrib/libats-hwxi"
//
(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/teaching\
/mythread-0.3.2/SATS/nwaiter.sats"
staload
"{$LIBATSHWXI}/teaching\
/mythread-0.3.2/SATS/workshop.sats"
//  
(* ****** ****** *)
//
vtypedef
ticket = nwaiter_ticket
//
extern
fun{}
reverse_buf_tick
  (pi: ptr, pj: ptr, tick: ticket): void 
//
implement
{}(*tmp*)
reverse_buf_tick
  (pi, pj, tick) = let
  val () = reverse_buf (pi, pj) in nwaiter_ticket_put (tick)
end // end of [reverse_buf_tick]
//
(* ****** ****** *)
//
extern
fun{}
theBuffer_reverse (): void
extern
fun{}
theBuffer_reverse$submit (fwork: () -<lincloptr1> void): void
//
implement
{}(*tmp*)
theBuffer_reverse () = () where
{
//
fun
search_buf
(
  p: ptr, c: char
) : ptr = $extfcall (ptr, "rawmemchr", p, c)
//
val p_beg = $extval(ptr, "theBuffer")
val theTotal = $extval(size_t, "theTotal")
val p_end = ptr_add<byte> (p_beg, theTotal)
//
val nw = nwaiter_create_exn ()
val tick = nwaiter_initiate (nw)
val tick2 = nwaiter_ticket_split (tick)
val tick3 = nwaiter_ticket_split (tick)
//
val p0 = search_buf (p_beg, '>')
val p0 = search_buf (p0, '\n')
val p1 = search_buf (succ(p0), '>')
val () =
theBuffer_reverse$submit
  (llam () => reverse_buf_tick (succ(p0), pred(p1), tick))
//
val p0 = search_buf(p1, '\n')
val p1 = search_buf (succ(p0), '>')
val () =
theBuffer_reverse$submit
  (llam () => reverse_buf_tick (succ(p0), pred(p1), tick2))
//
val p0 = search_buf(p1, '\n')
val () =
theBuffer_reverse$submit
  (llam () => reverse_buf_tick (succ(p0), pred(p_end), tick3))
//
val ((*void*)) = nwaiter_waitfor (nw)
val ((*void*)) = nwaiter_destroy (nw)
//
} (* end of [theBuffer_reverse] *)

(* ****** ****** *)
//
staload _ = "libats/DATS/deqarray.dats"
//
(* ****** ****** *)
//
staload _ = "libats/DATS/athread.dats"
staload _ = "libats/DATS/athread_posix.dats"
//
(* ****** ****** *)
//
staload _ =
"{$LIBATSHWXI}/teaching/mythread-0.3.2/DATS/channel.dats"
//
staload _ =
"{$LIBATSHWXI}/teaching/mythread-0.3.2/DATS/nwaiter.dats"
//
staload _ =
"{$LIBATSHWXI}/teaching/mythread-0.3.2/DATS/workshop.dats"
//
(* ****** ****** *)

implement
main0 () = {
//
val ws0 =
workshop_create_cap<lincloptr> (i2sz(3))
val nworker =
  workshop_add_nworker<lincloptr> (ws0, 3)
//
implement
theBuffer_reverse$submit<> (fwork) =
(
  workshop_insert_job<lincloptr> (ws0, $UN.castvwtp0{lincloptr}(fwork))
) (* end of [theBuffer_reverse$submit] *)
//
val () =
  $extfcall (void, "iubcmpltarr_initize")
val () = $extfcall (void, "theBuffer_initset")
val () = theBuffer_reverse<> ((*void*))
val () = $extfcall (void, "theBuffer_fprint", stdout_ref)
//
} (* end of [main0] *)

(* ****** ****** *)

%{^
//
// HX:
// reuse some existing C code
//
#include <errno.h>

static
unsigned char iubpairs[][2] = {
    {    'A',    'T'    },
    {    'C',    'G'    },
    {    'B',    'V'    },
    {    'D',    'H'    },
    {    'K',    'M'    },
    {    'R',    'Y'    },
    {    '\000',   '\000'   }
} ;

#define BYTE_MAX 255
static
unsigned char iubcmpltarr[1+BYTE_MAX];

ATSinline()
atsvoid_t0ype
iubcmpltarr_initize () {
  int i;
  for (i=0; i <= BYTE_MAX; i++) {
    iubcmpltarr[i] = (unsigned char) i;
  }
  for (i=0; iubpairs[i][0] != '\0'; i++) {
    iubcmpltarr[iubpairs[i][0]] = iubpairs[i][1];
    iubcmpltarr[iubpairs[i][1]] = iubpairs[i][0];
    iubcmpltarr[tolower(iubpairs[i][0])] = iubpairs[i][1];
    iubcmpltarr[tolower(iubpairs[i][1])] = iubpairs[i][0];
  }
} /* end of [iubcmpltarr_initize] */

/* ****** ****** */
//
// #define NBYTE 60
//
#define NBYTE 1024*1024
static
char
theBuffer[256*1024*1024] ;
//
size_t theTotal = 0 ;
//
void
theBuffer_initset () {
  size_t n ;
  char *p = theBuffer ;
  while (1) {
    n = fread (p, 1, NBYTE, stdin) ; if (!n) break ; p += n ;
  } // end of [while]
  theTotal = (p-theBuffer) ;
  return ;
} // end of [theBuffer_initset]

void
theBuffer_fprint
(
  FILE *out
) {
  size_t n, tot ;
  char *p ;
  tot = theTotal ; p = theBuffer ;
  while (tot > 0) {
    n = fwrite (p, 1, tot, out) ; if (!n) break ; tot -= n ; p += n ;
  } // end of [while]
  return ;
} // end of [theBuffer_fprint]

%} // end of [%{^]

(* ****** ****** *)

(* end of [revcomp.dats] *)
