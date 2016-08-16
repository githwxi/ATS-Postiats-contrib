(* ****** ****** *)
//
// HX: 2016-08-09:
// for generating HTML-tables
// 
(* ****** ****** *)
//
(*
staload
"./../SATS/gprint_html_table.sats"
*)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$open() =
{
//
val () =
gprintln!
(
"<table width=\"100%\">"
) (* gprintln! *)
//
} (* gprint_table$open *)
//
implement
{}(*tmp*)
gprint_table$close() =
{
//
val () = gprintln!("</table>")
//
} (* gprint_table$close *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$thead_open
  ((*void*)) = gprintln!("<thead>")
implement
{}(*tmp*)
gprint_table$thead_close
  ((*void*)) = gprintln!("</thead>")
//
implement
{}(*tmp*)
gprint_table$tbody_open
  ((*void*)) = gprintln!("<tbody>")
implement
{}(*tmp*)
gprint_table$tbody_close
  ((*void*)) = gprintln!("</tbody>")
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$tr_0_open
  () = gprint_table$tr_open()
implement
{}(*tmp*)
gprint_table$tr_0_close
  () = gprint_table$tr_close()
//
implement
{}(*tmp*)
gprint_table$tr_1_open
  () = gprint_table$tr_open()
implement
{}(*tmp*)
gprint_table$tr_1_close
  () = gprint_table$tr_close()
//
implement
{}(*tmp*)
gprint_table$tr_2_open
  () = gprint_table$tr_open()
implement
{}(*tmp*)
gprint_table$tr_2_close
  () = gprint_table$tr_close()
//
implement
{}(*tmp*)
gprint_table$tr_3_open
  () = gprint_table$tr_open()
implement
{}(*tmp*)
gprint_table$tr_3_close
  () = gprint_table$tr_close()
//
implement
{}(*tmp*)
gprint_table$tr_4_open
  () = gprint_table$tr_open()
implement
{}(*tmp*)
gprint_table$tr_4_close
  () = gprint_table$tr_close()
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_b1(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_b1 *)
//
implement
{}(*tmp*)
gprint_table_hb1(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_hb1 *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_b2(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_b2 *)
//
implement
{}(*tmp*)
gprint_table_hb2(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_hb2 *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_b3(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprint_table$tr_3_open()
val () = gprint_table$tr_3_data()
val () = gprint_table$tr_3_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_b3 *)
//
implement
{}(*tmp*)
gprint_table_hb3(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprint_table$tr_3_open()
val () = gprint_table$tr_3_data()
val () = gprint_table$tr_3_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_hb3 *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_b4(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprint_table$tr_3_open()
val () = gprint_table$tr_3_data()
val () = gprint_table$tr_3_close()
//
val () = gprint_table$tr_4_open()
val () = gprint_table$tr_4_data()
val () = gprint_table$tr_4_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_b4 *)
//
implement
{}(*tmp*)
gprint_table_hb4(_) =
{
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprint_table$tr_3_open()
val () = gprint_table$tr_3_data()
val () = gprint_table$tr_3_close()
//
val () = gprint_table$tr_4_open()
val () = gprint_table$tr_4_data()
val () = gprint_table$tr_4_close()
//
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
} (* gprint_table_hb4 *)
//
(* ****** ****** *)
//
implement
{a1}
gprint_table_b1_data
  (t0) = let
//
val+
TABLE_B1_DATA(x1) = t0
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
in
//
  gprint_table_b1(TABLE_B1())
//
end // end of [gprint_table_b1_data]
//
implement
{a0,a1}
gprint_table_hb1_data
  (t0) = let
//
val+
TABLE_HB1_DATA(x0,x1) = t0
//
implement
gprint_table$tr_0_data<>() =
{
val () = gprint_val<a0>(x0)
} (* gprint_table$tr_0_data *)
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
in
//
  gprint_table_hb1(TABLE_HB1())
//
end // end of [gprint_table_hb1_data]
//
(* ****** ****** *)
//
implement
{a1,a2}
gprint_table_b2_data
  (t0) = let
//
val+
TABLE_B2_DATA(x1, x2) = t0
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
implement
gprint_table$tr_2_data<>() =
{
val () = gprint_val<a2>(x2)
} (* gprint_table$tr_2_data *)
//
in
//
  gprint_table_b2(TABLE_B2())
//
end // end of [gprint_table_b2_data]
//
implement
{a0,a1,a2}
gprint_table_hb2_data
  (t0) = let
//
val+
TABLE_HB2_DATA
  (x0, x1, x2) = t0
//
implement
gprint_table$tr_0_data<>() =
{
val () = gprint_val<a0>(x0)
} (* gprint_table$tr_0_data *)
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
implement
gprint_table$tr_2_data<>() =
{
val () = gprint_val<a2>(x2)
} (* gprint_table$tr_2_data *)
//
in
//
  gprint_table_hb2(TABLE_HB2())
//
end // end of [gprint_table_hb2_data]
//
(* ****** ****** *)
//
implement
{a1,a2,a3}
gprint_table_b3_data
  (t0) = let
//
val+
TABLE_B3_DATA
  (x1, x2, x3) = t0
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
implement
gprint_table$tr_2_data<>() =
{
val () = gprint_val<a2>(x2)
} (* gprint_table$tr_2_data *)
//
implement
gprint_table$tr_3_data<>() =
{
val () = gprint_val<a3>(x3)
} (* gprint_table$tr_3_data *)
//
in
//
  gprint_table_b3(TABLE_B3())
//
end // end of [gprint_table_b3_data]
//
implement
{a0,a1,a2,a3}
gprint_table_hb3_data
  (t0) = let
//
val+
TABLE_HB3_DATA
  (x0, x1, x2, x3) = t0
//
implement
gprint_table$tr_0_data<>() =
{
val () = gprint_val<a0>(x0)
} (* gprint_table$tr_0_data *)
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
implement
gprint_table$tr_2_data<>() =
{
val () = gprint_val<a2>(x2)
} (* gprint_table$tr_2_data *)
//
implement
gprint_table$tr_3_data<>() =
{
val () = gprint_val<a3>(x3)
} (* gprint_table$tr_3_data *)
//
in
//
  gprint_table_hb3(TABLE_HB3())
//
end // end of [gprint_table_hb3_data]
//
(* ****** ****** *)
//
implement
{a1,a2,a3,a4}
gprint_table_b4_data
  (t0) = let
//
val+
TABLE_B4_DATA
  (x1, x2, x3, x4) = t0
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
implement
gprint_table$tr_2_data<>() =
{
val () = gprint_val<a2>(x2)
} (* gprint_table$tr_2_data *)
//
implement
gprint_table$tr_3_data<>() =
{
val () = gprint_val<a3>(x3)
} (* gprint_table$tr_3_data *)
//
implement
gprint_table$tr_4_data<>() =
{
val () = gprint_val<a4>(x4)
} (* gprint_table$tr_4_data *)
//
in
//
  gprint_table_b4(TABLE_B4())
//
end // end of [gprint_table_b4_data]
//
implement
{a0,a1,a2,a3,a4}
gprint_table_hb4_data
  (t0) = let
//
val+
TABLE_HB4_DATA
  (x0, x1, x2, x3, x4) = t0
//
implement
gprint_table$tr_0_data<>() =
{
val () = gprint_val<a0>(x0)
} (* gprint_table$tr_0_data *)
//
implement
gprint_table$tr_1_data<>() =
{
val () = gprint_val<a1>(x1)
} (* gprint_table$tr_1_data *)
//
implement
gprint_table$tr_2_data<>() =
{
val () = gprint_val<a2>(x2)
} (* gprint_table$tr_2_data *)
//
implement
gprint_table$tr_3_data<>() =
{
val () = gprint_val<a3>(x3)
} (* gprint_table$tr_3_data *)
//
implement
gprint_table$tr_4_data<>() =
{
val () = gprint_val<a4>(x4)
} (* gprint_table$tr_4_data *)
//
in
//
  gprint_table_hb4(TABLE_HB4())
//
end // end of [gprint_table_hb4_data]
//
(* ****** ****** *)
//
implement
(a1)
gprint_val<
  table_b1_data(a1)
> = gprint_table_b1_data<a1>
implement
(a0,a1)
gprint_val<
  table_hb1_data(a0,a1)
> = gprint_table_hb1_data<a0,a1>
//
(* ****** ****** *)
//
implement
(a1,a2)
gprint_val<
  table_b2_data(a1,a2)
> = gprint_table_b2_data<a1,a2>
implement
(a0,a1,a2)
gprint_val<
  table_hb2_data(a0,a1,a2)
> = gprint_table_hb2_data<a0,a1,a2>
//
(* ****** ****** *)
//
implement
(a1,a2,a3)
gprint_val<
  table_b3_data(a1,a2,a3)
> = gprint_table_b3_data<a1,a2,a3>
implement
(a0,a1,a2,a3)
gprint_val<
  table_hb3_data(a0,a1,a2,a3)
> = gprint_table_hb3_data<a0,a1,a2,a3>
//
(* ****** ****** *)
//
implement
(a1,a2,a3,a4)
gprint_val<
  table_b4_data(a1,a2,a3,a4)
> = gprint_table_b4_data<a1,a2,a3,a4>
implement
(a0,a1,a2,a3,a4)
gprint_val<
  table_hb4_data(a0,a1,a2,a3,a4)
> = gprint_table_hb4_data<a0,a1,a2,a3,a4>
//
(* ****** ****** *)

implement
{a1}
gprint_table_bs_data
  (t0) = let
//
val+
TABLE_BS_DATA(xs) = t0
//
fun
auxlst
(
  xs: List0(a1)
) : void =
(
case+ xs of
| list_nil() => ()
| list_cons(x, xs) =>
    auxlst(xs) where
  {
    val () = gprint_table$tr_open()
    val () = gprint_val<a1>(x)
    val () = gprint_table$tr_close()
  } (* end of [list_cons] *)
)
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
val () = auxlst(xs)
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
in
  // nothing
end // end of [gprint_table_bs_data]

(* ****** ****** *)
//
implement
{a0,a1}
gprint_table_hbs_data
  (t0) = let
//
val+
TABLE_HBS_DATA(x0, xs) = t0
//
fun
auxlst
(
  xs: List0(a1)
) : void =
(
case+ xs of
| list_nil() => ()
| list_cons(x, xs) =>
    auxlst(xs) where
  {
    val () = gprint_table$tr_1_open()
    val () = gprint_val<a1>(x)
    val () = gprint_table$tr_1_close()
  } (* end of [list_cons] *)
)
//
val () = gprint_table$open()
//
val () = gprint_table$thead_open()
//
val () = gprint_table$tr_0_open()
val () = gprint_val<a0>(x0)
val () = gprint_table$tr_0_close()
//
val () = gprint_table$thead_close()
//
val () = gprint_table$tbody_open()
val () = auxlst(xs)
val () = gprint_table$tbody_close()
//
val () = gprint_table$close((*void*))
//
in
  // nothing
end // end of [gprint_table_hbs_data]

(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$tr_open
  ((*void*)) = gprintln!("<tr>")
implement
{}(*tmp*)
gprint_table$tr_close
  ((*void*)) = gprintln!("</tr>")
//
implement
{}(*tmp*)
gprint_table_row$th_open
  ((*void*)) = gprintln!("<th>")
implement
{}(*tmp*)
gprint_table_row$th_close
  ((*void*)) = gprintln!("</th>")
//
implement
{}(*tmp*)
gprint_table_row$td_open
  ((*void*)) = gprintln!("<td>")
implement
{}(*tmp*)
gprint_table_row$td_close
  ((*void*)) = gprintln!("</td>")
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_row$td_1_open
  () = gprint_table_row$td_open()
implement
{}(*tmp*)
gprint_table_row$td_1_close
  () = gprint_table_row$td_close()
//
implement
{}(*tmp*)
gprint_table_row$td_2_open
  () = gprint_table_row$td_open()
implement
{}(*tmp*)
gprint_table_row$td_2_close
  () = gprint_table_row$td_close()
//
implement
{}(*tmp*)
gprint_table_row$td_3_open
  () = gprint_table_row$td_open()
implement
{}(*tmp*)
gprint_table_row$td_3_close
  () = gprint_table_row$td_close()
//
implement
{}(*tmp*)
gprint_table_row$td_4_open
  () = gprint_table_row$td_open()
implement
{}(*tmp*)
gprint_table_row$td_4_close
  () = gprint_table_row$td_close()
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_row_c1(_) =
{
//
val () = gprint_table_row$td_1_open()
val () = gprint_table_row$td_1_data()
val () = gprint_table_row$td_1_close()
//
} (* end of [gprint_table_row_c1] *)
//
implement
{}(*tmp*)
gprint_table_row_c2(_) =
{
//
val () = gprint_table_row$td_1_open()
val () = gprint_table_row$td_1_data()
val () = gprint_table_row$td_1_close()
//
val () = gprint_table_row$td_2_open()
val () = gprint_table_row$td_2_data()
val () = gprint_table_row$td_2_close()
//
} (* end of [gprint_table_row_c2] *)
//
implement
{}(*tmp*)
gprint_table_row_c3(_) =
{
//
val () = gprint_table_row$td_1_open()
val () = gprint_table_row$td_1_data()
val () = gprint_table_row$td_1_close()
//
val () = gprint_table_row$td_2_open()
val () = gprint_table_row$td_2_data()
val () = gprint_table_row$td_2_close()
//
val () = gprint_table_row$td_3_open()
val () = gprint_table_row$td_3_data()
val () = gprint_table_row$td_3_close()
//
} (* end of [gprint_table_td1] *)
//
implement
{}(*tmp*)
gprint_table_row_c4(_) =
{
//
val () = gprint_table_row$td_1_open()
val () = gprint_table_row$td_1_data()
val () = gprint_table_row$td_1_close()
//
val () = gprint_table_row$td_2_open()
val () = gprint_table_row$td_2_data()
val () = gprint_table_row$td_2_close()
//
val () = gprint_table_row$td_3_open()
val () = gprint_table_row$td_3_data()
val () = gprint_table_row$td_3_close()
//
val () = gprint_table_row$td_4_open()
val () = gprint_table_row$td_4_data()
val () = gprint_table_row$td_4_close()
//
} (* end of [gprint_table_td1] *)
//
(* ****** ****** *)
//
implement
{a1}
gprint_table_row_c1_data
  (r0) = let
//
val+
TABLE_ROW_C1_DATA(x1) = r0
//
implement
gprint_table_row$td_1_data<>() = gprint_val<a1>(x1)
//
in
  gprint_table_row_c1(TABLE_ROW_C1())
end (* end of [gprint_table_row_c1_data] *)
//
(* ****** ****** *)
//
implement
{a1,a2}
gprint_table_row_c2_data
  (r0) = let
//
val+
TABLE_ROW_C2_DATA(x1, x2) = r0
//
implement
gprint_table_row$td_1_data<>() = gprint_val<a1>(x1)
implement
gprint_table_row$td_2_data<>() = gprint_val<a2>(x2)
//
in
  gprint_table_row_c2(TABLE_ROW_C2())
end (* end of [gprint_table_row_c2_data] *)
//
(* ****** ****** *)
//
implement
{a1,a2,a3}
gprint_table_row_c3_data
  (r0) = let
//
val+
TABLE_ROW_C3_DATA(x1, x2, x3) = r0
//
implement
gprint_table_row$td_1_data<>() = gprint_val<a1>(x1)
implement
gprint_table_row$td_2_data<>() = gprint_val<a2>(x2)
implement
gprint_table_row$td_3_data<>() = gprint_val<a3>(x3)
//
in
  gprint_table_row_c3(TABLE_ROW_C3())
end (* end of [gprint_table_row_c3_data] *)
//
(* ****** ****** *)
//
implement
{a1,a2,a3,a4}
gprint_table_row_c4_data
  (r0) = let
//
val+
TABLE_ROW_C4_DATA(x1, x2, x3, x4) = r0
//
implement
gprint_table_row$td_1_data<>() = gprint_val<a1>(x1)
implement
gprint_table_row$td_2_data<>() = gprint_val<a2>(x2)
implement
gprint_table_row$td_3_data<>() = gprint_val<a3>(x3)
implement
gprint_table_row$td_4_data<>() = gprint_val<a4>(x4)
//
in
  gprint_table_row_c4(TABLE_ROW_C4())
end (* end of [gprint_table_row_c4_data] *)
//
(* ****** ****** *)
//
implement
(a1)
gprint_val<
  table_row_c1_data(a1)
> = gprint_table_row_c1_data<a1>
implement
(a1,a2)
gprint_val<
  table_row_c2_data(a1,a2)
> = gprint_table_row_c2_data<a1,a2>
implement
(a1,a2,a3)
gprint_val<
  table_row_c3_data(a1,a2,a3)
> = gprint_table_row_c3_data<a1,a2,a3>
implement
(a1,a2,a3,a4)
gprint_val<
  table_row_c4_data(a1,a2,a3,a4)
> = gprint_table_row_c4_data<a1,a2,a3,a4>
//
(* ****** ****** *)

(* end of [gprint_html_table.hats] *)
