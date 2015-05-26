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
    Parse a jsonval
*)
fun jsonval_parse_from_stdin: () -> (string, jsonval)

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

fun{} bool_of_jsonval (jsonval): bool

(**
  Accessors 
*)

(**
    Get a pointer to a string. This string is technically
    null terminated, but in order to capture just the portion
    of the string that represents the jsonval you need to
    get the string's size.
    
    In short, be careful and use the strn* functions when you
    work with this function's return value.
*)
fun{} jsonval_get_string (jsonval): string

overload .string with jsonval_get_string

(**
    Get a null terminated string that represents the jsonval.
   
   This allocates a new string.
*)
fun{} jsonval_get_copy_string (jsonval): string

overload .copy_string with jsonval_get_copy_string

(**
    Get a null terminated string by modifying the original json
    string.
*)
fun{} jsonval_get_string_unsafe (jsonval): string

overload .string_unsafe with jsonval_get_string_unsafe

fun jsonval_size (jsonval): int

overload .size with jsonval_size

(**
  Array Operations
*)

fun{} jsonval_array_get_at_exn (
  jsonval, int
): jsonval

overload [] with jsonval_array_get_at_exn

fun{a:vt@ype}
jsonval_parse (
  jsonval
): a

fun {a:vt@ype}
jsonval_array_map (
  jsonval
): List0_vt (a)

(**
  Object Operations
*)

fun{} jsonval_object_get_key_exn (
  jsonval, string
): jsonval

overload [] with jsonval_object_get_key_exn

fun{} jsonval_object_has_key (
  jsonval, string
): bool

overload .has_key with jsonval_object_has_key