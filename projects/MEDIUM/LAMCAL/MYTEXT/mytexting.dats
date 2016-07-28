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

fun{}
declats_equal
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!
(
  "fun ", "eq_", tynm, "_", tynm, ": equal_type(", tynm, ")"
) (* end of [gprintln!] *)
val () =
gprintln!
(
  "fun ", "neq_", tynm, "_", tynm, ": nequal_type(", tynm, ")"
) (* end of [gprintln!] *)
//
val () = gprintln! ("overload = with eq_", tynm, "_", tynm)
val () = gprintln! ("overload != with neq_", tynm, "_", tynm)
//
} (* end of [declats_equal] *)

(* ****** ****** *)

fun{}
declats_compare
(
  loc: loc_t, tynm: string
) : void = () where
{
//
val () =
gprintln!
(
  "fun ", "compare_", tynm, "_", tynm, ": compare_type(", tynm, ")"
) (* end of [gprintln!] *)
//
val () = gprintln! ("overload compare with compare_", tynm, "_", tynm)
//
} (* end of [declats_compare] *)

(* ****** ****** *)

fun{}
declats_print
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
} (* end of [declats_print] *)
fun{}
declats_prerr
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
} (* end of [declats_prerr] *)
fun{}
declats_fprint
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
} (* end of [declats_fprint] *)

(* ****** ****** *)

local

val
def_equal =
TEXTDEFfun
(
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
declats_equal(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

val
def_compare =
TEXTDEFfun
(
lam(loc, xs) => let
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
declats_compare(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

val
def_equal_compare =
TEXTDEFfun
(
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
val ((*void*)) =
declats_equal(loc, atext_strngfy(x0))
val ((*void*)) =
declats_compare(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

in (* in-of-local *)

val () = the_atextmap_insert("declats_equal", def_equal)
val () = the_atextmap_insert("declats_compare", def_compare)
val () = the_atextmap_insert("declats_equal_compare", def_equal_compare)

end // end of [local]

(* ****** ****** *)

local

val
def_print =
TEXTDEFfun
(
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
declats_print(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

val
def_prerr =
TEXTDEFfun
(
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
declats_prerr(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

val
def_fprint =
TEXTDEFfun
(
lam(loc, xs) => let
val-
cons0(x0, xs) = xs
//
val ((*void*)) =
declats_fprint(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

val
def_print_prerr_fprint =
TEXTDEFfun
(
lam(loc, xs) => let
//
val-
cons0(x0, xs) = xs
val ((*void*)) =
declats_print(loc, atext_strngfy(x0))
val ((*void*)) =
declats_prerr(loc, atext_strngfy(x0))
val ((*void*)) =
declats_fprint(loc, atext_strngfy(x0))
//
in
  atext_make_nil(loc)
end // end of [lam]
) (* TEXTDEFfun *)

in (* in-of-local *)

val () = the_atextmap_insert("declats_print", def_print)
val () = the_atextmap_insert("declats_prerr", def_prerr)
val () = the_atextmap_insert("declats_fprint", def_fprint)
val () = the_atextmap_insert("declats_print_prerr_fprint", def_print_prerr_fprint)

end // end of [local]

(* ****** ****** *)

(* end of [mytexting.dats] *)
