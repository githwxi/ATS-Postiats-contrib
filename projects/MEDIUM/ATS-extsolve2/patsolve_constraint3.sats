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
abst0ype
stamp_t0ype = int
//
typedef stamp = stamp_t0ype
//
(* ****** ****** *)
//
fun
fprint_stamp: fprint_type(stamp)
overload fprint with fprint_stamp
//
(* ****** ****** *)
//
fun
eq_stamp_stamp : (stamp, stamp) -<fun0> bool
fun
neq_stamp_stamp : (stamp, stamp) -<fun0> bool
fun
compare_stamp_stamp : (stamp, stamp) -<fun0> int
//
overload = with eq_stamp_stamp
overload != with neq_stamp_stamp
overload compare with compare_stamp_stamp
//
(* ****** ****** *)

abstype symbol_type = ptr
typedef symbol = symbol_type

(* ****** ****** *)
//
fun
fprint_symbol: fprint_type(symbol)
overload fprint with fprint_symbol
//
(* ****** ****** *)

(* end of [patsolve_constraint3.sats] *)
