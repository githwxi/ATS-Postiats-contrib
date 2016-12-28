(*
gnumber.atxt: 1(line=1, offs=1) -- 255(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"gnumber.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
gnumber.atxt: 260(line=10, offs=2) -- 276(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
gnumber.atxt: 278(line=11, offs=2) -- 301(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
gnumber.atxt: 304(line=13, offs=2) -- 323(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
gnumber.atxt: 410(line=18, offs=25) -- 421(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
gnumber.atxt: 427(line=21, offs=2) -- 446(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
gnumber.atxt: 449(line=23, offs=2) -- 477(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
gnumber.atxt: 479(line=24, offs=2) -- 527(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
gnumber.atxt: 529(line=25, offs=2) -- 562(line=25, offs=35)
*)
val __tok8 = atscode_start_time("March, 2013")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
gnumber.atxt: 565(line=27, offs=2) -- 584(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
gnumber.atxt: 587(line=29, offs=2) -- 619(line=29, offs=34)
*)
val __tok10 = atscode_author("Brandon Barker")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
gnumber.atxt: 621(line=30, offs=2) -- 675(line=30, offs=56)
*)
val __tok11 = atscode_authoremail("brandon.barker AT gmail DOT com")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
gnumber.atxt: 677(line=31, offs=2) -- 709(line=31, offs=34)
*)
val __tok12 = atscode_start_time("July, 2013")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
gnumber.atxt: 712(line=33, offs=2) -- 731(line=33, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
gnumber.atxt: 901(line=42, offs=2) -- 920(line=42, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
gnumber.atxt: 1088(line=51, offs=2) -- 1107(line=51, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
gnumber.atxt: 1357(line=63, offs=2) -- 1376(line=63, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
gnumber.atxt: 1916(line=103, offs=2) -- 1935(line=103, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
gnumber.atxt: 2014(line=108, offs=2) -- 2033(line=108, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
gnumber.atxt: 2076(line=112, offs=2) -- 2095(line=112, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
gnumber.atxt: 2098(line=114, offs=2) -- 2135(line=114, offs=39)
*)
val __tok20 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
gnumber.atxt: 2138(line=116, offs=1) -- 2222(line=120, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "gnumber_atxt.txt")

