(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring 2016
// Class Time: TR 12:30-2:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen Wu (hwwuATbuDOTedu)
//
(* ****** ****** *)

(*
** A worm-like game!
*)

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib\
/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"Wormlike__dynload"
//
#define
ATS_STATIC_PREFIX "Wormlike__"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
#staload
_ = "{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)

#staload "./Wormlike.sats"

(* ****** ****** *)

implement
succ_row(i) = let
  val i1 = i+1
in
//
if i1 < NROW then i1 else 0
//
end // end of [succ_row]
implement
pred_row(i) =
(
if i > 0 then i-1 else NROW-1
)

implement
succ_col(j) = let
  val j1 = j+1
in
//
if j1 < NCOL then j1 else 0
//
end // end of [succ_col]
implement
pred_col(j) =
(
if j > 0 then j-1 else NCOL-1
)

(* ****** ****** *)
//
extern
fun
xnode2string(xnode): string
//
implement
xnode2string(xn) =
(
case+ xn of
| XN0() => " "
| XN1(knd) =>
  (
    case+ knd of
    | 0 => "O"
    | 1 => "$"
    | _ when knd < 0 => "X"
    | _ (* rest-of-case *) => String(knd)
  )
)
//
(* ****** ****** *)

local
//
val
theGamebd =
  mtrxszref_make_elt(NROW, NCOL, XN0)
//
in (* in-of-local *)

implement theGamebd_get() = theGamebd

end // end of [local]

(* ****** ****** *)
//
extern
fun
theGamebd_display(): void = "mac#"
//
implement
theGamebd_display() = let
//
val G = theGamebd_get()
val M = thePrintbd_get()
//
in
//
G.foreach()(lam(i, j) => M[i,j] := xnode2string(G[i,j]))
//
end // end of [Gamebd_display]
//
(* ****** ****** *)

local
//
val
theVisitbd =
  mtrxszref_make_elt(NROW, NCOL, 0)
//
in (* in-of-local *)

implement theVisitbd_get() = theVisitbd

end // end of [local]

implement
theVisitbd_reset() = let
  val V = theVisitbd_get()
in
  V.foreach()(lam(i, j) => V[i,j] := 0)
end // end of [theVisitbd_reset]

(* ****** ****** *)

local
//
val
thePrintbd =
  mtrxszref_make_elt(NROW, NCOL, "")
//
in (* in-of-local *)

implement thePrintbd_get() = thePrintbd

end // end of [local]

(* ****** ****** *)
//
extern
fun
Printbd_display
  (M: printbd): void = "mac#"
//
implement
Printbd_display
  (M) = let
//
val X = "+"
//
val m = M.nrow() and n = M.ncol()
//
val () = print(X)
val () = n.foreach()(lam(j) =<cloref1> print(X))
val () = println!(X)
//
val () =
m.foreach()
(
  lam(i) =>
  (
    print(X);
    n.foreach()(lam(j) => print(M[i,j]));
    println!(X)
  )
) (* end of [val] *)
//
val () = print(X)
val () = n.foreach()(lam(j) =<cloref1> print(X))
val () = println!(X)
//
in
  // nothing
end // end of [Printbd_display]
//
(* ****** ****** *)

%{^
//
var
theKeyDowns =
  $(document).asEventStream("keydown")
//
var
theKeyDowns =
theKeyDowns.doAction(".preventDefault")
//
%} // end of ...

(* ****** ****** *)

val () = theWormlike_scene2()
val () = theWormlike_bonus_rand(20)

(* ****** ****** *)

val () = Wormlike_worm_initize()
val () = Wormlike_keyboard_initize()

(* ****** ****** *)

%{$
//
function
thePrintbd_display()
{
//
theGamebd_display();
//
ats2jspre_the_print_store_clear();
//
Printbd_display(thePrintbd_get(/*void*/));
//
document.getElementById("theWormlike_printbd").innerHTML = ats2jspre_the_print_store_join();
//
} /* end of [thePrintbd_display] */
//
%} // end of [%{$]

(* ****** ****** *)

%{$
//
function
Wormlike_initize()
{
//
theVisitbd_reset();
//
thePrintbd_display();
//
return; // from [Wormlike_initize]
//
} // end of [Wormlike_initize]
%}

(* ****** ****** *)

%{$
//
jQuery(document).ready(function(){Wormlike__dynload(); Wormlike_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Wormlike_main.dats] *)
