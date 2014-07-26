(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)
//
implement
parerr_make (loc, node) =
  '{ parerr_loc= loc, parerr_node= node }
//
(* ****** ****** *)
//
implement
the_parerrlst_clear () =
  list_vt_free (the_parerrlst_pop_all ())
//
(* ****** ****** *)

implement
the_parerrlst_add_ifnbt
  (bt, loc, node) = let
in
//
if (bt = 0)
  then the_parerrlst_insert (parerr_make (loc, node)) else ()
//
end // end of [the_parerrlst_add_if0]

(* ****** ****** *)

implement
fprint_parerr
  (out, x) = let
//
val () =
fprint! (out, x.parerr_loc, ": ")
//
in
//
case+
x.parerr_node of
//
| PARERR_LPAREN () =>
  {
    val () = fprintln! (out, "left-parenthese is expected")
  }
| PARERR_RPAREN () =>
  {
    val () = fprintln! (out, "right-parenthese is expected")
  }
//
end // end of [fprint_parerr]

(* ****** ****** *)

implement
fprint_parerrlst
  (out, xs) =
(
//
case+ xs of
| list_nil () => ()
| list_cons (x, xs) =>
  {
    val () = fprint_parerr (out, x)
    val () = fprint_parerrlst (out, xs)
  }
//
) (* end of [fprint_parerrlst] *)

(* ****** ****** *)

implement
the_parerrlst_print_free
  () = nerr where
{
//
  val xs = the_parerrlst_pop_all ()
  val () = fprint_parerrlst (stderr_ref, $UN.list_vt2t(xs))
  val nerr = list_vt_length (xs)
  val ((*freed*)) = list_vt_free (xs)
//
} (* end of [the_parerrlst_print_free] *)

(* ****** ****** *)

(* end of [atsparemit_parerr.dats] *)
