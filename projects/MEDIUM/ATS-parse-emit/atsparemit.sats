(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
SBF =
"libats/SATS/stringbuf.sats"
//
stadef stringbuf = $SBF.stringbuf
//
(* ****** ****** *)
//
staload
DA =
"libats/SATS/dynarray.sats"
//
stadef dynarray = $DA.dynarray
//
(* ****** ****** *)
//
staload
CS = "{$LIBATSHWXI}/cstream/SATS/cstream.sats"
stadef cstream = $CS.cstream
//
(* ****** ****** *)
//
typedef
fprint_type
  (a: t@ype) = (FILEref, a) -> void
//
(* ****** ****** *)
//
abstype
filename_type = ptr
typedef fil_t = filename_type
//
(* ****** ****** *)

val filename_dummy : fil_t
val filename_stdin : fil_t

(* ****** ****** *)
//
fun
print_filename : (fil_t) -> void
fun
prerr_filename : (fil_t) -> void
overload print with print_filename
overload prerr with prerr_filename
//
fun
fprint_filename : fprint_type (fil_t)
overload fprint with fprint_filename
//
(* ****** ****** *)
//
fun the_filename_pop ((*void*)): fil_t
fun the_filename_push (fil: fil_t): void
//
fun the_filename_get ((*void*)): fil_t
//
(* ****** ****** *)
(*
//
abstype
position_type = ptr
typedef pos_t = position_type  
//
(* ****** ****** *)
//
fun
print_position : (pos_t) -> void
fun
prerr_position : (pos_t) -> void
overload print with print_position
overload prerr with prerr_position
//
fun
fprint_position : fprint_type (pos_t)
overload fprint with fprint_position
//
*)
(* ****** ****** *)

typedef
position =
@{
, pos_ntot= int
, pos_nrow= int
, pos_ncol= int
} (* end of [position] *)

(* ****** ****** *)
//
fun
position_incby1 (pos: &position >> _): void
//
fun
position_decby (pos: &position >> _, n: intGte(0)): void
fun
position_incby (pos: &position >> _, n: intGte(0)): void
//
fun position_incby_char (pos: &position >> _, c: char): void
//
(* ****** ****** *)
//
abstype
location_type = ptr
typedef loc_t = location_type  
//
(* ****** ****** *)

val location_dummy : loc_t

(* ****** ****** *)
//
fun
print_location : (loc_t) -> void
fun
prerr_location : (loc_t) -> void
overload print with print_location
overload prerr with prerr_location
//
fun
fprint_location : fprint_type (loc_t)
overload fprint with fprint_location
//
fun
fprint_locrange : fprint_type (loc_t)
//
(* ****** ****** *)
//
fun
location_make_pos_pos
  (pos1: &position, pos2: &position): loc_t
fun
location_make_fil_pos_pos
  (fil: fil_t, pos1: &position, pos2: &position): loc_t
//
(* ****** ****** *)

datatype
keyword =
//
  | ATStmpdec of ()
//
  | ATSif of ()
  | ATSthen of ()
  | ATSelse of ()
//
  | ATSgoto of ()
//
  | ATSreturn of ()
  | ATSreturn_void of ()
//
  | ATStailcalbeg of ()
  | ATStailcalend of ()
//
  | ATSINSmove of ()
//
  | ATSINSmove_boxrec of ()
  | ATSINSmove_boxrec_ofs of ()
//
  | ATSSELboxrec of ()
  | ATSSELfltrec of ()
//
  | ATSINSstore_boxrec_ofs of ()
  | ATSINSstore_fltrec_ofs of ()
//
  | ATSINSmove_tlcal of ()
  | ATSINSargmove_tlcal of ()
//
  | ATSPMVi0nt of ()
  | ATSPMVf0loat of ()
//
  | ATSinline of () // inline
  | ATSglobaldec of () // extern
  | ATSstaticdec of () // static
//
  | ATSdyncst_mac of ()
  | ATSdyncst_extfun of ()
//
  | KWnone of ()
//
// end of [keyword]

(* ****** ****** *)
//
fun
fprint_keyword
  (out: FILEref, x: keyword): void
//
overload fprint with fprint_keyword
//
(* ****** ****** *)

fun keyword_search (name: string): keyword

(* ****** ****** *)

datatype
token_node =
//
| T_KWORD of keyword
//
| T_IDENT_alp of string
| T_IDENT_sym of string
| T_IDENT_srp of string
//
| T_CHAR of (string)
//
| T_FLOAT of (string)
| T_INTEGER of (int(*base*), string)
//
| T_STRING of (string)
//
| T_LPAREN of () // (
| T_RPAREN of () // )
| T_LBRACKET of () // [
| T_RBRACKET of () // ]
| T_LBRACE of () // {
| T_RBRACE of () // }
//
| T_COMMA of () // ,
| T_COLON of () // :
| T_SEMICOLON of () // ;
//
| T_SLASH of () // /
//
| T_COMMENT_line of () // line comment
| T_COMMENT_block of () // block comment
//
| T_EOF of () // end-of-file
//
// end of [token_node]

(* ****** ****** *)

typedef tnode = token_node

(* ****** ****** *)

typedef token = '{
  token_loc= loc_t, token_node= tnode
} (* end of [token] *)

