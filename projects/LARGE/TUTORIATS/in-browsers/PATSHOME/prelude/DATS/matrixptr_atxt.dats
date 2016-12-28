(*
matrixptr.atxt: 1(line=1, offs=1) -- 257(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"matrixptr.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
matrixptr.atxt: 262(line=10, offs=2) -- 278(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
matrixptr.atxt: 280(line=11, offs=2) -- 303(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
matrixptr.atxt: 306(line=13, offs=2) -- 325(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
matrixptr.atxt: 414(line=18, offs=25) -- 425(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
matrixptr.atxt: 431(line=21, offs=2) -- 450(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
matrixptr.atxt: 453(line=23, offs=2) -- 481(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
matrixptr.atxt: 483(line=24, offs=2) -- 531(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
matrixptr.atxt: 533(line=25, offs=2) -- 569(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
matrixptr.atxt: 572(line=27, offs=2) -- 591(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
matrixptr.atxt: 635(line=31, offs=2) -- 654(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
matrixptr.atxt: 785(line=38, offs=2) -- 804(line=38, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
matrixptr.atxt: 1002(line=48, offs=2) -- 1021(line=48, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
matrixptr.atxt: 1388(line=66, offs=2) -- 1407(line=66, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
matrixptr.atxt: 1786(line=84, offs=2) -- 1805(line=84, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
matrixptr.atxt: 2190(line=102, offs=2) -- 2209(line=102, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
matrixptr.atxt: 2474(line=120, offs=2) -- 2493(line=120, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
matrixptr.atxt: 2781(line=137, offs=2) -- 2800(line=137, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
matrixptr.atxt: 2847(line=143, offs=2) -- 2866(line=143, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
matrixptr.atxt: 3290(line=165, offs=2) -- 3309(line=165, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
matrixptr.atxt: 3549(line=180, offs=2) -- 3568(line=180, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
matrixptr.atxt: 3814(line=195, offs=2) -- 3833(line=195, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
matrixptr.atxt: 4002(line=209, offs=2) -- 4021(line=209, offs=21)
*)
val __tok22 = atscode_separator()
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
matrixptr.atxt: 4169(line=218, offs=2) -- 4188(line=218, offs=21)
*)
val __tok23 = atscode_separator()
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
matrixptr.atxt: 4468(line=232, offs=2) -- 4487(line=232, offs=21)
*)
val __tok24 = atscode_separator()
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
matrixptr.atxt: 4490(line=234, offs=2) -- 4527(line=234, offs=39)
*)
val __tok25 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
matrixptr.atxt: 4530(line=236, offs=1) -- 4616(line=240, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "matrixptr_atxt.txt")

