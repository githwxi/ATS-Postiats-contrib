(*
memory.atxt: 1(line=1, offs=1) -- 254(line=8, offs=3)
*)

#define ATSCODEFORMAT "txt"
#if (ATSCODEFORMAT == "txt")
#include "utils/atsdoc/HATS/postiatsatxt.hats"
#endif // end of [ATSCCODEFORMAT]
val _thisfilename = atext_strcst"memory.dats"
val () = theAtextMap_insert_str ("thisfilename", _thisfilename)

(*
memory.atxt: 259(line=10, offs=2) -- 275(line=10, offs=18)
*)
val __tok1 = atscode_banner()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
memory.atxt: 277(line=11, offs=2) -- 300(line=11, offs=25)
*)
val __tok2 = atscode_copyright_GPL()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
memory.atxt: 303(line=13, offs=2) -- 322(line=13, offs=21)
*)
val __tok3 = atscode_separator()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
memory.atxt: 408(line=18, offs=25) -- 419(line=18, offs=36)
*)
val __tok4 = timestamp()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
memory.atxt: 425(line=21, offs=2) -- 444(line=21, offs=21)
*)
val __tok5 = atscode_separator()
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
memory.atxt: 488(line=26, offs=2) -- 507(line=26, offs=21)
*)
val __tok6 = atscode_separator()
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
memory.atxt: 684(line=39, offs=2) -- 703(line=39, offs=21)
*)
val __tok7 = atscode_separator()
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
memory.atxt: 916(line=54, offs=2) -- 935(line=54, offs=21)
*)
val __tok8 = atscode_separator()
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
memory.atxt: 938(line=56, offs=2) -- 975(line=56, offs=39)
*)
val __tok9 = atscode_eof_strsub("#thisfilename$")
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
memory.atxt: 978(line=58, offs=1) -- 1061(line=62, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "memory_atxt.txt")