(* ****** ****** *)

fun fprint_tnode : fprint_type (tnode)

(* ****** ****** *)
//
fun
print_token : (token) -> void
fun
prerr_token : (token) -> void
overload print with print_token
overload prerr with prerr_token
//
fun fprint_token : fprint_type (token)
overload fprint with fprint_token
//
(* ****** ****** *)
//
fun
token_make (loc: loc_t, node: tnode): token
//
(* ****** ****** *)
//
datatype
lexerr_node =
  | LEXERR_UNSUPPORTED_char of (char)
//
typedef lexerr = '{
  lexerr_loc= loc_t, lexerr_node= lexerr_node
} (* end of [lexerr] *)
//
typedef lexerrlst = List0 (lexerr)
//
(* ****** ****** *)

fun fprint_lexerr : fprint_type (lexerr)
fun fprint_lexerrlst : fprint_type (lexerrlst)

(* ****** ****** *)
//
fun
lexerr_make
  (loc: loc_t, node: lexerr_node): lexerr
//
(* ****** ****** *)
//
fun the_lexerrlst_clear (): void
//
fun the_lexerrlst_insert (err: lexerr): void
//
fun the_lexerrlst_pop_all ((*void*)): List0_vt(lexerr)
//
fun the_lexerrlst_print_free ((*void*)): int(*nerr*)
//
(* ****** ****** *)
//
vtypedef
_lexbuf_vt0ype =
@{
//
lexbuf_ntot= int
,
lexbuf_nrow= int
,
lexbuf_ncol= int
,
//
lexbuf_nspace= int
//
,
//
lexbuf_cstream= cstream
//
,
lexbuf_nback= int
,
lexbuf_stringbuf= stringbuf
//
} // end of [_lexbuf_vt0ype]

(* ****** ****** *)
//
absvt@ype
lexbuf_vt0ype = _lexbuf_vt0ype
//
vtypedef lexbuf = lexbuf_vt0ype
//
(* ****** ****** *)
//
fun
lexbuf_initize_fileref
  (buf: &lexbuf? >> _, inp: FILEref): void
//
(* ****** ****** *)

fun lexbuf_uninitize (buf: &lexbuf >> _?): void

(* ****** ****** *)
//
fun
lexbuf_set_position
  (buf: &lexbuf >> _, pos: &position): void
fun
lexbuf_get_position
  (buf: &lexbuf, pos: &position? >> _): void
//
(* ****** ****** *)

fun lexbuf_set_nback (buf: &lexbuf, nb: int): void
fun lexbuf_incby_nback (buf: &lexbuf, nb: int): void

(* ****** ****** *)

fun lexbuf_get_nspace (buf: &lexbuf): int
fun lexbuf_set_nspace (buf: &lexbuf, n: int): void

(* ****** ****** *)

fun lexbuf_remove
  (buf: &lexbuf >> _, nchr: intGte(0)): void

fun lexbuf_remove_all (buf: &lexbuf >> _): void

(* ****** ****** *)

fun lexbuf_takeout (buf: &lexbuf >> _, nchr: intGte(0)): Strptr1

(* ****** ****** *)

