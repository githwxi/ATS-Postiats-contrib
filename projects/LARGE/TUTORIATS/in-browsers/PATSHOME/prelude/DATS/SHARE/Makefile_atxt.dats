(*
Makefile.atxt: 1(line=1, offs=1) -- 176(line=11, offs=3)
*)

//
staload
STDIO = "libc/SATS/stdio.sats"
staload TIME = "libc/SATS/time.sats"
//
dynload "libatsdoc/dynloadall.dats"
//
staload "libatsdoc/SATS/libatsdoc_atext.sats"
//

(*
Makefile.atxt: 178(line=12, offs=1) -- 753(line=39, offs=3)
*)


fun comment
  (x: string): atext = atext_nil ()
// end of [comment]

fun make_entry
  (nm: string): atext = let
//
val ent = sprintf
("\
all:: %s.dats\n\
%s.dats: %s_atxt.exe ; ./$< > $@\n\
%s_atxt.exe: %s_atxt.dats\n\
	$(ATSCC) $(GCFLAG) -o $@ %s_atxt.dats -latsdoc\n\
%s_atxt.dats: %s.atxt\n\
	$(ATSDOC) --outcode $@ -i %s.atxt > %s_atxt.txt\n\
clean:: ; $(RMF) %s_atxt.exe\n\
cleanall:: ; $(RMF) %s.dats\n\
", @(nm, nm, nm, nm, nm, nm, nm, nm, nm, nm, nm, nm)
) // end of [val]
//
val ent = string_of_strptr (ent)
in
  atext_strcst (ent)
end // end of [make_entry]


(*
Makefile.atxt: 970(line=65, offs=2) -- 994(line=65, offs=26)
*)
val __tok1 = make_entry("gorder_int")
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
Makefile.atxt: 996(line=66, offs=2) -- 1021(line=66, offs=27)
*)
val __tok2 = make_entry("gorder_uint")
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
Makefile.atxt: 1023(line=67, offs=2) -- 1048(line=67, offs=27)
*)
val __tok3 = make_entry("gorder_bool")
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
Makefile.atxt: 1050(line=68, offs=2) -- 1075(line=68, offs=27)
*)
val __tok4 = make_entry("gorder_char")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
Makefile.atxt: 1077(line=69, offs=2) -- 1103(line=69, offs=28)
*)
val __tok5 = make_entry("gorder_float")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
Makefile.atxt: 1105(line=70, offs=2) -- 1132(line=70, offs=29)
*)
val __tok6 = make_entry("gorder_string")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
Makefile.atxt: 1143(line=74, offs=2) -- 1168(line=74, offs=27)
*)
val __tok7 = make_entry("gnumber_int")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
Makefile.atxt: 1170(line=75, offs=2) -- 1196(line=75, offs=28)
*)
val __tok8 = make_entry("gnumber_uint")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
Makefile.atxt: 1198(line=76, offs=2) -- 1225(line=76, offs=29)
*)
val __tok9 = make_entry("gnumber_float")
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
Makefile.atxt: 1236(line=80, offs=2) -- 1267(line=80, offs=33)
*)
val __tok10 = make_entry("list_vt_mergesort")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
Makefile.atxt: 1269(line=81, offs=2) -- 1300(line=81, offs=33)
*)
val __tok11 = make_entry("list_vt_quicksort")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
Makefile.atxt: 1311(line=85, offs=2) -- 1338(line=85, offs=29)
*)
val __tok12 = make_entry("array_bsearch")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
Makefile.atxt: 1340(line=86, offs=2) -- 1369(line=86, offs=31)
*)
val __tok13 = make_entry("array_quicksort")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
Makefile.atxt: 1563(line=103, offs=1) -- 1648(line=107, offs=3)
*)

implement
main (argc, argv) =
  fprint_filsub (stdout_ref, "Makefile_atxt.txt")

