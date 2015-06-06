(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#ifndef
PATSOLVE_Z3_SOLVING
#include "./myheader.hats"
#endif // end of [ifndef]
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
staload "./patsolve_z3_solving_ctx.dats"
//
(* ****** ****** *)

assume sort_vtype = Z3_sort

(* ****** ****** *)

implement
sort_decref
  (ty) = () where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val () = Z3_sort_dec_ref(ctx, ty)
  prval ((*void*)) = fpf(ctx)
}

(* ****** ****** *)

implement
sort_incref
  (ty) = ty2 where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val ty2 = Z3_sort_inc_ref(ctx, ty)
  prval ((*void*)) = fpf(ctx)
}

(* ****** ****** *)
//
implement 
sort_int () = res where
{
  val (fpf | ctx) = 
    the_Z3_context_vget()
  // end of [val]
  val res = Z3_mk_int_sort (ctx)
  prval ((*void*)) = fpf (ctx)
}
//
(* ****** ****** *)
//
implement 
sort_bool () = res where
{
  val (fpf | ctx) = 
    the_Z3_context_vget()
  // end of [val]
  val res = Z3_mk_bool_sort (ctx)
  prval ((*void*)) = fpf (ctx)
}
//
(* ****** ****** *)
//
implement 
sort_real () = res where
{
  val (fpf | ctx) = 
    the_Z3_context_vget()
  // end of [val]
  val res = Z3_mk_real_sort (ctx)
  prval ((*void*)) = fpf (ctx)
}
//
(* ****** ****** *)

implement
sort_error
  (s2t0) = res where
{
//
val () =
prerrln!
  ("sort_error: s2t0 = ", s2t0)
//
val () = assertloc(false)
val res = sort_error(s2t0)
//
} (* end of [sort_error] *)

(* ****** ****** *)

implement
sort_make_s2rt(s2t0) = let
//
val () =
println! ("sort_make: s2t0 = ", s2t0)
//
in
//
case+ s2t0 of
//
| S2RTint() => sort_int()
| S2RTaddr() => sort_int()
| S2RTbool() => sort_bool()
//
| S2RTreal() => sort_real()
(*
| S2RTstring() => sort_string()
*)
//
| _(*unrecognized*) => sort_error(s2t0)
//
end (* end of [sort_make_s2rt] *)

(* ****** ****** *)

(* end of [patsolve_z3_solving_sort.dats] *)
