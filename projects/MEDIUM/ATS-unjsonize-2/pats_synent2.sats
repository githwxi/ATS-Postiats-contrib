(*
** UN-jsonizing level-2 syntax
*)

(* ****** ****** *)
//
abst0ype
stamp_t0ype = int
typedef stamp = stamp_t0ype
//
(* ****** ****** *)

abstype symbol_type
typedef symbol = symbol_type

(* ****** ****** *)
//
datatype label =
  | LABint of int | LABsym of symbol
//
(* ****** ****** *)
//
abstype location_type
//
typedef loc_t = location_type
typedef location = location_type
//
(* ****** ****** *)

abstype s2cst_type
typedef s2cst = s2cst_type

(* ****** ****** *)

abstype s2var_type
typedef s2var = s2var_type

(* ****** ****** *)

abstype d2con_type
typedef d2con = d2con_type

(* ****** ****** *)

abstype d2cst_type
typedef d2cst = d2cst_type

(* ****** ****** *)

abstype d2var_type
typedef d2var = d2var_type

(* ****** ****** *)

datatype
s2exp_node =
  | S2Ecst of s2cst
  | S2Evar of s2var
// end of [s2exp_node]

where
s2exp = $rec{
//
s2exp_loc= loc_t
,
s2exp_node= s2exp_node
//
} (* end of [s2exp] *)

(* ****** ****** *)

datatype
d2exp_node =
  | D2Ecst of d2cst
  | D2Evar of d2var
// end of [d2exp_node]

where
d2exp = $rec{
//
d2exp_loc= loc_t
,
d2exp_node= d2exp_node
//
} (* end of [d2exp] *)

(* ****** ****** *)

(* end of [pats_synent2.sats] *)
