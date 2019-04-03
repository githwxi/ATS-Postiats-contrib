(*
parray.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"parray.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
parray.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
parray.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
parray.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
parray.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
parray.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
parray.atxt: 447(line=23, offs=2) -- 475(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
parray.atxt: 477(line=24, offs=2) -- 525(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
parray.atxt: 527(line=25, offs=2) -- 560(line=25, offs=35)
*)
val __tok8 = atscode_start_time("April, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
parray.atxt: 563(line=27, offs=2) -- 582(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
parray.atxt: 626(line=31, offs=2) -- 645(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
parray.atxt: 1401(line=71, offs=2) -- 1420(line=71, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
parray.atxt: 2014(line=105, offs=2) -- 2033(line=105, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
parray.atxt: 2036(line=107, offs=2) -- 2073(line=107, offs=39)
*)
val __tok13 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
parray.atxt: 2076(line=109, offs=1) -- 2159(line=113, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "parray_atxt.txt")

