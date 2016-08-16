(*
** For studying
** lambda-calculus
** cbv: call-by-value
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
staload "./lamcal.sats"
//
(* ****** ****** *)
//
implement
fprint_val<tvar> = fprint_tvar
//
implement
gequal_val_val<tvar> = eq_tvar_tvar
implement
gcompare_val_val<tvar> = compare_tvar_tvar
//
(* ****** ****** *)
//
datatype tvar =
  | TVARname of string
  | TVARindex of intGte(0)
//
assume tvar_type = tvar
//
(* ****** ****** *)
//
implement
tvar_make_name(name) = TVARname(name)
//
implement
tvar_make_index(index) = TVARindex(index)
//
(* ****** ****** *)
//
implement
tvar_get_index
  (x0) =
(
  case+ x0 of
  | TVARname _ => (~1) | TVARindex(i) => (i)
)
//
(* ****** ****** *)
//
implement
tvar_shift_gte
  (x0, n) =
(
  case+ x0 of
  | TVARname _ => x0
  | TVARindex(i) => if i >= n then TVARindex(i+1) else x0
)
//
(* ****** ****** *)

implement
compare_tvar_tvar
  (x1, x2) =
(
case+ x1 of
| TVARname(n1) =>
  (
    case+ x2 of
    | TVARname(n2) => compare(n1, n2) | TVARindex(i2) => (1)
  )
| TVARindex(i1) =>
  (
    case+ x2 of
    | TVARname(n2) => (~1) | TVARindex(i2) => compare(i1, i2)
  )
) (* end of [compare_tvar_tvar] *)

(* ****** ****** *)
//
implement
print_tvar(x) = fprint_tvar(stdout_ref, x)
implement
prerr_tvar(x) = fprint_tvar(stderr_ref, x)
//
(* ****** ****** *)
//
implement
fprint_tvar(out, x) =
(
case+ x of
| TVARname(name) => fprint!(out, name)
| TVARindex(index) => fprint!(out, "$", index)
)
//
(* ****** ****** *)
////  
(* ****** ****** *)
(*
//
extern
fun{}
fprint_tvar_
  (FILEref, tvar): void
//
#ifdef
CODEGEN2_FPRINT
#then
#codegen2(fprint, tvar)
#else
//
#include
"./CODEGEN/lamcal_tvar_fprint.hats"
//
implement
fprint_tvar
  (out, x0) = fprint_tvar_<>(out, x0)
//
#endif // end of [ifdef]
//
*)
(* ****** ****** *)
//
#include"\
./CODEGEN/lamcal_tvar_order.hats\
" // #include
//
#include"\
./CODEGEN/lamcal_tvar_funset.hats\
" // #include
//
(* ****** ****** *)

(* end of [lamcal_tvar.dats] *)
