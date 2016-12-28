(*
unsafe.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"unsafe.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
unsafe.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
unsafe.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
unsafe.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
unsafe.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
unsafe.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
unsafe.atxt: 447(line=23, offs=2) -- 475(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
unsafe.atxt: 477(line=24, offs=2) -- 525(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
unsafe.atxt: 527(line=25, offs=2) -- 560(line=25, offs=35)
*)
val __tok8 = atscode_start_time("April, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
unsafe.atxt: 563(line=27, offs=2) -- 582(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
unsafe.atxt: 621(line=31, offs=2) -- 640(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
unsafe.atxt: 764(line=40, offs=2) -- 783(line=40, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
unsafe.atxt: 1091(line=57, offs=2) -- 1110(line=57, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
unsafe.atxt: 1428(line=74, offs=2) -- 1447(line=74, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
unsafe.atxt: 2100(line=109, offs=2) -- 2119(line=109, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
unsafe.atxt: 2419(line=126, offs=2) -- 2438(line=126, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
unsafe.atxt: 2762(line=143, offs=2) -- 2781(line=143, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
unsafe.atxt: 3152(line=163, offs=2) -- 3171(line=163, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
unsafe.atxt: 3353(line=174, offs=2) -- 3372(line=174, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
unsafe.atxt: 4255(line=206, offs=2) -- 4274(line=206, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
unsafe.atxt: 4536(line=220, offs=2) -- 4555(line=220, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
unsafe.atxt: 4558(line=222, offs=2) -- 4595(line=222, offs=39)
*)
val __tok21 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
unsafe.atxt: 4598(line=224, offs=1) -- 4681(line=228, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "unsafe_atxt.txt")

