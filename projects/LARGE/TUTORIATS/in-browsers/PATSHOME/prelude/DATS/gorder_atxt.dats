(*
gorder.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gorder.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gorder.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gorder.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gorder.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gorder.atxt: 325(line=15, offs=2) -- 353(line=15, offs=30)
*)
val __tok4 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gorder.atxt: 355(line=16, offs=2) -- 397(line=16, offs=44)
*)
val __tok5 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gorder.atxt: 399(line=17, offs=2) -- 432(line=17, offs=35)
*)
val __tok6 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gorder.atxt: 435(line=19, offs=2) -- 454(line=19, offs=21)
*)
val __tok7 = atscode_separator()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gorder.atxt: 540(line=24, offs=25) -- 551(line=24, offs=36)
*)
val __tok8 = timestamp()
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gorder.atxt: 557(line=27, offs=2) -- 576(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gorder.atxt: 884(line=46, offs=2) -- 903(line=46, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gorder.atxt: 1239(line=65, offs=2) -- 1258(line=65, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gorder.atxt: 1416(line=76, offs=2) -- 1435(line=76, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
gorder.atxt: 1607(line=87, offs=2) -- 1626(line=87, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
gorder.atxt: 1877(line=103, offs=2) -- 1896(line=103, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
gorder.atxt: 2024(line=112, offs=2) -- 2043(line=112, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
gorder.atxt: 2351(line=131, offs=2) -- 2370(line=131, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
gorder.atxt: 2528(line=142, offs=2) -- 2547(line=142, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
gorder.atxt: 2638(line=149, offs=2) -- 2657(line=149, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
gorder.atxt: 2767(line=157, offs=2) -- 2786(line=157, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
gorder.atxt: 2962(line=168, offs=2) -- 2981(line=168, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
gorder.atxt: 3058(line=173, offs=2) -- 3077(line=173, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
gorder.atxt: 3155(line=178, offs=2) -- 3174(line=178, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
gorder.atxt: 3216(line=182, offs=2) -- 3235(line=182, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
gorder.atxt: 3278(line=186, offs=2) -- 3297(line=186, offs=21)
*)
val __tok24 = atscode_separator()
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
gorder.atxt: 3300(line=188, offs=2) -- 3337(line=188, offs=39)
*)
val __tok25 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
gorder.atxt: 3340(line=190, offs=1) -- 3423(line=194, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gorder_atxt.txt")

