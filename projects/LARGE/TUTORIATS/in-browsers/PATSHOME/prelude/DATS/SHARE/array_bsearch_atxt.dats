(*
array_bsearch.atxt: 1(line=1, offs=1) -- 261(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"array_bsearch.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
array_bsearch.atxt: 266(line=10, offs=2) -- 282(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
array_bsearch.atxt: 284(line=11, offs=2) -- 307(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
array_bsearch.atxt: 310(line=13, offs=2) -- 329(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
array_bsearch.atxt: 414(line=18, offs=25) -- 425(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
array_bsearch.atxt: 431(line=21, offs=2) -- 450(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
array_bsearch.atxt: 453(line=23, offs=2) -- 481(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
array_bsearch.atxt: 483(line=24, offs=2) -- 531(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
array_bsearch.atxt: 533(line=25, offs=2) -- 566(line=25, offs=35)
*)
val __tok8 = atscode_start_time("April, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
array_bsearch.atxt: 569(line=27, offs=2) -- 588(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
array_bsearch.atxt: 632(line=31, offs=2) -- 651(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
array_bsearch.atxt: 1206(line=63, offs=2) -- 1225(line=63, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
array_bsearch.atxt: 1560(line=90, offs=2) -- 1579(line=90, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
array_bsearch.atxt: 1994(line=115, offs=2) -- 2013(line=115, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
array_bsearch.atxt: 2016(line=117, offs=2) -- 2053(line=117, offs=39)
*)
val __tok14 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
array_bsearch.atxt: 2056(line=119, offs=1) -- 2146(line=123, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "array_bsearch_atxt.txt")

