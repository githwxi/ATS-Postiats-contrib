(*
tostring.atxt: 1(line=1, offs=1) -- 256(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"tostring.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
tostring.atxt: 261(line=10, offs=2) -- 277(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
tostring.atxt: 279(line=11, offs=2) -- 302(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
tostring.atxt: 305(line=13, offs=2) -- 324(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
tostring.atxt: 412(line=18, offs=25) -- 423(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
tostring.atxt: 429(line=21, offs=2) -- 448(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
tostring.atxt: 451(line=23, offs=2) -- 479(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
tostring.atxt: 481(line=24, offs=2) -- 521(line=24, offs=42)
*)
val __tok7 = atscode_authoremail("hwxiATgmailDOTcom")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
tostring.atxt: 523(line=25, offs=2) -- 556(line=25, offs=35)
*)
val __tok8 = atscode_start_time("April, 2015")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
tostring.atxt: 559(line=27, offs=2) -- 578(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
tostring.atxt: 626(line=32, offs=2) -- 645(line=32, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
tostring.atxt: 1177(line=67, offs=2) -- 1196(line=67, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
tostring.atxt: 1304(line=74, offs=2) -- 1323(line=74, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
tostring.atxt: 1863(line=109, offs=2) -- 1882(line=109, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
tostring.atxt: 2105(line=123, offs=2) -- 2124(line=123, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
tostring.atxt: 2370(line=142, offs=2) -- 2389(line=142, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
tostring.atxt: 2945(line=177, offs=2) -- 2964(line=177, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
tostring.atxt: 4026(line=238, offs=2) -- 4045(line=238, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
tostring.atxt: 4164(line=244, offs=2) -- 4183(line=244, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
tostring.atxt: 4274(line=250, offs=2) -- 4293(line=250, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
tostring.atxt: 5474(line=321, offs=2) -- 5493(line=321, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
tostring.atxt: 5615(line=327, offs=2) -- 5634(line=327, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
tostring.atxt: 5827(line=343, offs=2) -- 5846(line=343, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
tostring.atxt: 6028(line=357, offs=2) -- 6047(line=357, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
tostring.atxt: 6050(line=359, offs=2) -- 6087(line=359, offs=39)
*)
val __tok24 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
tostring.atxt: 6090(line=361, offs=1) -- 6175(line=365, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "tostring_atxt.txt")

