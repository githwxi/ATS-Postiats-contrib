(*
gorder_int.atxt: 1(line=1, offs=1) -- 258(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gorder_int.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gorder_int.atxt: 263(line=10, offs=2) -- 279(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gorder_int.atxt: 281(line=11, offs=2) -- 304(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gorder_int.atxt: 307(line=13, offs=2) -- 326(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gorder_int.atxt: 416(line=18, offs=25) -- 427(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gorder_int.atxt: 433(line=21, offs=2) -- 452(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gorder_int.atxt: 455(line=23, offs=2) -- 483(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gorder_int.atxt: 485(line=24, offs=2) -- 533(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gorder_int.atxt: 535(line=25, offs=2) -- 568(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gorder_int.atxt: 571(line=27, offs=2) -- 590(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gorder_int.atxt: 818(line=38, offs=2) -- 837(line=38, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gorder_int.atxt: 840(line=40, offs=2) -- 877(line=40, offs=39)
*)
val __tok11 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gorder_int.atxt: 880(line=42, offs=1) -- 967(line=46, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gorder_int_atxt.txt")

