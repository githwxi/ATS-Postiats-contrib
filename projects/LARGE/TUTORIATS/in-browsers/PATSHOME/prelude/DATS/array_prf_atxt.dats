(*
array_prf.atxt: 1(line=1, offs=1) -- 257(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"array_prf.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
array_prf.atxt: 262(line=10, offs=2) -- 278(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
array_prf.atxt: 280(line=11, offs=2) -- 303(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
array_prf.atxt: 306(line=13, offs=2) -- 325(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
array_prf.atxt: 414(line=18, offs=25) -- 425(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
array_prf.atxt: 431(line=21, offs=2) -- 450(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
array_prf.atxt: 453(line=23, offs=2) -- 481(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
array_prf.atxt: 483(line=24, offs=2) -- 531(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
array_prf.atxt: 533(line=25, offs=2) -- 569(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
array_prf.atxt: 572(line=27, offs=2) -- 591(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
array_prf.atxt: 748(line=41, offs=2) -- 767(line=41, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
array_prf.atxt: 1055(line=67, offs=2) -- 1074(line=67, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
array_prf.atxt: 1692(line=103, offs=2) -- 1711(line=103, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
array_prf.atxt: 1826(line=110, offs=2) -- 1845(line=110, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
array_prf.atxt: 2544(line=151, offs=2) -- 2563(line=151, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
array_prf.atxt: 2932(line=176, offs=2) -- 2951(line=176, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
array_prf.atxt: 3591(line=208, offs=2) -- 3610(line=208, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
array_prf.atxt: 3613(line=210, offs=2) -- 3650(line=210, offs=39)
*)
val __tok17 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
array_prf.atxt: 3653(line=212, offs=1) -- 3739(line=216, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "array_prf_atxt.txt")

