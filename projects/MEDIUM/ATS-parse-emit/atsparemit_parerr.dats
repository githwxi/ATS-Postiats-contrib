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

fun
synent_needed
(
  out: FILEref
, x: parerr, name: string
) : void = () where {
//
val () = fprint (out, x.parerr_loc)
val () =
  fprintln! (out, ": error(parsing): the syntactic entity [", name, "] is needed.")
//
} (* end of [synent_needed] *)

(* ****** ****** *)

fun
keyword_needed
(
  out: FILEref
, x: parerr, name: string
) : void = () where {
  val () = fprint (out, x.parerr_loc)
  val () = fprintln! (out, ": error(parsing): the keyword [", name, "] is needed.")
} (* end of [keyword_needed] *)

(* ****** ****** *)

implement
fprint_parerr
  (out, x) = let
//
macdef
SN (x,name) =
synent_needed (out, ,(x), ,(name))
macdef
KN (x, name) =
keyword_needed (out, ,(x), ,(name))
//
in
//
case+
x.parerr_node of
//
| PARERR_EOF () => KN (x, "EOF")
//
| PARERR_COMMA () => KN (x, "COMMA")
| PARERR_SEMICOLON () => KN (x, "SEMICOLON")
//
//
| PARERR_LPAREN () => KN (x, "(")
| PARERR_RPAREN () => KN (x, ")")
//
| PARERR_i0de () => SN (x, "i0de")
| PARERR_s0exp () => SN (x, "s0exp")
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
