(*
** For studying
** lambda-calculus
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

staload "./lamcal.sats"

(* ****** ****** *)

implement
fprint_term
  (out, t0) =
(
//
case+ t0 of
| TMvar(x) =>
    fprint! (out, "TMvar(", x, ")")
| TMlam(x1, t2) =>
    fprint! (out, "TMlam(", x1, ", ", t2, ")")
| TMapp(t1, t2) =>
    fprint! (out, "TMapp(", t1, ", ", t2, ")")
//
) (* end of [fprint_term] *)

(* ****** ****** *)

implement
term_get_at
  (t0, ns) =
(
  case+ ns of
  | list0_nil() => t0
  | list0_cons(n, ns) =>
    (
      case+ (t0, n) of
      | (TMlam(x1, t2), 0) => t2[ns]
      | (TMapp(t1, t2), 0) => t1[ns]
      | (TMapp(t1, t2), 1) => t2[ns]
      | (_, _)(*erroneous-path*) => $raise TPATH_ERROR()
    ) (* list0_cons *)
) (* end of [term_get_at] *)

(* ****** ****** *)

(* end of [lamcal_term.dats] *)
