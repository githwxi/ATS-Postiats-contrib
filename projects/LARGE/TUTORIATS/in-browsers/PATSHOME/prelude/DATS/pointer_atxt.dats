(*
pointer.atxt: 1(line=1, offs=1) -- 255(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"pointer.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
pointer.atxt: 260(line=10, offs=2) -- 276(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
pointer.atxt: 278(line=11, offs=2) -- 301(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
pointer.atxt: 304(line=13, offs=2) -- 323(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
pointer.atxt: 410(line=18, offs=25) -- 421(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
pointer.atxt: 427(line=21, offs=2) -- 446(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
pointer.atxt: 449(line=23, offs=2) -- 477(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
pointer.atxt: 479(line=24, offs=2) -- 527(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
pointer.atxt: 529(line=25, offs=2) -- 562(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
pointer.atxt: 565(line=27, offs=2) -- 584(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
pointer.atxt: 628(line=31, offs=2) -- 647(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
pointer.atxt: 741(line=38, offs=2) -- 760(line=38, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
pointer.atxt: 816(line=43, offs=2) -- 835(line=43, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
pointer.atxt: 963(line=52, offs=2) -- 982(line=52, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
pointer.atxt: 1333(line=72, offs=2) -- 1352(line=72, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
pointer.atxt: 1546(line=83, offs=2) -- 1565(line=83, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
pointer.atxt: 1992(line=103, offs=2) -- 2011(line=103, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
pointer.atxt: 2232(line=120, offs=2) -- 2251(line=120, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
pointer.atxt: 2363(line=130, offs=2) -- 2382(line=130, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
pointer.atxt: 2449(line=136, offs=2) -- 2468(line=136, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
pointer.atxt: 2638(line=149, offs=2) -- 2657(line=149, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
pointer.atxt: 2839(line=160, offs=2) -- 2858(line=160, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
pointer.atxt: 3182(line=181, offs=2) -- 3201(line=181, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
pointer.atxt: 3446(line=197, offs=2) -- 3465(line=197, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
pointer.atxt: 3866(line=228, offs=2) -- 3885(line=228, offs=21)
*)
val __tok24 = atscode_separator()
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
pointer.atxt: 3946(line=233, offs=2) -- 3965(line=233, offs=21)
*)
val __tok25 = atscode_separator()
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
pointer.atxt: 3968(line=235, offs=2) -- 4005(line=235, offs=39)
*)
val __tok26 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
pointer.atxt: 4008(line=237, offs=1) -- 4092(line=241, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "pointer_atxt.txt")

