(*
list_vt_mergesort.atxt: 1(line=1, offs=1) -- 265(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"list_vt_mergesort.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
list_vt_mergesort.atxt: 270(line=10, offs=2) -- 286(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
list_vt_mergesort.atxt: 288(line=11, offs=2) -- 311(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
list_vt_mergesort.atxt: 314(line=13, offs=2) -- 333(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
list_vt_mergesort.atxt: 430(line=18, offs=25) -- 441(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
list_vt_mergesort.atxt: 447(line=21, offs=2) -- 466(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
list_vt_mergesort.atxt: 469(line=23, offs=2) -- 497(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
list_vt_mergesort.atxt: 499(line=24, offs=2) -- 547(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
list_vt_mergesort.atxt: 549(line=25, offs=2) -- 585(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
list_vt_mergesort.atxt: 588(line=27, offs=2) -- 607(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
list_vt_mergesort.atxt: 651(line=31, offs=2) -- 670(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
list_vt_mergesort.atxt: 799(line=41, offs=2) -- 818(line=41, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
list_vt_mergesort.atxt: 914(line=49, offs=2) -- 933(line=49, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
list_vt_mergesort.atxt: 2387(line=129, offs=2) -- 2406(line=129, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
list_vt_mergesort.atxt: 2429(line=133, offs=2) -- 2448(line=133, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
list_vt_mergesort.atxt: 4427(line=235, offs=2) -- 4446(line=235, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
list_vt_mergesort.atxt: 4738(line=254, offs=2) -- 4757(line=254, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
list_vt_mergesort.atxt: 4760(line=256, offs=2) -- 4797(line=256, offs=39)
*)
val __tok17 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
list_vt_mergesort.atxt: 4800(line=258, offs=1) -- 4894(line=262, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "list_vt_mergesort_atxt.txt")

