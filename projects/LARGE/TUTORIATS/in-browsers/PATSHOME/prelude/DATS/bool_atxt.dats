(*
bool.atxt: 1(line=1, offs=1) -- 252(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"bool.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
bool.atxt: 257(line=10, offs=2) -- 273(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
bool.atxt: 275(line=11, offs=2) -- 298(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
bool.atxt: 301(line=13, offs=2) -- 320(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
bool.atxt: 404(line=18, offs=25) -- 415(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
bool.atxt: 421(line=21, offs=2) -- 440(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
bool.atxt: 443(line=23, offs=2) -- 471(line=23, offs=30)
*)
val __tok6 = atscode_author("Hongwei Xi")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
bool.atxt: 473(line=24, offs=2) -- 521(line=24, offs=50)
*)
val __tok7 = atscode_authoremail("hwxi AT cs DOT bu DOT edu")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
bool.atxt: 523(line=25, offs=2) -- 559(line=25, offs=38)
*)
val __tok8 = atscode_start_time("Feburary, 2012")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
bool.atxt: 562(line=27, offs=2) -- 581(line=27, offs=21)
*)
val __tok9 = atscode_separator()
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
bool.atxt: 641(line=31, offs=2) -- 660(line=31, offs=21)
*)
val __tok10 = atscode_separator()
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
bool.atxt: 786(line=43, offs=2) -- 805(line=43, offs=21)
*)
val __tok11 = atscode_separator()
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
bool.atxt: 985(line=57, offs=2) -- 1004(line=57, offs=21)
*)
val __tok12 = atscode_separator()
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
bool.atxt: 1007(line=59, offs=2) -- 1044(line=59, offs=39)
*)
val __tok13 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
bool.atxt: 1047(line=61, offs=1) -- 1128(line=65, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "bool_atxt.txt")

