(*
array_quicksort.atxt: 1(line=1, offs=1) -- 263(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"array_quicksort.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
array_quicksort.atxt: 268(line=10, offs=2) -- 284(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
array_quicksort.atxt: 286(line=11, offs=2) -- 309(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
array_quicksort.atxt: 312(line=13, offs=2) -- 331(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
array_quicksort.atxt: 416(line=18, offs=25) -- 427(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
array_quicksort.atxt: 433(line=21, offs=2) -- 452(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
array_quicksort.atxt: 455(line=23, offs=2) -- 483(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
array_quicksort.atxt: 485(line=24, offs=2) -- 533(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
array_quicksort.atxt: 535(line=25, offs=2) -- 568(line=25, offs=35)
*)
val __tok8 = atscode_start_time("April, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
array_quicksort.atxt: 571(line=27, offs=2) -- 590(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
array_quicksort.atxt: 634(line=31, offs=2) -- 653(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
array_quicksort.atxt: 807(line=42, offs=2) -- 826(line=42, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
array_quicksort.atxt: 951(line=52, offs=2) -- 970(line=52, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
array_quicksort.atxt: 5257(line=306, offs=2) -- 5276(line=306, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
array_quicksort.atxt: 5627(line=326, offs=2) -- 5646(line=326, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
array_quicksort.atxt: 5649(line=328, offs=2) -- 5686(line=328, offs=39)
*)
val __tok15 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
array_quicksort.atxt: 5689(line=330, offs=1) -- 5781(line=334, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "array_quicksort_atxt.txt")

