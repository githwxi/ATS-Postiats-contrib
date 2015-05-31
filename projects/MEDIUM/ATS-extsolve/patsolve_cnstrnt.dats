(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

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

staload "./patsolve_cnstrnt.sats"

(* ****** ****** *)
//
implement
fprint_val<stamp> = fprint_stamp
implement
fprint_val<symbol> = fprint_symbol
//
(* ****** ****** *)

implement
fprint_val<s2rt> = fprint_s2rt
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<s2exp> = fprint_s2exp

(* ****** ****** *)

implement
fprint_val<s3itm> = fprint_s3itm
implement
fprint_val<h3ypo> = fprint_h3ypo
implement
fprint_val<c3nstr> = fprint_c3nstr

(* ****** ****** *)
//
implement
print_s2exp
  (x) = fprint_s2exp(stdout_ref, x)
implement
print_s2explst
  (xs) = fprint_s2explst(stdout_ref, xs)
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_stamp.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_symbol.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_location.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_s2rt.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_s2cst.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_s2var.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_s2vvar.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_s2exp.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_s3itm.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_h3ypo.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)
//
local
//
#include
"./CNSTRNT/patsolve_cnstrnt_c3nstr.dats" in (*nothing*)
//
end // end of [local]
//
(* ****** ****** *)

(* end of [patsolve_cnstrnt.dats] *)
