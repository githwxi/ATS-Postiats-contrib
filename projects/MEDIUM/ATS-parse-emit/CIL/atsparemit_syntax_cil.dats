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

end // end of [local]

(* ****** ****** *)

implement
label_for_instrlst
  (inss) =
  case+ inss of
  | list_nil () =>
    (* create a special label that will never be emitted *)
    i0de_make_string (location_dummy, "NILLABEL")
  | list_cons (ins, inss) =>
    (
      case+ ins.instr_node of
      | ATSINSflab lab => lab
      | ATSINSlab lab => lab
      | ATSlinepragma (_, _) => label_for_instrlst (inss)
      | _ => make_label (ins.instr_loc)
    ) (* end of [list_vt_cons] *)
// end of [label_for_instrlst]

