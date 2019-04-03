(*
integer_short.atxt: 1(line=1, offs=1) -- 318(line=19, offs=3)
*)

#define
ATSCODEFORMAT "txt"
//
#if(ATSCODEFORMAT == "txt")
//
#include
"utils/atsdoc/HATS/postiatsatxt.hats"
//
#endif // end of [ATSCCODEFORMAT]
//
#include "prelude_DATS_atext.hats"
//
val
_thisfilename =
atext_strcst"integer_short.dats"
val ((*void*)) =
theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
integer_short.atxt: 323(line=21, offs=2) -- 339(line=21, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
integer_short.atxt: 341(line=22, offs=2) -- 364(line=22, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
integer_short.atxt: 367(line=24, offs=2) -- 386(line=24, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
integer_short.atxt: 389(line=26, offs=2) -- 417(line=26, offs=30)
*)
val __tok4 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
integer_short.atxt: 419(line=27, offs=2) -- 461(line=27, offs=44)
*)
val __tok5 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
integer_short.atxt: 463(line=28, offs=2) -- 499(line=28, offs=38)
*)
val __tok6 = atscode_start_time("February, 2014")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
integer_short.atxt: 502(line=30, offs=2) -- 521(line=30, offs=21)
*)
val __tok7 = atscode_separator()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
integer_short.atxt: 614(line=35, offs=25) -- 625(line=35, offs=36)
*)
val __tok8 = timestamp()
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
integer_short.atxt: 631(line=38, offs=2) -- 650(line=38, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
integer_short.atxt: 698(line=43, offs=2) -- 717(line=43, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
integer_short.atxt: 765(line=47, offs=2) -- 784(line=47, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
integer_short.atxt: 910(line=54, offs=2) -- 929(line=54, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
integer_short.atxt: 1063(line=61, offs=2) -- 1082(line=61, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
integer_short.atxt: 1087(line=63, offs=2) -- 1127(line=63, offs=42)
*)
val __tok14 = g0int_implist("sintknd", "sint", "sint")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
integer_short.atxt: 1132(line=65, offs=2) -- 1176(line=65, offs=46)
*)
val __tok15 = g0uint_implist("usintknd", "usint", "usint")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
integer_short.atxt: 1181(line=67, offs=2) -- 1200(line=67, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
integer_short.atxt: 1203(line=69, offs=2) -- 1240(line=69, offs=39)
*)
val __tok17 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
integer_short.atxt: 1243(line=71, offs=1) -- 1333(line=75, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "integer_short_atxt.txt")

