(*
strptr.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"strptr.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
strptr.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
strptr.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
strptr.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
strptr.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
strptr.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
strptr.atxt: 447(line=23, offs=2) -- 475(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
strptr.atxt: 477(line=24, offs=2) -- 525(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
strptr.atxt: 527(line=25, offs=2) -- 560(line=25, offs=35)
*)
val __tok8 = atscode_start_time("April, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
strptr.atxt: 563(line=27, offs=2) -- 582(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
strptr.atxt: 642(line=31, offs=2) -- 661(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
strptr.atxt: 705(line=35, offs=2) -- 724(line=35, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
strptr.atxt: 776(line=39, offs=2) -- 795(line=39, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
strptr.atxt: 848(line=44, offs=2) -- 867(line=44, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
strptr.atxt: 899(line=48, offs=2) -- 918(line=48, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
strptr.atxt: 1063(line=57, offs=2) -- 1082(line=57, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
strptr.atxt: 1367(line=70, offs=2) -- 1386(line=70, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
strptr.atxt: 1777(line=89, offs=2) -- 1796(line=89, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
strptr.atxt: 2206(line=108, offs=2) -- 2225(line=108, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
strptr.atxt: 2228(line=110, offs=1) -- 2688(line=138, offs=3)
*)

fun
fun_strptr_cmp_decl
  (opr: string): atext = let
//
val fopr_d = (
  case+ opr of
  | "lt" => "<" | "lte" => "<="
  | "gt" => ">" | "gte" => ">="
  | "eq" => "=" | "neq" => "!="
  | _(*rest*) => opr
) : string // end of [val]
//
val ent =
sprintf ("\
implement
%s_strptr_strptr
  (x1, x2) =
(
  compare_strptr_strptr(x1, x2) %s 0
)\
", @(
 opr, fopr_d
)
) // end of [sprintf] // end of [val]
in
  atext_strptr (ent)
end // end of [fun_char_cmp0_decl]

(*
strptr.atxt: 2696(line=141, offs=2) -- 2721(line=141, offs=27)
*)
val __tok19 = fun_strptr_cmp_decl("lt")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
strptr.atxt: 2723(line=142, offs=2) -- 2749(line=142, offs=28)
*)
val __tok20 = fun_strptr_cmp_decl("lte")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
strptr.atxt: 2751(line=143, offs=2) -- 2776(line=143, offs=27)
*)
val __tok21 = fun_strptr_cmp_decl("gt")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
strptr.atxt: 2778(line=144, offs=2) -- 2804(line=144, offs=28)
*)
val __tok22 = fun_strptr_cmp_decl("gte")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
strptr.atxt: 2806(line=145, offs=2) -- 2831(line=145, offs=27)
*)
val __tok23 = fun_strptr_cmp_decl("eq")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
strptr.atxt: 2833(line=146, offs=2) -- 2859(line=146, offs=28)
*)
val __tok24 = fun_strptr_cmp_decl("neq")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
strptr.atxt: 2864(line=148, offs=2) -- 2883(line=148, offs=21)
*)
val __tok25 = atscode_separator()
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
strptr.atxt: 3053(line=160, offs=2) -- 3072(line=160, offs=21)
*)
val __tok26 = atscode_separator()
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
strptr.atxt: 3223(line=169, offs=2) -- 3242(line=169, offs=21)
*)
val __tok27 = atscode_separator()
val () = theAtextMap_insert_str ("__tok27", __tok27)

(*
strptr.atxt: 3692(line=196, offs=2) -- 3711(line=196, offs=21)
*)
val __tok28 = atscode_separator()
val () = theAtextMap_insert_str ("__tok28", __tok28)

(*
strptr.atxt: 3983(line=213, offs=2) -- 4002(line=213, offs=21)
*)
val __tok29 = atscode_separator()
val () = theAtextMap_insert_str ("__tok29", __tok29)

(*
strptr.atxt: 4244(line=226, offs=2) -- 4263(line=226, offs=21)
*)
val __tok30 = atscode_separator()
val () = theAtextMap_insert_str ("__tok30", __tok30)

(*
strptr.atxt: 4701(line=265, offs=2) -- 4720(line=265, offs=21)
*)
val __tok31 = atscode_separator()
val () = theAtextMap_insert_str ("__tok31", __tok31)

(*
strptr.atxt: 5009(line=286, offs=2) -- 5028(line=286, offs=21)
*)
val __tok32 = atscode_separator()
val () = theAtextMap_insert_str ("__tok32", __tok32)

(*
strptr.atxt: 6307(line=351, offs=2) -- 6326(line=351, offs=21)
*)
val __tok33 = atscode_separator()
val () = theAtextMap_insert_str ("__tok33", __tok33)

(*
strptr.atxt: 6390(line=357, offs=2) -- 6409(line=357, offs=21)
*)
val __tok34 = atscode_separator()
val () = theAtextMap_insert_str ("__tok34", __tok34)

(*
strptr.atxt: 6554(line=365, offs=2) -- 6573(line=365, offs=21)
*)
val __tok35 = atscode_separator()
val () = theAtextMap_insert_str ("__tok35", __tok35)

(*
strptr.atxt: 7359(line=414, offs=2) -- 7378(line=414, offs=21)
*)
val __tok36 = atscode_separator()
val () = theAtextMap_insert_str ("__tok36", __tok36)

(*
strptr.atxt: 7443(line=420, offs=2) -- 7462(line=420, offs=21)
*)
val __tok37 = atscode_separator()
val () = theAtextMap_insert_str ("__tok37", __tok37)

(*
strptr.atxt: 7618(line=433, offs=2) -- 7637(line=433, offs=21)
*)
val __tok38 = atscode_separator()
val () = theAtextMap_insert_str ("__tok38", __tok38)

(*
strptr.atxt: 8446(line=479, offs=2) -- 8465(line=479, offs=21)
*)
val __tok39 = atscode_separator()
val () = theAtextMap_insert_str ("__tok39", __tok39)

(*
strptr.atxt: 8468(line=481, offs=2) -- 8505(line=481, offs=39)
*)
val __tok40 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok40", __tok40)

(*
strptr.atxt: 8508(line=483, offs=1) -- 8591(line=487, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "strptr_atxt.txt")

