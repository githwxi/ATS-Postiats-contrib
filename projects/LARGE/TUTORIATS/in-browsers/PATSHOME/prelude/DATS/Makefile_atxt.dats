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
Makefile.atxt: 970(line=65, offs=2) -- 991(line=65, offs=23)
*)
val __tok1 = make_entry("integer")
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
Makefile.atxt: 993(line=66, offs=2) -- 1014(line=66, offs=23)
*)
val __tok2 = make_entry("pointer")
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
Makefile.atxt: 1017(line=68, offs=2) -- 1040(line=68, offs=25)
*)
val __tok3 = make_entry("arith_prf")
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
Makefile.atxt: 1042(line=69, offs=2) -- 1068(line=69, offs=28)
*)
val __tok4 = make_entry("integer_long")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
Makefile.atxt: 1070(line=70, offs=2) -- 1096(line=70, offs=28)
*)
val __tok5 = make_entry("integer_size")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
Makefile.atxt: 1098(line=71, offs=2) -- 1125(line=71, offs=29)
*)
val __tok6 = make_entry("integer_short")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
Makefile.atxt: 1128(line=73, offs=2) -- 1146(line=73, offs=20)
*)
val __tok7 = make_entry("bool")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
Makefile.atxt: 1148(line=74, offs=2) -- 1166(line=74, offs=20)
*)
val __tok8 = make_entry("char")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
Makefile.atxt: 1168(line=75, offs=2) -- 1187(line=75, offs=21)
*)
val __tok9 = make_entry("float")
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
Makefile.atxt: 1189(line=76, offs=2) -- 1209(line=76, offs=22)
*)
val __tok10 = make_entry("string")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
Makefile.atxt: 1211(line=77, offs=2) -- 1231(line=77, offs=22)
*)
val __tok11 = make_entry("strptr")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
Makefile.atxt: 1233(line=78, offs=2) -- 1258(line=78, offs=27)
*)
val __tok12 = make_entry("integer_ptr")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
Makefile.atxt: 1260(line=79, offs=2) -- 1287(line=79, offs=29)
*)
val __tok13 = make_entry("integer_fixed")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
Makefile.atxt: 1290(line=81, offs=2) -- 1309(line=81, offs=21)
*)
val __tok14 = make_entry("tuple")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
Makefile.atxt: 1312(line=83, offs=2) -- 1332(line=83, offs=22)
*)
val __tok15 = make_entry("memory")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
Makefile.atxt: 1335(line=85, offs=2) -- 1358(line=85, offs=25)
*)
val __tok16 = make_entry("reference")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
Makefile.atxt: 1361(line=87, offs=2) -- 1381(line=87, offs=22)
*)
val __tok17 = make_entry("unsafe")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
Makefile.atxt: 1383(line=88, offs=2) -- 1405(line=88, offs=24)
*)
val __tok18 = make_entry("checkast")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
Makefile.atxt: 1408(line=90, offs=2) -- 1429(line=90, offs=23)
*)
val __tok19 = make_entry("filebas")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
Makefile.atxt: 1431(line=91, offs=2) -- 1456(line=91, offs=27)
*)
val __tok20 = make_entry("filebas_prf")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
Makefile.atxt: 1458(line=92, offs=2) -- 1480(line=92, offs=24)
*)
val __tok21 = make_entry("intrange")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
Makefile.atxt: 1483(line=94, offs=2) -- 1503(line=94, offs=22)
*)
val __tok22 = make_entry("basics")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
Makefile.atxt: 1506(line=96, offs=2) -- 1526(line=96, offs=22)
*)
val __tok23 = make_entry("gorder")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
Makefile.atxt: 1528(line=97, offs=2) -- 1549(line=97, offs=23)
*)
val __tok24 = make_entry("gnumber")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
Makefile.atxt: 1551(line=98, offs=2) -- 1572(line=98, offs=23)
*)
val __tok25 = make_entry("grandom")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
Makefile.atxt: 1575(line=100, offs=2) -- 1593(line=100, offs=20)
*)
val __tok26 = make_entry("list")
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
Makefile.atxt: 1595(line=101, offs=2) -- 1616(line=101, offs=23)
*)
val __tok27 = make_entry("list_vt")
val () = theAtextMap_insert_str ("__tok27", __tok27)

