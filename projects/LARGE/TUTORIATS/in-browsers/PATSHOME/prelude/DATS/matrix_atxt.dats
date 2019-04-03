(*
matrix.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"matrix.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
matrix.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
matrix.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
matrix.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
matrix.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
matrix.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
matrix.atxt: 447(line=23, offs=2) -- 475(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
matrix.atxt: 477(line=24, offs=2) -- 525(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
matrix.atxt: 527(line=25, offs=2) -- 563(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
matrix.atxt: 566(line=27, offs=2) -- 585(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
matrix.atxt: 629(line=31, offs=2) -- 648(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
matrix.atxt: 925(line=45, offs=2) -- 944(line=45, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
matrix.atxt: 1346(line=62, offs=2) -- 1365(line=62, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
matrix.atxt: 1776(line=79, offs=2) -- 1795(line=79, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
matrix.atxt: 2007(line=96, offs=2) -- 2026(line=96, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
matrix.atxt: 2203(line=109, offs=2) -- 2222(line=109, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
matrix.atxt: 2522(line=126, offs=2) -- 2541(line=126, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
matrix.atxt: 3481(line=176, offs=2) -- 3500(line=176, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
matrix.atxt: 3771(line=195, offs=2) -- 3790(line=195, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
matrix.atxt: 5209(line=292, offs=2) -- 5228(line=292, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
matrix.atxt: 5905(line=339, offs=2) -- 5924(line=339, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
matrix.atxt: 6335(line=364, offs=2) -- 6354(line=364, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
matrix.atxt: 6780(line=389, offs=2) -- 6799(line=389, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
matrix.atxt: 7345(line=421, offs=2) -- 7364(line=421, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
matrix.atxt: 8052(line=456, offs=2) -- 8071(line=456, offs=21)
*)
val __tok24 = atscode_separator()
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
matrix.atxt: 8074(line=458, offs=2) -- 8111(line=458, offs=39)
*)
val __tok25 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
matrix.atxt: 8114(line=460, offs=1) -- 8197(line=464, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "matrix_atxt.txt")

