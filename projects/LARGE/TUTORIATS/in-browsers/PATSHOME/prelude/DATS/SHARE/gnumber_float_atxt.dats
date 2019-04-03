(*
gnumber_float.atxt: 1(line=1, offs=1) -- 261(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gnumber_float.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gnumber_float.atxt: 266(line=10, offs=2) -- 282(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gnumber_float.atxt: 284(line=11, offs=2) -- 307(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gnumber_float.atxt: 310(line=13, offs=2) -- 329(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gnumber_float.atxt: 416(line=18, offs=25) -- 427(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gnumber_float.atxt: 433(line=21, offs=2) -- 452(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gnumber_float.atxt: 455(line=23, offs=2) -- 483(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gnumber_float.atxt: 485(line=24, offs=2) -- 533(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gnumber_float.atxt: 535(line=25, offs=2) -- 568(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gnumber_float.atxt: 571(line=27, offs=2) -- 590(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gnumber_float.atxt: 789(line=38, offs=2) -- 808(line=38, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gnumber_float.atxt: 1030(line=48, offs=2) -- 1049(line=48, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gnumber_float.atxt: 1161(line=57, offs=2) -- 1180(line=57, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
gnumber_float.atxt: 1313(line=66, offs=2) -- 1332(line=66, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
gnumber_float.atxt: 1465(line=75, offs=2) -- 1484(line=75, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
gnumber_float.atxt: 1619(line=84, offs=2) -- 1638(line=84, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
gnumber_float.atxt: 1780(line=93, offs=2) -- 1799(line=93, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
gnumber_float.atxt: 1941(line=102, offs=2) -- 1960(line=102, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
gnumber_float.atxt: 2102(line=111, offs=2) -- 2121(line=111, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
gnumber_float.atxt: 2263(line=120, offs=2) -- 2282(line=120, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
gnumber_float.atxt: 2430(line=129, offs=2) -- 2449(line=129, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
gnumber_float.atxt: 2582(line=140, offs=2) -- 2601(line=140, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
gnumber_float.atxt: 2604(line=142, offs=2) -- 2641(line=142, offs=39)
*)
val __tok22 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
gnumber_float.atxt: 2644(line=144, offs=1) -- 2734(line=148, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gnumber_float_atxt.txt")

