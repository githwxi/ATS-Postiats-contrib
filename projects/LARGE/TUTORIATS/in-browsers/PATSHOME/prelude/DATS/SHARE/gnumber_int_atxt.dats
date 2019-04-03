(*
gnumber_int.atxt: 1(line=1, offs=1) -- 259(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gnumber_int.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gnumber_int.atxt: 264(line=10, offs=2) -- 280(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gnumber_int.atxt: 282(line=11, offs=2) -- 305(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gnumber_int.atxt: 308(line=13, offs=2) -- 327(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gnumber_int.atxt: 418(line=18, offs=25) -- 429(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gnumber_int.atxt: 435(line=21, offs=2) -- 454(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gnumber_int.atxt: 457(line=23, offs=2) -- 485(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gnumber_int.atxt: 487(line=24, offs=2) -- 535(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gnumber_int.atxt: 537(line=25, offs=2) -- 570(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gnumber_int.atxt: 573(line=27, offs=2) -- 592(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gnumber_int.atxt: 828(line=38, offs=2) -- 847(line=38, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gnumber_int.atxt: 953(line=47, offs=2) -- 972(line=47, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gnumber_int.atxt: 1143(line=58, offs=2) -- 1162(line=58, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
gnumber_int.atxt: 1289(line=67, offs=2) -- 1308(line=67, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
gnumber_int.atxt: 1491(line=78, offs=2) -- 1510(line=78, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
gnumber_int.atxt: 1646(line=87, offs=2) -- 1665(line=87, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
gnumber_int.atxt: 1848(line=98, offs=2) -- 1867(line=98, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
gnumber_int.atxt: 2050(line=109, offs=2) -- 2069(line=109, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
gnumber_int.atxt: 2260(line=120, offs=2) -- 2279(line=120, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
gnumber_int.atxt: 2448(line=133, offs=2) -- 2467(line=133, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
gnumber_int.atxt: 2470(line=135, offs=2) -- 2507(line=135, offs=39)
*)
val __tok20 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
gnumber_int.atxt: 2510(line=137, offs=1) -- 2598(line=141, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gnumber_int_atxt.txt")

