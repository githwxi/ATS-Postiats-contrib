(*
reference.atxt: 1(line=1, offs=1) -- 257(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"reference.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
reference.atxt: 262(line=10, offs=2) -- 278(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
reference.atxt: 280(line=11, offs=2) -- 303(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
reference.atxt: 306(line=13, offs=2) -- 325(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
reference.atxt: 414(line=18, offs=25) -- 425(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
reference.atxt: 431(line=21, offs=2) -- 450(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
reference.atxt: 453(line=23, offs=2) -- 481(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
reference.atxt: 483(line=24, offs=2) -- 531(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
reference.atxt: 533(line=25, offs=2) -- 564(line=25, offs=33)
*)
val __tok8 = atscode_start_time("May, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
reference.atxt: 567(line=27, offs=2) -- 586(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
reference.atxt: 856(line=43, offs=2) -- 875(line=43, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
reference.atxt: 1291(line=70, offs=2) -- 1310(line=70, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
reference.atxt: 1599(line=85, offs=2) -- 1618(line=85, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
reference.atxt: 1906(line=104, offs=2) -- 1925(line=104, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
reference.atxt: 1928(line=106, offs=2) -- 1965(line=106, offs=39)
*)
val __tok14 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
reference.atxt: 1968(line=108, offs=1) -- 2054(line=112, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "reference_atxt.txt")

