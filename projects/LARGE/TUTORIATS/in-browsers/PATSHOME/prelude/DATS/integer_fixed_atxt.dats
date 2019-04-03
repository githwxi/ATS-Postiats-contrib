(*
integer_fixed.atxt: 1(line=1, offs=1) -- 321(line=19, offs=3)
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
_thisfilename = atext_strcst"integer_fixed.dats"
val ((*void*)) =
theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
integer_fixed.atxt: 326(line=21, offs=2) -- 342(line=21, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
integer_fixed.atxt: 344(line=22, offs=2) -- 367(line=22, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
integer_fixed.atxt: 370(line=24, offs=2) -- 389(line=24, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
integer_fixed.atxt: 392(line=26, offs=2) -- 420(line=26, offs=30)
*)
val __tok4 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
integer_fixed.atxt: 422(line=27, offs=2) -- 464(line=27, offs=44)
*)
val __tok5 = atscode_authoremail("gmhwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
integer_fixed.atxt: 466(line=28, offs=2) -- 502(line=28, offs=38)
*)
val __tok6 = atscode_start_time("February, 2014")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
integer_fixed.atxt: 505(line=30, offs=2) -- 524(line=30, offs=21)
*)
val __tok7 = atscode_separator()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
integer_fixed.atxt: 617(line=35, offs=25) -- 628(line=35, offs=36)
*)
val __tok8 = timestamp()
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
integer_fixed.atxt: 634(line=38, offs=2) -- 653(line=38, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
integer_fixed.atxt: 701(line=43, offs=2) -- 720(line=43, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
integer_fixed.atxt: 768(line=47, offs=2) -- 787(line=47, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
integer_fixed.atxt: 1029(line=58, offs=2) -- 1048(line=58, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
integer_fixed.atxt: 1828(line=87, offs=2) -- 1847(line=87, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
integer_fixed.atxt: 1852(line=89, offs=2) -- 1892(line=89, offs=42)
*)
val __tok14 = g0int_implist("int8knd", "int8", "int8")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
integer_fixed.atxt: 1897(line=91, offs=2) -- 1940(line=91, offs=45)
*)
val __tok15 = g0int_implist("int16knd", "int16", "int16")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
integer_fixed.atxt: 1945(line=93, offs=2) -- 1988(line=93, offs=45)
*)
val __tok16 = g0int_implist("int32knd", "int32", "int32")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
integer_fixed.atxt: 1993(line=95, offs=2) -- 2036(line=95, offs=45)
*)
val __tok17 = g0int_implist("int64knd", "int64", "int64")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
integer_fixed.atxt: 2041(line=97, offs=2) -- 2060(line=97, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
integer_fixed.atxt: 2065(line=99, offs=2) -- 2109(line=99, offs=46)
*)
val __tok19 = g0uint_implist("uint8knd", "uint8", "uint8")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
integer_fixed.atxt: 2114(line=101, offs=2) -- 2161(line=101, offs=49)
*)
val __tok20 = g0uint_implist("uint16knd", "uint16", "uint16")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
integer_fixed.atxt: 2166(line=103, offs=2) -- 2213(line=103, offs=49)
*)
val __tok21 = g0uint_implist("uint32knd", "uint32", "uint32")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
integer_fixed.atxt: 2218(line=105, offs=2) -- 2265(line=105, offs=49)
*)
val __tok22 = g0uint_implist("uint64knd", "uint64", "uint64")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
integer_fixed.atxt: 2270(line=107, offs=2) -- 2289(line=107, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
integer_fixed.atxt: 2292(line=109, offs=2) -- 2329(line=109, offs=39)
*)
val __tok24 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
integer_fixed.atxt: 2332(line=111, offs=1) -- 2422(line=115, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "integer_fixed_atxt.txt")

