(*
** Parsing constraints in JSON format
*)

#include
"patsolve.hats"

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "constraint/constraint.sats"

(* ****** ****** *)

staload "parsing/parsing.sats"

staload _ = "parsing/parsing_c3nstr.dats"
staload _ = "parsing/parsing_h3ypo.dats"
staload _ = "parsing/parsing_s2cst.dats"
staload _ = "parsing/parsing_s2exp.dats"
staload _ = "parsing/parsing_s2rt.dats"
staload _ = "parsing/parsing_s2var.dats"
staload _ = "parsing/parsing_s2vvar.dats"
staload _ = "parsing/parsing_s2zexp.dats"
staload _ = "parsing/parsing_s3itm.dats"

(* ****** ****** *)

staload "parsing/jsonval.sats"

staload _ = "parsing/jsonval.dats"
staload _ = "{$LIBATSWDBLAIR}/jsmn/DATS/jsmn.dats"

(* ****** ****** *)

implement{}
parse_int
  (jsv0) = let
in
    int_of_jsonval (jsv0)
end // end of [parse_int]


implement{}
parse_string
  (jsv0) = jsv0.string_unsafe()

(* ****** ****** *)

implement{}
parse_stamp (jsv0) = let
  val i = int_of_jsonval (jsv0)
in
    stamp_make (i)
end // end of [parse_stamp]

(* ****** ****** *)

implement{}
parse_symbol (jsv0) = let
  val name = jsv0.string_unsafe()
in
  symbol_make (name)
end // end of [parse_symbol]

(* ****** ****** *)


implement{}
parse_location (jsv0) = let
  val strloc = jsv0.string_unsafe()
in
  location_make (strloc)
end // end of [parse_location]

(* ****** ****** *)

implement
{a}
parse_list
  (jsv0) = let
    val rs = jsonval_array_map<a> (jsv0)
in
    list_of_list_vt (rs)
end // end of [parse_list]

(* ****** ****** *)

implement
{a}
parse_option
  (jsv0) = let
(*
val () = fprintln!
  (stdout_ref, "parse_option: jsv0 = ", jsv0)
*)
in
    if jsv0.size() = 0 then
        None ()
    else let
        val jsv = jsv0[0]
        val x = jsonval_parse<a> (jsv)
     in
         Some (x)
     end
end // end of [parse_option]

(* ****** ****** *)

implement
parse_c3nstr_from_stdin () = let
  val inp = stdin_ref
  val out = stdout_ref

  val (data, jsv) = jsonval_parse_from_stdin ()
  
  val () = $tempenver (data)
  
  implement
  jsonval_src<> () = data
  
  val s2csts = jsv["s2cstmap"]
  val s2vars = jsv["s2varmap"]
  val c3nstrs = jsv["c3nstrbody"]
    
  val () = parse_s2cstmap (s2csts)
  val () = parse_s2varmap (s2vars)
  
in
  parse_c3nstr (c3nstrs)
end // end of [parse_c3nstr_from_stdin]

(* ****** ****** *)

(* end of [parsing.dats] *)
