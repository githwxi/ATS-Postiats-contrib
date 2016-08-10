(* ****** ****** *)
//
// HX: 2016-08-09:
// Some PAGEN-functions
// for creating assignments  
// 
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/random.sats"
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/datetime.sats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
LIBTUTORIATS_targetloc
"$PATSHOMERELOC/projects/LARGE/TUTORIATS/libtutoriats"
//
staload
"{$LIBTUTORIATS}/DATS/gprint_html_table.dats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_open() =
{
//
val () =
gprintln!
("\
<table class=\"table\">\
") (* gprintln! *)
//
} (* end of [gprint_table_open] *)
//
implement
{}(*tmp*)
gprint_table_close() =
{
//
val () =
gprintln! ("</table>")
//
} (* end of [gprint_table_close] *)
//
(* ****** ****** *)

(* end of [midterm-2.dats] *)
