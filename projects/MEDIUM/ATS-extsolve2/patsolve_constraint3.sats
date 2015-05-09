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
//
fun theStamp_getinc(): stamp
//
fun theStamp_update(n: stamp): void
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

fun
symbol_make_name (string): symbol

(* ****** ****** *)
//
fun
symbol_get_name (symbol): string
//
overload .name with symbol_get_name
//
(* ****** ****** *)
//
fun
eq_symbol_symbol : (symbol, symbol) -<fun0> bool
fun
neq_symbol_symbol : (symbol, symbol) -<fun0> bool
fun
compare_symbol_symbol : (symbol, symbol) -<fun0> int
//
overload = with eq_symbol_symbol
overload != with neq_symbol_symbol
overload compare with compare_symbol_symbol
//
(* ****** ****** *)
//
abstype
location_type = ptr
//
typedef loc_t = location_type
//
(* ****** ****** *)
//
fun
fprint_location: fprint_type(loc_t)
//
overload fprint with fprint_location
//
(* ****** ****** *)
//
fun location_make (rep: string): loc_t
//
(* ****** ****** *)

datatype s2rt =
//
  | S2RTint of ()
  | S2RTaddr of ()
  | S2RTbool of ()
//
  | S2RTcls of ()
//
  | S2RTtup of ((*void*))
//
  | S2RTtype of ((*void*))
  | S2RTt0ype of ((*void*))
//
  | S2RTfun of (s2rtlst(*args*), s2rt (*res*))
//
  | S2RTerr of ((*void*))
  | S2RTignored of ((*void*))
//
// end of [datatype]

where s2rtlst = List0 (s2rt)

(* ****** ****** *)
//
fun
fprint_s2rt: fprint_type(s2rt)
//
overload fprint with fprint_s2rt
//
(* ****** ****** *)
//
abstype
s2cst_type = ptr
//
typedef s2cst = s2cst_type
//
typedef s2cstlst = List0 (s2cst)
vtypedef s2cstlst_vt = List0_vt (s2cst)
//
typedef s2cstopt = Option (s2cst)
vtypedef s2cstopt_vt = Option_vt (s2cst)
//
(* ****** ****** *)
//
fun
fprint_s2cst: fprint_type(s2cst)
//
overload fprint with fprint_s2cst
//
(* ****** ****** *)
//
fun
s2cst_make
  (s2rt, symbol, stamp): s2cst
//
fun s2cst_get_srt (s2cst): s2rt
fun s2cst_get_name (s2cst): symbol
fun s2cst_get_stamp (s2cst): stamp
//
overload .srt with s2cst_get_srt
overload .name with s2cst_get_name
overload .stamp with s2cst_get_stamp
//
(* ****** ****** *)
//
abstype
s2var_type = ptr
//
typedef s2var = s2var_type
//
typedef s2varlst = List0 (s2var)
vtypedef s2varlst_vt = List0_vt (s2var)
//
typedef s2varopt = Option (s2var)
vtypedef s2varopt_vt = Option_vt (s2var)
//
(* ****** ****** *)
//
fun
fprint_s2var: fprint_type(s2var)
//
overload fprint with fprint_s2var
//
(* ****** ****** *)
//
fun
s2var_make
  (s2rt, symbol, stamp): s2var
//
fun s2var_make_srt (s2rt): s2var
//
(* ****** ****** *)
//
abstype
s2Var_type = ptr
//
typedef s2Var = s2Var_type
//
typedef s2Varlst = List0 (s2Var)
vtypedef s2Varlst_vt = List0_vt (s2Var)
//
typedef s2Varopt = Option (s2Var)
vtypedef s2Varopt_vt = Option_vt (s2Var)
//
(* ****** ****** *)
//
fun
fprint_s2Var: fprint_type(s2Var)
//
overload fprint with fprint_s2Var
//
(* ****** ****** *)

datatype
tyreckind =
  | TYRECKINDbox (* boxed *)
  | TYRECKINDbox_lin (* boxed *)
  | TYRECKINDflt0 (* flat *)
  | TYRECKINDflt1 of stamp (* flat *)
  | TYRECKINDflt_ext of string  (* flat *)
// end of [tyreckind]

(* ****** ****** *)
//
fun tyreckind_is_box (knd: tyreckind): bool
fun tyreckind_is_box_lin (knd: tyreckind): bool
//
fun tyreckind_is_flt0 (knd: tyreckind): bool
fun tyreckind_is_flt1 (knd: tyreckind): bool
fun tyreckind_is_flt_ext (knd: tyreckind): bool
//
(* ****** ****** *)

datatype
s2exp_node =
//
  | S2Eint of (int)
  | S2Eintinf of (string)
//
  | S2Ecst of (s2cst)
  | S2Evar of (s2var)
  | S2EVar of (s2Var)
//
  | S2Eignored of ((*void*))
// end of [s2exp_node]

where
s2exp = $rec{
  s2exp_srt= s2rt, s2exp_node= s2exp_node
} (* end of [s2exp] *)

(* ****** ****** *)

(* end of [patsolve_constraint3.sats] *)
