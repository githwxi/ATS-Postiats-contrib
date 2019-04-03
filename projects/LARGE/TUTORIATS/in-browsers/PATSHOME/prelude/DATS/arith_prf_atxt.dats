(*
arith_prf.atxt: 1(line=1, offs=1) -- 257(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"arith_prf.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
arith_prf.atxt: 262(line=10, offs=2) -- 278(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
arith_prf.atxt: 280(line=11, offs=2) -- 303(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
arith_prf.atxt: 306(line=13, offs=2) -- 325(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
arith_prf.atxt: 414(line=18, offs=25) -- 425(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
arith_prf.atxt: 431(line=21, offs=2) -- 450(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
arith_prf.atxt: 453(line=23, offs=2) -- 481(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
arith_prf.atxt: 483(line=24, offs=2) -- 531(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
arith_prf.atxt: 533(line=25, offs=2) -- 569(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
arith_prf.atxt: 572(line=27, offs=2) -- 591(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
arith_prf.atxt: 630(line=31, offs=2) -- 649(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
arith_prf.atxt: 1528(line=71, offs=2) -- 1547(line=71, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
arith_prf.atxt: 1874(line=91, offs=2) -- 1893(line=91, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
arith_prf.atxt: 2128(line=103, offs=2) -- 2147(line=103, offs=21)
*)
val __tok13 = atscode_separator()
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
arith_prf.atxt: 2412(line=118, offs=2) -- 2431(line=118, offs=21)
*)
val __tok14 = atscode_separator()
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
arith_prf.atxt: 2767(line=136, offs=2) -- 2786(line=136, offs=21)
*)
val __tok15 = atscode_separator()
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
arith_prf.atxt: 3225(line=153, offs=2) -- 3244(line=153, offs=21)
*)
val __tok16 = atscode_separator()
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
arith_prf.atxt: 3517(line=169, offs=2) -- 3536(line=169, offs=21)
*)
val __tok17 = atscode_separator()
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
arith_prf.atxt: 3736(line=179, offs=2) -- 3755(line=179, offs=21)
*)
val __tok18 = atscode_separator()
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
arith_prf.atxt: 4202(line=199, offs=2) -- 4221(line=199, offs=21)
*)
val __tok19 = atscode_separator()
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
arith_prf.atxt: 4678(line=218, offs=2) -- 4697(line=218, offs=21)
*)
val __tok20 = atscode_separator()
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
arith_prf.atxt: 5457(line=249, offs=2) -- 5476(line=249, offs=21)
*)
val __tok21 = atscode_separator()
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
arith_prf.atxt: 5479(line=251, offs=2) -- 5516(line=251, offs=39)
*)
val __tok22 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
arith_prf.atxt: 5519(line=253, offs=1) -- 5605(line=257, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "arith_prf_atxt.txt")

