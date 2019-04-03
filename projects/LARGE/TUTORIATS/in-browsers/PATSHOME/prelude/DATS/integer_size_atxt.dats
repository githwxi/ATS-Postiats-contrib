(*
integer_size.atxt: 1(line=1, offs=1) -- 316(line=18, offs=3)
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
_thisfilename = atext_strcst"integer_size.dats"
val ((*void*)) =
theAtextMap_insert_str("thisfilename", _thisfilename)

(*
integer_size.atxt: 321(line=20, offs=2) -- 337(line=20, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
integer_size.atxt: 339(line=21, offs=2) -- 362(line=21, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
integer_size.atxt: 365(line=23, offs=2) -- 384(line=23, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
integer_size.atxt: 387(line=25, offs=2) -- 415(line=25, offs=30)
*)
val __tok4 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
integer_size.atxt: 417(line=26, offs=2) -- 459(line=26, offs=44)
*)
val __tok5 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
integer_size.atxt: 461(line=27, offs=2) -- 492(line=27, offs=33)
*)
val __tok6 = atscode_start_time("May, 2012")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
integer_size.atxt: 495(line=29, offs=2) -- 514(line=29, offs=21)
*)
val __tok7 = atscode_separator()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
integer_size.atxt: 606(line=34, offs=25) -- 617(line=34, offs=36)
*)
val __tok8 = timestamp()
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
integer_size.atxt: 623(line=37, offs=2) -- 642(line=37, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
integer_size.atxt: 690(line=42, offs=2) -- 709(line=42, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
integer_size.atxt: 757(line=46, offs=2) -- 776(line=46, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
integer_size.atxt: 1031(line=58, offs=2) -- 1050(line=58, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
integer_size.atxt: 1305(line=70, offs=2) -- 1324(line=70, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
integer_size.atxt: 1708(line=87, offs=2) -- 1727(line=87, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
integer_size.atxt: 2111(line=104, offs=2) -- 2130(line=104, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
integer_size.atxt: 2393(line=116, offs=2) -- 2412(line=116, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
integer_size.atxt: 2417(line=118, offs=2) -- 2460(line=118, offs=45)
*)
val __tok17 = g0uint_implist("sizeknd", "size", "size_t")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
integer_size.atxt: 2465(line=120, offs=2) -- 2508(line=120, offs=45)
*)
val __tok18 = g1uint_implist("sizeknd", "size", "size_t")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
integer_size.atxt: 2513(line=122, offs=2) -- 2532(line=122, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
integer_size.atxt: 2537(line=124, offs=2) -- 2583(line=124, offs=48)
*)
val __tok20 = g0sint_implist("ssizeknd", "ssize", "ssize_t")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
integer_size.atxt: 2588(line=126, offs=2) -- 2634(line=126, offs=48)
*)
val __tok21 = g1sint_implist("ssizeknd", "ssize", "ssize_t")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
integer_size.atxt: 2639(line=128, offs=2) -- 2658(line=128, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
integer_size.atxt: 2661(line=130, offs=2) -- 2698(line=130, offs=39)
*)
val __tok23 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
integer_size.atxt: 2701(line=132, offs=1) -- 2790(line=136, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "integer_size_atxt.txt")

