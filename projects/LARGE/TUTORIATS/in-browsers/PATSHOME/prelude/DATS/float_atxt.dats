(*
float.atxt: 1(line=1, offs=1) -- 253(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"float.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
float.atxt: 258(line=10, offs=2) -- 274(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
float.atxt: 276(line=11, offs=2) -- 299(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
float.atxt: 302(line=13, offs=2) -- 321(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
float.atxt: 406(line=18, offs=25) -- 417(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
float.atxt: 423(line=21, offs=2) -- 442(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
float.atxt: 445(line=23, offs=2) -- 473(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
float.atxt: 475(line=24, offs=2) -- 523(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
float.atxt: 525(line=25, offs=2) -- 561(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
float.atxt: 564(line=27, offs=2) -- 583(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
float.atxt: 643(line=31, offs=2) -- 662(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
float.atxt: 663(line=32, offs=1) -- 767(line=37, offs=3)
*)

//
staload _(*anon*) = "prelude/DATS/list.dats"
staload _(*anon*) = "prelude/DATS/list_vt.dats"
//

(*
float.atxt: 773(line=39, offs=2) -- 792(line=39, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
float.atxt: 840(line=43, offs=2) -- 859(line=43, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
float.atxt: 861(line=45, offs=1) -- 2183(line=93, offs=3)
*)

//
fun g0float_implist (
  kname: string, tname: string
) : atext = let
//
fun f (opr: string):<cloref1> atext = let
//
val x = sprintf (
"implement g0float_%s<%s> = g0float_%s_%s\n", @(opr, kname, opr, tname)
) (* end of [val] *)
//
in
  atext_strptr (x)
end // end of [f]
//
var res: atextlst = list_nil
//
val () = res := list_cons (f "neg", res)
val () = res := list_cons (f "abs", res)
val () = res := list_cons (f "succ", res)
val () = res := list_cons (f "pred", res)
val () = res := list_cons (atext_newline(), res)
//
val () = res := list_cons (f "add", res)
val () = res := list_cons (f "sub", res)
val () = res := list_cons (f "mul", res)
val () = res := list_cons (f "div", res)
val () = res := list_cons (f "mod", res)
val () = res := list_cons (atext_newline(), res)
//
val () = res := list_cons (f "lt", res)
val () = res := list_cons (f "lte", res)
val () = res := list_cons (f "gt", res)
val () = res := list_cons (f "gte", res)
val () = res := list_cons (f "eq", res)
val () = res := list_cons (f "neq", res)
val () = res := list_cons (f "compare", res)
val () = res := list_cons (atext_newline(), res)
//
val () = res := list_cons (f "max", res)
val () = res := list_cons (f "min", res)
//
val res = list_reverse (res)
//
in
  atext_concatxt (list_of_list_vt (res))
end // end of [g0float_implist]

(*
float.atxt: 2185(line=94, offs=2) -- 2204(line=94, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
float.atxt: 2395(line=103, offs=2) -- 2414(line=103, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
float.atxt: 2739(line=116, offs=2) -- 2758(line=116, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
float.atxt: 3034(line=127, offs=2) -- 3053(line=127, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
float.atxt: 3114(line=131, offs=2) -- 3133(line=131, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
float.atxt: 3136(line=133, offs=2) -- 3170(line=133, offs=36)
*)
val __tok18 = g0float_implist("fltknd", "float")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
float.atxt: 3174(line=135, offs=2) -- 3193(line=135, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
float.atxt: 3196(line=137, offs=2) -- 3231(line=137, offs=37)
*)
val __tok20 = g0float_implist("dblknd", "double")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
float.atxt: 3235(line=139, offs=2) -- 3254(line=139, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
float.atxt: 3257(line=141, offs=2) -- 3294(line=141, offs=39)
*)
val __tok22 = g0float_implist("ldblknd", "ldouble")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
float.atxt: 3298(line=143, offs=2) -- 3317(line=143, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
float.atxt: 3460(line=149, offs=2) -- 3479(line=149, offs=21)
*)
val __tok24 = atscode_separator()
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
float.atxt: 4005(line=187, offs=2) -- 4024(line=187, offs=21)
*)
val __tok25 = atscode_separator()
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
float.atxt: 4027(line=189, offs=2) -- 4064(line=189, offs=39)
*)
val __tok26 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
float.atxt: 4067(line=191, offs=1) -- 4149(line=195, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "float_atxt.txt")

