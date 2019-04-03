(*
option.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"option.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
option.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
option.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
option.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
option.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
option.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
option.atxt: 447(line=23, offs=2) -- 475(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
option.atxt: 477(line=24, offs=2) -- 525(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
option.atxt: 527(line=25, offs=2) -- 563(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
option.atxt: 566(line=27, offs=2) -- 585(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
option.atxt: 669(line=32, offs=2) -- 688(line=32, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
option.atxt: 803(line=40, offs=2) -- 822(line=40, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
option.atxt: 1063(line=54, offs=2) -- 1082(line=54, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
option.atxt: 1335(line=70, offs=2) -- 1354(line=70, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
option.atxt: 1675(line=91, offs=2) -- 1694(line=91, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
option.atxt: 2185(line=120, offs=2) -- 2204(line=120, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
option.atxt: 2207(line=122, offs=2) -- 2244(line=122, offs=39)
*)
val __tok16 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
option.atxt: 2247(line=124, offs=1) -- 2330(line=128, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "option_atxt.txt")

