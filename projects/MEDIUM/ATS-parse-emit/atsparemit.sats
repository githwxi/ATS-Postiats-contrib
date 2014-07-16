(* ****** ****** *)
//
// ATS-parsemit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
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
fun position_incby1 (pos: &position >> _): void
//
fun
position_decby (pos: &position >> _, n: uint): void
fun
position_incby (pos: &position >> _, n: uint): void
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
token_node =
//
| T_IDENT_alp of string
| T_IDENT_srp of string
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
| T_SEMICOLON of () // ;
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
fun fprint_token : fprint_type (token)

(* ****** ****** *)
//
fun
token_make (loc: loc_t, node: tnode): token
//
(* ****** ****** *)
//
datatype
lexerr_node =
  | LEXERR_STRING_unclosed of ()
  | LEXERR_UNSUPPORTED_char of (char)
//
typedef lexerr = '{
  lexerr_loc= loc_t, lexerr_node= lexerr_node
} (* end of [lexerr] *)
//
(* ****** ****** *)

fun fprint_lexerr : fprint_type (lexerr)

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
fun the_lexerrlst_add (err: lexerr): void
//
(* ****** ****** *)
//
absvt@ype lexbuf_vt0ype
//
vtypedef lexbuf = lexbuf_vt0ype
//
(* ****** ****** *)

fun lexbuf_clear (buf: &lexbuf >> _?): void

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

(* ****** ****** *)

fun lexbuf_get_nspace (buf: &lexbuf): int
fun lexbuf_set_nspace (buf: &lexbuf, n: int): void

(* ****** ****** *)

fun lexbuf_get_char (buf: &lexbuf >> _): int

(* ****** ****** *)

fun lexbuf_remove (buf: &lexbuf >> _, nchr: int): void

(* ****** ****** *)

fun lexbuf_get_token (buf: &lexbuf >> _): token

(* ****** ****** *)

fun lexbufpos_diff (buf: &lexbuf, pos: &position): int
fun lexbufpos_get_location (buf: &lexbuf, pos: &position): loc_t

(* ****** ****** *)

(* end of [atsparemit.sats] *)
