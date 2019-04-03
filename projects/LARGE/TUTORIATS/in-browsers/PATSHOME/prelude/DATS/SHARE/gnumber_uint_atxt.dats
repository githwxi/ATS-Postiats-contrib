(*
gnumber_uint.atxt: 1(line=1, offs=1) -- 260(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gnumber_uint.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gnumber_uint.atxt: 265(line=10, offs=2) -- 281(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gnumber_uint.atxt: 283(line=11, offs=2) -- 306(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gnumber_uint.atxt: 309(line=13, offs=2) -- 328(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gnumber_uint.atxt: 420(line=18, offs=25) -- 431(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gnumber_uint.atxt: 437(line=21, offs=2) -- 456(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gnumber_uint.atxt: 459(line=23, offs=2) -- 487(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gnumber_uint.atxt: 489(line=24, offs=2) -- 537(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gnumber_uint.atxt: 539(line=25, offs=2) -- 572(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gnumber_uint.atxt: 575(line=27, offs=2) -- 594(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gnumber_uint.atxt: 778(line=36, offs=2) -- 797(line=36, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gnumber_uint.atxt: 970(line=47, offs=2) -- 989(line=47, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gnumber_uint.atxt: 1162(line=58, offs=2) -- 1181(line=58, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
gnumber_uint.atxt: 1366(line=69, offs=2) -- 1385(line=69, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
gnumber_uint.atxt: 1570(line=80, offs=2) -- 1589(line=80, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
gnumber_uint.atxt: 1774(line=91, offs=2) -- 1793(line=91, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
gnumber_uint.atxt: 1978(line=102, offs=2) -- 1997(line=102, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
gnumber_uint.atxt: 2190(line=113, offs=2) -- 2209(line=113, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
gnumber_uint.atxt: 2380(line=126, offs=2) -- 2399(line=126, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
gnumber_uint.atxt: 2402(line=128, offs=2) -- 2439(line=128, offs=39)
*)
val __tok19 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
gnumber_uint.atxt: 2442(line=130, offs=1) -- 2531(line=134, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gnumber_uint_atxt.txt")

