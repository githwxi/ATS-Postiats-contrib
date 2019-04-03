(*
gorder_float.atxt: 1(line=1, offs=1) -- 260(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gorder_float.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gorder_float.atxt: 265(line=10, offs=2) -- 281(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gorder_float.atxt: 283(line=11, offs=2) -- 306(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gorder_float.atxt: 309(line=13, offs=2) -- 328(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gorder_float.atxt: 420(line=18, offs=25) -- 431(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gorder_float.atxt: 437(line=21, offs=2) -- 456(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gorder_float.atxt: 459(line=23, offs=2) -- 487(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gorder_float.atxt: 489(line=24, offs=2) -- 537(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gorder_float.atxt: 539(line=25, offs=2) -- 572(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gorder_float.atxt: 575(line=27, offs=2) -- 594(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gorder_float.atxt: 778(line=36, offs=2) -- 815(line=36, offs=39)
*)
val __tok10 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gorder_float.atxt: 818(line=38, offs=1) -- 907(line=42, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gorder_float_atxt.txt")

