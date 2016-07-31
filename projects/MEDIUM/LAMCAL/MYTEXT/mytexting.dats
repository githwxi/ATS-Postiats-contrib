(*
// ATS-texting LAMCAL
*)
(* ****** ****** *)
//
#include
"utils/atexting\
/atexting_include_all.dats"
//
(* ****** ****** *)
//
#include
"utils/atexting\
/DATS/SHARE/atexting_textdef_pre.dats"
//
(* ****** ****** *)
//
extern
fun
libatsynmark_dynloadall(): void = "ext#"
val () = libatsynmark_dynloadall((*void*))
//
(* ****** ****** *)
//
implement
gprint$out<>() = the_atext_outchanlst_top()
//
(* ****** ****** *)

local
//
fun{}
auxopr
(
  opnm1: string
, opnm2: string
, tynm0: string
) : void = () where
{
//
val () =
gprintln!
(
  "fun ", opnm1
, "_", tynm0, "_", tynm0
, ": compopr_type(", tynm0, ")"
) (* end of [gprintln!] *)
val () =
gprintln!
(
  "overload ", opnm2
, " with ", opnm1, "_", tynm0, "_", tynm0
) (* end of [gprintln!] *)
//
} (* end of [auxopr] *)
//
in (* in-of-local *)
//
fun{}
ats2decl_equal
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () = auxopr("eq", "=", tynm)
val () = auxopr("neq", "!=", tynm)
//
} (* end of [ats2decl_equal] *)
//
fun{}
ats2decl_compare
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () = auxopr("lt", "<", tynm)
val () = auxopr("lte", "<=", tynm)
val () = auxopr("gt", ">", tynm)
val () = auxopr("gte", ">=", tynm)
val () = auxopr("eq", "=", tynm)
val () = auxopr("neq", "!=", tynm)
//
val () =
gprintln!
(
  "fun "
, "compare_", tynm, "_", tynm, ": compare_type(", tynm, ")"
) (* end of [gprintln!] *)
//
val () =
gprintln! ("overload compare with compare_", tynm, "_", tynm)
//
} (* end of [ats2decl_compare] *)

end // end of [local]

(* ****** ****** *)

local

val
def_eq =
TEXTDEFfun (
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
ats2decl_equal(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *) (* def_eq *)

val
def_cmp = 
TEXTDEFfun (
lam(loc, xs) => let
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
ats2decl_compare(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *) (* def_cmp *)

in (* in-of-local *)

val () = the_atextmap_insert("ats2decl_equal", def_eq)
val () = the_atextmap_insert("ats2decl_compare", def_cmp)

end // end of [local]

(* ****** ****** *)

fun{}
ats2decl_print
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!
( "fun"
, " print_", tynm, ": print_type(", tynm, ")"
) (* end of [gprintln!] *)
//
val () =
gprintln! ("overload print with print_", tynm)
//
} (* end of [ats2decl_print] *)
fun{}
ats2decl_prerr
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!
( "fun "
, "prerr_", tynm, ": prerr_type(", tynm, ")"
) (* end of [gprintln!] *)
//
val () =
gprintln! ("overload prerr with prerr_", tynm)
//
} (* end of [ats2decl_prerr] *)
fun{}
ats2decl_fprint
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!
( "fun "
, "fprint_", tynm, ": fprint_type(", tynm, ")"
) (* end of [gprintln!] *)
//
val () =
gprintln! ("overload fprint with fprint_", tynm)
//
} (* end of [ats2decl_fprint] *)

(* ****** ****** *)

local

