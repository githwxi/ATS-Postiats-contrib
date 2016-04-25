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
#include
"share/atspre_define.hats"
//
staload
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
staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
staload
_ = "{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)

staload "./Wormlike.sats"

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
Wormlike_display
  (M: printbd): void = "mac#"
//
implement
Wormlike_display
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
end // end of [Wormlike_display]
//
implement
theWormlike_display
  ((*void*)) = Wormlike_display(thePrintbd_get())
//
(* ****** ****** *)

%{$
//
function
Wormlike_display()
{
//
ats2jspre_the_print_store_clear();
//
Wormlike_display(thePrintbd_get());
//
document.getElementById("Wormlike_printbd").innerHTML = ats2jspre_the_print_store_join();
//
} /* end of [Wormlike_display] */
//
function
Wormlike_anim()
{
//
return; // from [Wormlike_anim]
//
} // end of [Wormlike_anim]
//
jQuery(document).ready(function(){Wormlike__dynload(); Wormlike_anim();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Wormlike_main.dats] *)
