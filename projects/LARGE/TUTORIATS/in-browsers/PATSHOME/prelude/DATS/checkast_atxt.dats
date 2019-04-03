(*
checkast.atxt: 1(line=1, offs=1) -- 268(line=12, offs=3)
*)

//
#define ATSCODEFORMAT "txt"
//
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
//
val _thisfilename = atext_strcst"checkast.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)
//

(*
checkast.atxt: 273(line=14, offs=2) -- 289(line=14, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
checkast.atxt: 291(line=15, offs=2) -- 314(line=15, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
checkast.atxt: 317(line=17, offs=2) -- 336(line=17, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
checkast.atxt: 424(line=22, offs=25) -- 435(line=22, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
checkast.atxt: 441(line=25, offs=2) -- 460(line=25, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
checkast.atxt: 463(line=27, offs=2) -- 491(line=27, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
checkast.atxt: 493(line=28, offs=2) -- 535(line=28, offs=44)
*)
val __tok7 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
checkast.atxt: 537(line=29, offs=2) -- 573(line=29, offs=38)
*)
val __tok8 = atscode_start_time("December, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
checkast.atxt: 576(line=31, offs=2) -- 595(line=31, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
checkast.atxt: 639(line=36, offs=2) -- 658(line=36, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
checkast.atxt: 705(line=42, offs=2) -- 724(line=42, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
checkast.atxt: 1022(line=68, offs=2) -- 1041(line=68, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
checkast.atxt: 1311(line=86, offs=2) -- 1330(line=86, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
checkast.atxt: 1603(line=104, offs=2) -- 1622(line=104, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
checkast.atxt: 1892(line=122, offs=2) -- 1911(line=122, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
checkast.atxt: 2184(line=140, offs=2) -- 2203(line=140, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
checkast.atxt: 2633(line=164, offs=2) -- 2652(line=164, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
checkast.atxt: 3085(line=188, offs=2) -- 3104(line=188, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
checkast.atxt: 3380(line=207, offs=2) -- 3399(line=207, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
checkast.atxt: 3769(line=230, offs=2) -- 3788(line=230, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
checkast.atxt: 3791(line=232, offs=2) -- 3828(line=232, offs=39)
*)
val __tok21 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
checkast.atxt: 3831(line=234, offs=1) -- 3916(line=238, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "checkast_atxt.txt")

