(*
integer_ptr.atxt: 1(line=1, offs=1) -- 319(line=19, offs=3)
*)

//
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
_thisfilename = atext_strcst"integer_ptr.dats"
val ((*void*)) =
theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
integer_ptr.atxt: 324(line=21, offs=2) -- 340(line=21, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
integer_ptr.atxt: 342(line=22, offs=2) -- 365(line=22, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
integer_ptr.atxt: 368(line=24, offs=2) -- 387(line=24, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
integer_ptr.atxt: 390(line=26, offs=2) -- 418(line=26, offs=30)
*)
val __tok4 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
integer_ptr.atxt: 420(line=27, offs=2) -- 462(line=27, offs=44)
*)
val __tok5 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
integer_ptr.atxt: 464(line=28, offs=2) -- 500(line=28, offs=38)
*)
val __tok6 = atscode_start_time("February, 2014")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
integer_ptr.atxt: 503(line=30, offs=2) -- 522(line=30, offs=21)
*)
val __tok7 = atscode_separator()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
integer_ptr.atxt: 613(line=35, offs=25) -- 624(line=35, offs=36)
*)
val __tok8 = timestamp()
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
integer_ptr.atxt: 630(line=38, offs=2) -- 649(line=38, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
integer_ptr.atxt: 697(line=43, offs=2) -- 716(line=43, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
integer_ptr.atxt: 764(line=47, offs=2) -- 783(line=47, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
integer_ptr.atxt: 911(line=54, offs=2) -- 930(line=54, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
integer_ptr.atxt: 1074(line=61, offs=2) -- 1093(line=61, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
integer_ptr.atxt: 1098(line=63, offs=2) -- 1144(line=63, offs=48)
*)
val __tok14 = g0int_implist("intptrknd", "intptr", "intptr")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
integer_ptr.atxt: 1149(line=65, offs=2) -- 1199(line=65, offs=52)
*)
val __tok15 = g0uint_implist("uintptrknd", "uintptr", "uintptr")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
integer_ptr.atxt: 1204(line=67, offs=2) -- 1223(line=67, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
integer_ptr.atxt: 1226(line=69, offs=2) -- 1263(line=69, offs=39)
*)
val __tok17 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
integer_ptr.atxt: 1266(line=71, offs=1) -- 1354(line=75, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "integer_ptr_atxt.txt")

