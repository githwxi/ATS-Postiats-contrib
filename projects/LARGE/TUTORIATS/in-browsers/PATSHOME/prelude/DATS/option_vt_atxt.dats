(*
option_vt.atxt: 1(line=1, offs=1) -- 257(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"option_vt.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
option_vt.atxt: 262(line=10, offs=2) -- 278(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
option_vt.atxt: 280(line=11, offs=2) -- 303(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
option_vt.atxt: 306(line=13, offs=2) -- 325(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
option_vt.atxt: 414(line=18, offs=25) -- 425(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
option_vt.atxt: 431(line=21, offs=2) -- 450(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
option_vt.atxt: 453(line=23, offs=2) -- 481(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
option_vt.atxt: 483(line=24, offs=2) -- 531(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
option_vt.atxt: 533(line=25, offs=2) -- 569(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
option_vt.atxt: 572(line=27, offs=2) -- 591(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
option_vt.atxt: 687(line=32, offs=2) -- 706(line=32, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
option_vt.atxt: 949(line=45, offs=2) -- 968(line=45, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
option_vt.atxt: 1227(line=60, offs=2) -- 1246(line=60, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
option_vt.atxt: 1469(line=74, offs=2) -- 1488(line=74, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
option_vt.atxt: 1744(line=90, offs=2) -- 1763(line=90, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
option_vt.atxt: 2168(line=112, offs=2) -- 2187(line=112, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
option_vt.atxt: 2190(line=114, offs=2) -- 2227(line=114, offs=39)
*)
val __tok16 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
option_vt.atxt: 2230(line=116, offs=1) -- 2316(line=120, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "option_vt_atxt.txt")