val
def_fpr =
TEXTDEFfun (
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
val ((*void*)) =
ats2decl_print(loc, atext_strngfy(x0))
val ((*void*)) =
ats2decl_prerr(loc, atext_strngfy(x0))
val ((*void*)) =
ats2decl_fprint(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *) (* def_fpr *)

in (* in-of-local *)
//
val () =
the_atextmap_insert("ats2decl_fprint", def_fpr)
//
end // end of [local]

(* ****** ****** *)

local

fun
ats2impl_cmpops
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!("implement")
val () =
gprintln!
( "lt_", tynm, "_", tynm, "(x1, x2) = "
, "(compare_", tynm, "_", tynm, "(x1, x2) < 0)"
) (* gprintln! *)
//
val () =
gprintln!("implement")
val () =
gprintln!
( "lte_", tynm, "_", tynm, "(x1, x2) = "
, "(compare_", tynm, "_", tynm, "(x1, x2) <= 0)"
) (* gprintln! *)
//
val () =
gprintln!("implement")
val () =
gprintln!
( "gt_", tynm, "_", tynm, "(x1, x2) = "
, "(compare_", tynm, "_", tynm, "(x1, x2) > 0)"
) (* gprintln! *)
//
val () =
gprintln!("implement")
val () =
gprintln!
( "gte_", tynm, "_", tynm, "(x1, x2) = "
, "(compare_", tynm, "_", tynm, "(x1, x2) >= 0)"
) (* gprintln! *)
//
val () =
gprintln!("implement")
val () =
gprintln!
( "eq_", tynm, "_", tynm, "(x1, x2) = "
, "(compare_", tynm, "_", tynm, "(x1, x2) = 0)"
) (* gprintln! *)
//
val () =
gprintln!("implement")
val () =
gprintln!
( "neq_", tynm, "_", tynm, "(x1, x2) = "
, "(compare_", tynm, "_", tynm, "(x1, x2) != 0)"
) (* gprintln! *)
//
} (* ats2impl_cmpops *)

val
def_cmpops =
TEXTDEFfun (
lam(loc, xs) => let
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
ats2impl_cmpops(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* def_cmpops *)

in (* in-of-local *)
//
val () =
the_atextmap_insert
  ("ats2impl_compare2cmpops", def_cmpops)
//
end // end of [local]

(* ****** ****** *)

local

fun
ats2impl_printerr
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!("implement")
val () =
gprintln!
( "print_", tynm, "(x0) = "
, "fprint_", tynm, "(stdout_ref, x0)"
) (* gprintln! *)
//
val () =
gprintln!("implement")
val () =
gprintln!
( "prerr_", tynm, "(x0) = "
, "fprint_", tynm, "(stderr_ref, x0)"
) (* gprintln! *)
//
} (* ats2impl_printerr *)

val
def_outerr =
TEXTDEFfun (
lam(loc, xs) => let
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
ats2impl_printerr(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *) (* def_outerr *)

in (* in-of-local *)
//
val () =
the_atextmap_insert
  ("ats2impl_fprint2printerr", def_outerr)
//
end // end of [local]

(* ****** ****** *)

local

fun
ats2impl_myfunset
(
  loc: loc_t
, _elt_: string, _module_: string
) : void =
(
//
gprintln!("\
(* ****** ****** *)

local
//
typedef elt = ")(_elt_)("
//
staload
FS = \"libats/ML/SATS/funset.sats\"
//
in (* in-of-local *)

#include \"libats/ML/HATS/myfunset.hats\"

end // end of [local]

(* ****** ****** *)

implement ")(_module_)(" = myfunset_make_module()

(* ****** ****** *)\
") (* gprintln! *)
//
) (* end of [ats2impl_myfunset] *)

in (* in-of-local *)

val
def_myfs =
TEXTDEFfun (
//
lam(loc, xs) => let
//
val-
cons0
(
  x0, xs
) = xs
val _elt_ = atext_strngfy(x0)
//
var xs:
atextlst = xs
//
val _module_ =
(
case+ xs of
| list0_nil() =>
    (_elt_ + "_funset")
| list0_cons(x1, xs2) =>
    (xs := xs2; atext_strngfy(x1))
) : string // end of [val]
//
val ((*void*)) =
  ats2impl_myfunset(loc, _elt_, _module_)
//
in
  atext_make_nil(loc)  
end // end of [lam]
//
) (* TEXTDEFfun *) (* def_funset *)
//
val () =
the_atextmap_insert("ats2impl_myfunset", def_myfs)
//
end // end of [local]

(* ****** ****** *)

(* end of [mytexting.dats] *)
