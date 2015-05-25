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
#define ATS_PACKNAME "PATSOLVE_CNSTRNT"
//
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
//
overload fprint with fprint_stamp
//
(* ****** ****** *)

fun stamp_make(int): stamp

(* ****** ****** *)

fun hash_stamp(stamp):<> ulint

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
fun the_stamp_getinc(): stamp
//
fun the_stamp_update(n: stamp): void
//
(* ****** ****** *)

abstype symbol_type = ptr
typedef symbol = symbol_type

(* ****** ****** *)
//
fun
print_symbol: symbol -> void
fun
fprint_symbol: fprint_type(symbol)
//
overload print with print_symbol
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
  | S2RTnamed of (symbol)
//
  | S2RTignored of ((*void*))
//
// end of [datatype]

where s2rtlst = List0(s2rt)

(* ****** ****** *)
//
fun
print_s2rt : s2rt -> void
fun
fprint_s2rt: fprint_type(s2rt)
//
overload print with print_s2rt
overload fprint with fprint_s2rt
//
(* ****** ****** *)
//
abstype
s2cst_type = ptr
//
typedef s2cst = s2cst_type
//
typedef s2cstlst = List0(s2cst)
vtypedef s2cstlst_vt = List0_vt(s2cst)
//
typedef s2cstopt = Option(s2cst)
vtypedef s2cstopt_vt = Option_vt(s2cst)
//
(* ****** ****** *)
//
fun
s2cst_make
  (symbol, s2rt, stamp): s2cst
//
(* ****** ****** *)
//
fun
print_s2cst: s2cst -> void
fun
fprint_s2cst: fprint_type(s2cst)
//
overload print with print_s2cst
overload fprint with fprint_s2cst
//
(* ****** ****** *)
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
typedef s2varlst = List0(s2var)
vtypedef s2varlst_vt = List0_vt(s2var)
//
typedef s2varopt = Option(s2var)
vtypedef s2varopt_vt = Option_vt(s2var)
//
(* ****** ****** *)
//
fun
s2var_make
  (symbol, s2rt, stamp): s2var
//
(* ****** ****** *)
//
fun
print_s2var: s2var -> void
fun
fprint_s2var: fprint_type(s2var)
//
overload print with print_s2var
overload fprint with fprint_s2var
//
(* ****** ****** *)
//
fun
s2var_get_srt (s2var): s2rt
fun
s2var_get_name (s2var): symbol
fun
s2var_get_stamp (s2var): stamp
//
overload .srt with s2var_get_srt
overload .name with s2var_get_name
overload .stamp with s2var_get_stamp
//
(* ****** ****** *)
//
abstype
s2Var_type = ptr
//
typedef s2Var = s2Var_type
//
typedef s2Varlst = List0(s2Var)
vtypedef s2Varlst_vt = List0_vt(s2Var)
//
typedef s2Varopt = Option(s2Var)
vtypedef s2Varopt_vt = Option_vt(s2Var)
//
(* ****** ****** *)
//
fun s2Var_make(stamp): s2Var
//
(* ****** ****** *)
//
fun
print_s2Var: s2Var -> void
fun
fprint_s2Var: fprint_type(s2Var)
//
overload print with print_s2Var
overload fprint with fprint_s2Var
//
(* ****** ****** *)
//
fun
s2Var_get_stamp (s2Var): stamp
//
overload .stamp with s2Var_get_stamp
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
| S2Eeqeq of (s2exp, s2exp)
//
| S2Eapp of (s2exp, s2explst)
| S2Emetdec of
    (s2explst(*met*), s2explst(*bound*)) // strictly decreasing
  // end of [S2Emetdec]
//
| S2Eignored of ((*void*))
// end of [s2exp_node]

where
s2exp = $rec{
  s2exp_srt= s2rt, s2exp_node= s2exp_node
} (* end of [s2exp] *)

and s2explst = List0 (s2exp)

(* ****** ****** *)
//
fun
s2exp_make_node (s2rt, s2exp_node): s2exp
//
(* ****** ****** *)
//
fun
fprint_s2exp : fprint_type(s2exp)
fun
fprint_s2explst : fprint_type(s2explst)
//
overload fprint with fprint_s2exp
overload fprint with fprint_s2explst of 10
//
(* ****** ****** *)

datatype s3itm =
  | S3ITMsvar of s2var
  | S3ITMsVar of s2Var
  | S3ITMhypo of h3ypo
  | S3ITMcnstr of c3nstr
  | S3ITMcnstr_ref of (loc_t, c3nstropt)
  | S3ITMdisj of s3itmlstlst
// end of [s3item]

and h3ypo_node =
  | H3YPOprop of s2exp
  | H3YPObind of (s2var, s2exp)
  | H3YPOeqeq of (s2exp, s2exp)
// end of [h3ypo_node]

and c3nstr_node =
  | C3NSTRprop of s2exp
  | C3NSTRitmlst of s3itmlst
// end of [c3nstr_node]

where
//
s3itmlst = List0(s3itm)
//
and s3itmlstlst = List0(s3itmlst)
//
and h3ypo =
  $rec{ h3ypo_loc= loc_t, h3ypo_node= h3ypo_node }
//
and c3nstr =
  $rec{ c3nstr_loc= loc_t, c3nstr_node= c3nstr_node }
//
and c3nstropt = Option(c3nstr)

(* ****** ****** *)
//
fun
h3ypo_make_node (loc_t, h3ypo_node): h3ypo
//
(* ****** ****** *)
//
fun
c3nstr_make_node (loc_t, c3nstr_node): c3nstr
//
(* ****** ****** *)
//
fun
fprint_s3itm: fprint_type(s3itm)
fun
fprint_s3itmlst: fprint_type(s3itmlst)
fun
fprint_s3itmlstlst: fprint_type(s3itmlstlst)
//
overload fprint with fprint_s3itm
overload fprint with fprint_s3itmlst of 10
overload fprint with fprint_s3itmlstlst of 20
//
(* ****** ****** *)
//
fun
fprint_h3ypo: fprint_type(h3ypo)
//
overload fprint with fprint_h3ypo
//
(* ****** ****** *)
//
fun
fprint_c3nstr: fprint_type(c3nstr)
fun
fprint_c3nstropt: fprint_type(c3nstropt)
//
overload fprint with fprint_c3nstr
overload fprint with fprint_c3nstropt of 10
//
(* ****** ****** *)
//
// HX-2015-05-25:
// pretty-printing
//
fun fpprint_c3nstr: fprint_type(c3nstr)
//
(* ****** ****** *)

(* end of [patsolve_cnstrnt.sats] *)