fun lexbuf_get_char (buf: &lexbuf >> _): int

(* ****** ****** *)

fun lexbuf_get_token (buf: &lexbuf >> _): token
fun lexbuf_get_token_ncmnt (buf: &lexbuf >> _): token

(* ****** ****** *)
//
fun lexbufpos_get_location (buf: &lexbuf, pos: &position) : loc_t
fun lexbuf_getincby_location (buf: &lexbuf, nchr: intGte(0)): loc_t
//
(* ****** ****** *)

vtypedef
_tokbuf_vt0ype =
@{
//
  tokbuf_tkbf = dynarray (token)
, tokbuf_ntok= size_t, tokbuf_lxbf= lexbuf
//
} (* end of [_tokbuf_vt0ype] *)

(* ****** ****** *)
//
absvt@ype
tokbuf_vt0ype = _tokbuf_vt0ype
//
vtypedef tokbuf = tokbuf_vt0ype
//
(* ****** ****** *)
//
fun
tokbuf_initize_fileref
  (buf: &tokbuf? >> _, inp: FILEref): void
//
(* ****** ****** *)

fun tokbuf_uninitize (buf: &tokbuf >> _?): void

(* ****** ****** *)

fun
tokbuf_get_ntok (buf: &tokbuf >> _): size_t
fun
tokbuf_set_ntok (buf: &tokbuf >> _, ntok: size_t): void

(* ****** ****** *)

fun
tokbuf_incby1 (buf: &tokbuf >> _): void
fun
tokbuf_incby_count (buf: &tokbuf >> _, n: size_t): void

(* ****** ****** *)

fun
tokbuf_get_token (buf: &tokbuf >> _): token
fun
tokbuf_getinc_token (buf: &tokbuf >> _): token

(* ****** ****** *)
  
abstype symbol_type = ptr
typedef symbol = symbol_type
  
(* ****** ****** *)

fun symbol_make (name: string): symbol

(* ****** ****** *)

fun symbol_get_name (x: symbol):<> string

(* ****** ****** *)
//
fun print_symbol : (symbol) -> void
fun prerr_symbol : (symbol) -> void
fun fprint_symbol : fprint_type (symbol)
//
overload print with print_symbol
overload prerr with prerr_symbol
overload fprint with fprint_symbol
//
(* ****** ****** *)
//
abstype synent_type = ptr
typedef synent = synent_type
//
(* ****** ****** *)

typedef
i0de = '{
  i0de_loc= loc_t, i0de_sym= symbol
} (* end of [i0de] *)

(* ****** ****** *)
//
fun
i0de_make_sym (loc: loc_t, sym: symbol): i0de
//
(* ****** ****** *)

datatype
s0exp_node =
  | S0Eide of symbol
  | S0Eapp of (symbol, s0explst)
// end of [s0exp_node]

where
s0exp = '{
  s0exp_loc= loc_t, s0exp_node= s0exp_node
} (* end of [s0exp] *)

and
s0explst = List0 (s0exp)

(* ****** ****** *)

typedef
parser (a:type) =
  (&tokbuf, int(*bt*), &int(*err*)) -> a
// end of [parser]

typedef
parser_tok (a:type) =
  (&tokbuf, int(*bt*), &int(*err*), token) -> a
// end of [parser_tok]

(* ****** ****** *)

datatype
parerr_node =
  | PARERR_LPAREN of ()
  | PARERR_RPAREN of ()
//
typedef parerr = '{
  parerr_loc= loc_t, parerr_node= parerr_node
} (* end of [parerr] *)
//
typedef parerrlst = List0 (parerr)

(* ****** ****** *)

fun fprint_parerr : fprint_type (parerr)
fun fprint_parerrlst : fprint_type (parerrlst)

(* ****** ****** *)
//
fun
parerr_make
  (loc: loc_t, node: parerr_node): parerr
//
(* ****** ****** *)
//
fun the_parerrlst_clear (): void
//
fun the_parerrlst_insert (err: parerr): void
//
fun the_parerrlst_pop_all ((*void*)): List0_vt(parerr)
//
fun the_parerrlst_print_free ((*void*)): int(*nerr*)
//
(* ****** ****** *)

(* end of [atsparemit.sats] *)
