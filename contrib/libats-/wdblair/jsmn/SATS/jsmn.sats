%{#
#include "contrib/libats-/wdblair/jsmn/CATS/jsmn.cats"
%}

(* ****** ****** *)

#define
ATS_PACKNAME "ATSCNTRB.jsmn"
#define
ATS_EXTERN_PREFIX "atscntrb_jsmn" // prefix for external names

(* ****** ****** *)

typedef jsmntype_t = int

macdef JSMN_PRIMITIVE = $extval(jsmntype_t, "JSMN_PRIMITIVE")
macdef JSMN_OBJECT = $extval(jsmntype_t, "JSMN_OBJECT")
macdef JSMN_ARRAY = $extval(jsmntype_t, "JSMN_ARRAY")
macdef JSMN_STRING = $extval(jsmntype_t, "JSMN_STRING")

typedef jsmnerr_t = int

macdef JSMN_PRIMITIVE = $extval(jsmntype_t, "JSMN_PRIMITIVE")
(** Not enough tokens were provided *)
macdef JSMN_ERROR_NOMEM = $extval(jsmnerr_t, "JSMN_ERROR_NOMEM")
(** Invalid character inside JSON string *)
macdef JSMN_ERROR_INVAL = $extval(jsmnerr_t, "JSMN_ERROR_INVAL")
(** The string is not a full JSON packet, more bytes expected *)
macdef JSMN_ERROR_PART = $extval(jsmnerr_t, "JSMN_ERROR_PART")

abst@ype jsmn_parser = $extype "jsmn_parser"
abst@ype jsmntok_t = $extype "jsmntok_t"

abst@ype jsmntokptr = $extype "jsmntok_t*"

fun jsmn_init (&jsmn_parser? >> _): void = "mac#%"

fun jsmn_parse {m,n:int} (
    &jsmn_parser, string(m), size_t(m),
    arrayptr(jsmntok_t, n), uint(n)
): jsmnerr_t = "mac#%"

(* ****** ****** *)

fun jsmntok_type (jsmntokptr): jsmntype_t = "mac#%"

overload .type with jsmntok_type

fun jsmntok_size (jsmntokptr): int = "mac#%"

overload .size with jsmntok_size

fun jsmntok_start (jsmntokptr): int = "mac#%"

overload .start with jsmntok_start

fun jsmntok_end (jsmntokptr): int = "mac#%"

(**
  The end keyword is reserved.
*)
overload .ending with jsmntok_end

(* ****** ****** *)

(**

datatype
jsonval =
  | JSONnul of ()
//
  | JSONint of (json_int)
  | JSONbool of (json_bool)
  | JSONfloat of (double)
  | JSONstring of (string)
//
  | JSONarray of (jsonvalist) // array
  | JSONobject of (labjsonvalist) // hashtable
`
*)

// end of [jsonval]

(* ****** ****** *)
