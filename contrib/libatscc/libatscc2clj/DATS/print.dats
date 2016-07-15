(*
** For writing ATS code
** that translates into Clojure
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2cljpre_"
#define
ATS_STATIC_PREFIX "_ats2cljpre_print_"
//
(* ****** ****** *)
//
staload "./../basics_clj.sats"
//
staload "./../SATS/print.sats"
//
(* ****** ****** *)
//
implement
print_val<int> = print_int
implement
print_val<bool> = print_bool
implement
print_val<double> = print_double
implement
print_val<string> = print_string
//
(* ****** ****** *)

(* end of [print.dats] *)
