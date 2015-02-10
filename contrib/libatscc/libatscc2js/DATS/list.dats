(*
** For writing ATS code
** that translates into Javascript
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
#define
ATS_STATIC_PREFIX "_ats2jspre_list_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../SATS/print.sats"
staload "./../SATS/filebas.sats"
//
(* ****** ****** *)
//
staload "./../SATS/list.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/list.dats"
//
(* ****** ****** *)
//
extern
fun{}
print_list$sep (): void
//
implement
{}(*tmp*)
print_list$sep () = print_string (", ")
//
implement
{a}(*tmp*)
print_list
  (xs) = let
//
implement
fprint_val<a>
  (out, x) = print_val<a> (x)
implement
fprint_list$sep<> (out) = print_list$sep<> ()
//
in
  fprint_list<a> (STDOUT, xs)
end // end of [print_list]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
print_list_sep
  (xs, sep) = let
//
implement
fprint_val<a> (out, x) = print_val<a> (x)
implement
fprint_list$sep<> (out) = print_string (sep)
//
in
  fprint_list<a> (STDOUT, xs)
end // end of [print_list_sep]
//
(* ****** ****** *)

(* end of [list.dats] *)
