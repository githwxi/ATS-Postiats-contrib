(*
grandom.atxt: 1(line=1, offs=1) -- 255(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"grandom.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
grandom.atxt: 260(line=10, offs=2) -- 276(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
grandom.atxt: 278(line=11, offs=2) -- 301(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
grandom.atxt: 304(line=13, offs=2) -- 323(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
grandom.atxt: 410(line=18, offs=25) -- 421(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
grandom.atxt: 427(line=21, offs=2) -- 446(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
grandom.atxt: 449(line=23, offs=2) -- 477(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
grandom.atxt: 479(line=24, offs=2) -- 521(line=24, offs=44)
*)
val __tok7 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
grandom.atxt: 523(line=25, offs=2) -- 555(line=25, offs=34)
*)
val __tok8 = atscode_start_time("June, 2015")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
grandom.atxt: 558(line=27, offs=2) -- 577(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
grandom.atxt: 643(line=32, offs=2) -- 662(line=32, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
grandom.atxt: 701(line=36, offs=2) -- 720(line=36, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
grandom.atxt: 794(line=41, offs=2) -- 813(line=41, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
grandom.atxt: 917(line=48, offs=2) -- 936(line=48, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
grandom.atxt: 991(line=53, offs=2) -- 1010(line=53, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
grandom.atxt: 1069(line=58, offs=2) -- 1088(line=58, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
grandom.atxt: 1155(line=64, offs=2) -- 1174(line=64, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
grandom.atxt: 1746(line=104, offs=2) -- 1765(line=104, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
grandom.atxt: 2369(line=136, offs=2) -- 2388(line=136, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
grandom.atxt: 2391(line=138, offs=2) -- 2428(line=138, offs=39)
*)
val __tok19 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
grandom.atxt: 2431(line=140, offs=1) -- 2515(line=144, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "grandom_atxt.txt")

