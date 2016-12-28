(*
gprint.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gprint.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gprint.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gprint.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gprint.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gprint.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gprint.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gprint.atxt: 447(line=23, offs=2) -- 475(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gprint.atxt: 477(line=24, offs=2) -- 525(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gprint.atxt: 527(line=25, offs=2) -- 561(line=25, offs=36)
*)
val __tok8 = atscode_start_time("August, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gprint.atxt: 564(line=27, offs=2) -- 583(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gprint.atxt: 633(line=33, offs=2) -- 652(line=33, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gprint.atxt: 723(line=39, offs=2) -- 742(line=39, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gprint.atxt: 870(line=47, offs=2) -- 889(line=47, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
gprint.atxt: 1015(line=55, offs=2) -- 1034(line=55, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
gprint.atxt: 1160(line=63, offs=2) -- 1179(line=63, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
gprint.atxt: 1913(line=96, offs=2) -- 1932(line=96, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
gprint.atxt: 2094(line=105, offs=2) -- 2113(line=105, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
gprint.atxt: 2615(line=137, offs=2) -- 2634(line=137, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
gprint.atxt: 2983(line=153, offs=2) -- 3002(line=153, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
gprint.atxt: 3590(line=181, offs=2) -- 3609(line=181, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
gprint.atxt: 3774(line=190, offs=2) -- 3793(line=190, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
gprint.atxt: 4217(line=217, offs=2) -- 4236(line=217, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
gprint.atxt: 4453(line=230, offs=2) -- 4472(line=230, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
gprint.atxt: 4657(line=244, offs=2) -- 4676(line=244, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
gprint.atxt: 4871(line=259, offs=2) -- 4890(line=259, offs=21)
*)
val __tok24 = atscode_separator()
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
gprint.atxt: 4893(line=261, offs=2) -- 4930(line=261, offs=39)
*)
val __tok25 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
gprint.atxt: 4933(line=263, offs=1) -- 5016(line=267, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gprint_atxt.txt")

