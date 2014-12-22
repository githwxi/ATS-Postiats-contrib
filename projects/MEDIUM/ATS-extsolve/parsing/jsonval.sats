(**
  A convenience wrapper around the jsmn library.
*)


abst@ype jsonval = ptr

(**
  Implement this template to define the text data
  that the jsonval refers to.
*)
fun{} jsonval_src: () -> string

(**
  Typechecking functions
*)
fun{} jsonval_is_int (jsonval): bool

fun{} jsonval_is_string (jsonval): bool

fun{} jsonval_is_bool (jsonval): bool

fun{} jsonval_is_double (jsonval): bool

fun{} jsonval_is_array (jsonval): bool

fun{} jsonval_is_object (jsonval): bool

(**
  Casting functions.
*)

fun{} int_of_jsonval (jsonval): int

fun{} string_of_jsonval (jsonval): string

fun{} bool_of_jsonval (jsonval): bool

fun{} double_of_jsonval (jsonval): double

(**
  Accessors
*)
fun{} jsonval_get_string (jsonval): string

overload .string with jsonval_get_string

(**
  Array Operations
*)

fun{} jsonval_array_get_at_exn (
  jsonval, int
): jsonval

overload [] with jsonval_array_get_at_exn

fun{a:vt@ype}
jsonval_array_foreach$fwork (
  jsonval, &a >> _
): void

fun{a:vt@ype}
jsonval_array_foreach (
  jsonval, &a
): void

(**
  Object Operations
*)

fun{} jsonval_object_get_exn (
  jsonval, string
): jsonval

overload [] with jsonval_object_get_exn