(* ****** ****** *)
//
// ATS-parse-emit-cil
//
(* ****** ****** *)
//
// AS-2014-08-23: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"
staload "./atsparemit_syntax_cil.sats"

(* ****** ****** *)

(*
ATSif (d0exp, instrlst, instrlstopt)
- represents split in control flow based on the value of d0exp
- if instrlstopt is none: need label for first instruction AFTER ATSif()
- if instrlstopt is some: need label for first instruction in instrlstopt and for first instruction AFTER ATSif()
ATSifthen (d0exp, instrlst)
- represents conditional evaluation if d0exp evaluates to true
- need label for first instruction AFTER ATSifthen
ATSifnthen (d0exp, instrlst)
- represents conditional evaluation if d0exp evaluates to false
- need label for first instruction AFTER ATSifnthen
ATSbranchseq/ATScaseofseq
ATSfunbodyseq
ATSreturn(i0de)
ATSreturn_void(i0de)
ATSINSlab (label)
- gives a label to the instruction that immediately follows it
ATSINSgoto (label)

the issue is that not every instruction is even given a name
- we would like to enrich all instructions with a unique pointer to them (which is what a label is!)
- some instructions are labelled, therefore we'd like to resolve their pointers to their labels

also, when we are traversing instructions, we have to somehow
assign labels to instructions that we haven't visited yet!
*)

(* ****** ****** *)
//
implement
{}(*tmp*)
string_skip
  (str, ofs) = let
//
val p0 = string2ptr(str)
//
in
  $UNSAFE.cast{string}(ptr_add<char>(p0, ofs))
end (* end of [string_skip] *)
//
(* ****** ****** *)
//
implement
strip_suffix
  {n1,n2}
  (str, suf) = let
  val l1 = strlen(str)
  val l2 = strlen(suf)
  prval () = lemma_string_param (str)
  prval () = lemma_string_param (suf)    
in
//
if
l1 >= l2
then let
  val ofs = l1 - l2
  val str1 = string_skip (str, ofs)
in
  if str1 != suf
    then g0ofg1(str)
    else let
      val subs = string_make_substring (str, i2sz(0), ofs)
    in
      strnptr2string (subs)
    end // end of [else]
  // end of [if]
end // end of [then]
else g0ofg1(str) // end of [else]
//
end // end of [strip_suffix]
//
(* ****** ****** *)
//
implement
strip_prefix
  {n1,n2}
  (str, pre) = let
  val l1 = strlen (str)
  val l2 = strlen (pre)
  prval () = lemma_string_param (str)
  prval () = lemma_string_param (pre)
in
  if l1 >= l2 (*&& $STRING.strncmp (s, pre, l2) = 0*) then let
    val ofs = l1 - l2
  in
    string_skip (str, ofs)
  end else g0ofg1(str)
end // end of [strip_prefix]
//
(* ****** ****** *)

local

#include
"share/atspre_define.hats"

#include
"{$LIBATSHWXI}/globals/HATS/gcount.hats"

in // of [local]

implement
label_reset () = reset ()

implement
make_label
  (loc: loc_t) : label = let
  // FIXME: this is very involved...
  val labname = string0_copy ("__labIL")
  val i = getinc ()
  val istr = g0int2string (i)
  val labnamei = strptr_append (labname, istr)
  val-true = ptr_isnot_null (strptr2ptr(labnamei))
  val str = strptr2string (labnamei)
  val () = free labname and () = free istr
in
  i0de_make_string (loc, str)
end // end of [make_label]

// special label that will never be emitted
val label_nil = i0de_make_string (location_dummy, "NILLABEL")

end // end of [local]

(* ****** ****** *)

implement
label_for_instrlst
  (inss) =
  case+ inss of
  | list_nil () => label_nil
  | list_cons (ins, inss) =>
    (
      case+ ins.instr_node of
      | ATSINSflab lab => lab
      | ATSINSlab lab => lab
      | ATSlinepragma (_, _) => label_for_instrlst (inss)
      | _ => make_label (ins.instr_loc)
    ) (* end of [list_vt_cons] *)
// end of [label_for_instrlst]

(* ****** ****** *)

staload F0HEADDEF =
{
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef key = symbol and itm = f0head
//
implement
gequal_val<key> (k1, k2) = (k1 = k2)
//
staload
"libats/SATS/hashtbl_chain.sats"
//
implement
hash_key<key> (sym) =
//
// HX: [gidentity] is called to avoid a bug
//
  gidentity(hash_key<string>(symbol_get_name(sym)))
//
implement hashtbl$recapacitize<> () = 1(*resizable*)
//
#define CAPACITY 1024
//
#include "{$LIBATSHWXI}/globals/HATS/ghashtbl_chain.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
f0head_insert
  (name, def) = let
(*
//
val () =
  println! ("f0head_insert: ", symbol_get_name(name))
//
*)
in
//
$F0HEADDEF.insert_any (name, def)
//
end // end of [f0head_insert]

(* ****** ****** *)
//
implement
f0head_search_opt
  (name) = $F0HEADDEF.search_opt (name)
//
(* ****** ****** *)

staload STATMPS0EXP =
{
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef key = symbol and itm = s0exp
//
implement
gequal_val<key> (k1, k2) = (k1 = k2)
//
staload
"libats/SATS/hashtbl_chain.sats"
//
implement
hash_key<key> (sym) =
//
// HX: [gidentity] is called to avoid a bug
//
  gidentity(hash_key<string>(symbol_get_name(sym)))
//
implement hashtbl$recapacitize<> () = 1(*resizable*)
//
#define CAPACITY 1024
//
#include "{$LIBATSHWXI}/globals/HATS/ghashtbl_chain.hats"
//
} (* end of [staload] *)

(* ****** ****** *)
//
implement
statmps0exp_insert
  (name, def) = let
(*
//
val () =
  println! ("statmps0exp_insert: ", symbol_get_name(name))
//
*)
in
//
$STATMPS0EXP.insert_any (name, def)
//
end // end of [statmps0exp_insert]
//
implement
statmps0exp_search_opt
  (name) = $STATMPS0EXP.search_opt (name)
//
(* ****** ****** *)

staload F0DECL_CLO =
{
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef key = symbol and itm = '(s0exp(*env*), s0exp(*arg*), s0exp(*res*))
//
implement
gequal_val<key> (k1, k2) = (k1 = k2)
//
staload
"libats/SATS/hashtbl_chain.sats"
//
implement
hash_key<key> (sym) =
//
// HX: [gidentity] is called to avoid a bug
//
  gidentity(hash_key<string>(symbol_get_name(sym)))
//
implement hashtbl$recapacitize<> () = 1(*resizable*)
//
#define CAPACITY 1024
//
#include "{$LIBATSHWXI}/globals/HATS/ghashtbl_chain.hats"
//
} (* end of [staload] *)

(* ****** ****** *)
//
implement
f0decl_clo_insert
  (name, env) = let
(*
//
val () =
  println! ("f0decl_is_clo_insert: ", symbol_get_name(name))
//
*)
in
//
$F0DECL_CLO.insert_any (name, env)
//
end // end of [_insert]
//
implement
f0decl_clo_get
  (name) =
  case+
  $F0DECL_CLO.search_opt (name) of
  | ~None_vt () => false
  | ~Some_vt _ => true
//
implement
f0decl_clo_get_sig
  (name) = $F0DECL_CLO.search_opt (name)
//
(* ****** ****** *)

(* end of [atsparemit_syntax_cil.dats] *)
