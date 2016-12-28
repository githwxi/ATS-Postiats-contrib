(*
gorder_string.atxt: 1(line=1, offs=1) -- 261(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gorder_string.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gorder_string.atxt: 266(line=10, offs=2) -- 282(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gorder_string.atxt: 284(line=11, offs=2) -- 307(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gorder_string.atxt: 310(line=13, offs=2) -- 329(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gorder_string.atxt: 422(line=18, offs=25) -- 433(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gorder_string.atxt: 439(line=21, offs=2) -- 458(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gorder_string.atxt: 461(line=23, offs=2) -- 489(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gorder_string.atxt: 491(line=24, offs=2) -- 539(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gorder_string.atxt: 541(line=25, offs=2) -- 574(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gorder_string.atxt: 577(line=27, offs=2) -- 596(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gorder_string.atxt: 659(line=32, offs=2) -- 678(line=32, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gorder_string.atxt: 681(line=34, offs=2) -- 718(line=34, offs=39)
*)
val __tok11 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gorder_string.atxt: 721(line=36, offs=1) -- 811(line=40, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gorder_string_atxt.txt")

