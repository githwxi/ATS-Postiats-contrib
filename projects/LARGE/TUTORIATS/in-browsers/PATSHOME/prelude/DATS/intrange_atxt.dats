(*
intrange.atxt: 1(line=1, offs=1) -- 256(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"intrange.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
intrange.atxt: 261(line=10, offs=2) -- 277(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
intrange.atxt: 279(line=11, offs=2) -- 302(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
intrange.atxt: 305(line=13, offs=2) -- 324(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
intrange.atxt: 412(line=18, offs=25) -- 423(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
intrange.atxt: 429(line=21, offs=2) -- 448(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
intrange.atxt: 451(line=23, offs=2) -- 479(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
intrange.atxt: 481(line=24, offs=2) -- 529(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
intrange.atxt: 531(line=25, offs=2) -- 563(line=25, offs=34)
*)
val __tok8 = atscode_start_time("June, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
intrange.atxt: 566(line=27, offs=2) -- 585(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
intrange.atxt: 1156(line=68, offs=2) -- 1175(line=68, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
intrange.atxt: 1298(line=77, offs=2) -- 1317(line=77, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
intrange.atxt: 1459(line=88, offs=2) -- 1478(line=88, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
intrange.atxt: 1796(line=108, offs=2) -- 1815(line=108, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
intrange.atxt: 2410(line=150, offs=2) -- 2429(line=150, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
intrange.atxt: 2554(line=159, offs=2) -- 2573(line=159, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
intrange.atxt: 2718(line=170, offs=2) -- 2737(line=170, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
intrange.atxt: 3060(line=190, offs=2) -- 3079(line=190, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
intrange.atxt: 3248(line=199, offs=2) -- 3267(line=199, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
intrange.atxt: 3662(line=231, offs=2) -- 3681(line=231, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
intrange.atxt: 3901(line=248, offs=2) -- 3920(line=248, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
intrange.atxt: 4237(line=270, offs=2) -- 4256(line=270, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
intrange.atxt: 4259(line=272, offs=2) -- 4296(line=272, offs=39)
*)
val __tok22 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
intrange.atxt: 4299(line=274, offs=1) -- 4384(line=278, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "intrange_atxt.txt")

