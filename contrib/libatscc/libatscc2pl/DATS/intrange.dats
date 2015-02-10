(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-11:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_"
#define
ATS_STATIC_PREFIX "_ats2plpre_intrange_"
//
(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include "{$LIBATSCC}/DATS/intrange.dats"
//
(* ****** ****** *)

%{$
######
1; #note that it is needed by 'use' or 'require'
######
%} // end of [%{$]

(* ****** ****** *)

(* end of [intrange.dats] *)