(*
Makefile.atxt: 1619(line=103, offs=2) -- 1639(line=103, offs=22)
*)
val __tok28 = make_entry("option")
val () = theAtextMap_insert_str ("__tok28", __tok28)

(*
Makefile.atxt: 1641(line=104, offs=2) -- 1664(line=104, offs=25)
*)
val __tok29 = make_entry("option_vt")
val () = theAtextMap_insert_str ("__tok29", __tok29)

(*
Makefile.atxt: 1667(line=106, offs=2) -- 1687(line=106, offs=22)
*)
val __tok30 = make_entry("stream")
val () = theAtextMap_insert_str ("__tok30", __tok30)

(*
Makefile.atxt: 1689(line=107, offs=2) -- 1712(line=107, offs=25)
*)
val __tok31 = make_entry("stream_vt")
val () = theAtextMap_insert_str ("__tok31", __tok31)

(*
Makefile.atxt: 1715(line=109, offs=2) -- 1734(line=109, offs=21)
*)
val __tok32 = make_entry("array")
val () = theAtextMap_insert_str ("__tok32", __tok32)

(*
Makefile.atxt: 1736(line=110, offs=2) -- 1759(line=110, offs=25)
*)
val __tok33 = make_entry("array_prf")
val () = theAtextMap_insert_str ("__tok33", __tok33)

(*
Makefile.atxt: 1761(line=111, offs=2) -- 1783(line=111, offs=24)
*)
val __tok34 = make_entry("arrayptr")
val () = theAtextMap_insert_str ("__tok34", __tok34)

(*
Makefile.atxt: 1785(line=112, offs=2) -- 1807(line=112, offs=24)
*)
val __tok35 = make_entry("arrayref")
val () = theAtextMap_insert_str ("__tok35", __tok35)

(*
Makefile.atxt: 1810(line=114, offs=2) -- 1876(line=116, offs=3)
*)
val __tok36 = comment("\
for pointer arrays terminated with the null pointer\
")
val () = theAtextMap_insert_str ("__tok36", __tok36)

(*
Makefile.atxt: 1878(line=117, offs=2) -- 1898(line=117, offs=22)
*)
val __tok37 = make_entry("parray")
val () = theAtextMap_insert_str ("__tok37", __tok37)

(*
Makefile.atxt: 1901(line=119, offs=2) -- 1921(line=119, offs=22)
*)
val __tok38 = make_entry("matrix")
val () = theAtextMap_insert_str ("__tok38", __tok38)

(*
Makefile.atxt: 1923(line=120, offs=2) -- 1946(line=120, offs=25)
*)
val __tok39 = make_entry("matrixptr")
val () = theAtextMap_insert_str ("__tok39", __tok39)

(*
Makefile.atxt: 1948(line=121, offs=2) -- 1971(line=121, offs=25)
*)
val __tok40 = make_entry("matrixref")
val () = theAtextMap_insert_str ("__tok40", __tok40)

(*
Makefile.atxt: 1974(line=123, offs=2) -- 1994(line=123, offs=22)
*)
val __tok41 = make_entry("gprint")
val () = theAtextMap_insert_str ("__tok41", __tok41)

(*
Makefile.atxt: 1996(line=124, offs=2) -- 2018(line=124, offs=24)
*)
val __tok42 = make_entry("tostring")
val () = theAtextMap_insert_str ("__tok42", __tok42)

(*
Makefile.atxt: 2212(line=141, offs=1) -- 2295(line=144, offs=3)
*)

implement
main (argc, argv) = fprint_filsub (stdout_ref, "Makefile_atxt.txt")

