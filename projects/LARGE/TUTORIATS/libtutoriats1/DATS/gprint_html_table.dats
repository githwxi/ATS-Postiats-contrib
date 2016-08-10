(* ****** ****** *)
//
// HX: 2016-08-09:
// for generating HTML-tables
// 
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)
//
datatype
table_b1 = TABLE_B1 of ()
datatype
table_hb1 = TABLE_HB1 of ()
//
datatype
table_b2 = TABLE_B2 of ()
datatype
table_hb2 = TABLE_HB2 of ()
//
datatype
table_b3 = TABLE_B3 of ()
datatype
table_hb3 = TABLE_HB3 of ()
//
(* ****** ****** *)
//
datatype
table_b1_data
  (a1:t@ype) = TABLE_B1_DATA of (a1)
datatype
table_hb1_data
  (a0: t@ype, a1:t@ype) = TABLE_HB1_DATA of (a0, a1)
//
(* ****** ****** *)
//
datatype
table_b2_data
  (a1:t@ype, a2:t@ype) = TABLE_B2_DATA of (a1, a2)
datatype
table_hb2_data
  (a0:t@ype, a1:t@ype, a2:t@ype) = TABLE_HB2_DATA of (a0, a1, a2)
//
(* ****** ****** *)
//
datatype
table_b3_data
  (a1:t@ype, a2:t@ype, a3:t@ype) = TABLE_B3_DATA of (a1, a2, a3)
datatype
table_hb3_data
  (a0:t@ype, a1:t@ype, a2:t@ype, a3: t@ype) = TABLE_HB3_DATA of (a0, a1, a2, a3)
//
(* ****** ****** *)

extern
fun{}
gprint_table_open(): void
extern
fun{}
gprint_table_close(): void

(* ****** ****** *)

extern
fun{}
gprint_table_b1(table_b1): void
extern
fun{}
gprint_table_b2(table_b2): void
extern
fun{}
gprint_table_b3(table_b3): void

(* ****** ****** *)

extern
fun{}
gprint_table_hb1(table_hb1): void
extern
fun{}
gprint_table_hb2(table_hb2): void
extern
fun{}
gprint_table_hb3(table_hb3): void

(* ****** ****** *)
//
extern
fun{}
gprint_table$tr_0_open((*void*)): void
extern
fun{}
gprint_table$tr_0_data((*void*)): void
extern
fun{}
gprint_table$tr_0_close((*void*)): void
//
extern
fun{}
gprint_table$tr_1_open((*void*)): void
extern
fun{}
gprint_table$tr_1_data((*void*)): void
extern
fun{}
gprint_table$tr_1_close((*void*)): void
//
extern
fun{}
gprint_table$tr_2_open((*void*)): void
extern
fun{}
gprint_table$tr_2_data((*void*)): void
extern
fun{}
gprint_table$tr_2_close((*void*)): void
//
extern
fun{}
gprint_table$tr_3_open((*void*)): void
extern
fun{}
gprint_table$tr_3_data((*void*)): void
extern
fun{}
gprint_table$tr_3_close((*void*)): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_open() =
{
//
val () =
gprintln!
  ("<table width=\"100%\">")
//
} (* gprint_table_open *)
//
implement
{}(*tmp*)
gprint_table_close() =
{
//
val () = gprintln!("</table>")
//
} (* gprint_table_close *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$tr_0_open() = gprintln!("<tr>")
implement
{}(*tmp*)
gprint_table$tr_0_close() = gprintln!("</tr>")
//
implement
{}(*tmp*)
gprint_table$tr_1_open() = gprintln!("<tr>")
implement
{}(*tmp*)
gprint_table$tr_1_close() = gprintln!("</tr>")
//
implement
{}(*tmp*)
gprint_table$tr_2_open() = gprintln!("<tr>")
implement
{}(*tmp*)
gprint_table$tr_2_close() = gprintln!("</tr>")
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_b1(_) =
{
//
val () = gprint_table_open()
//
val () = gprintln!("<thead>")
val () = gprintln!("</thead>")
//
val () = gprintln!("<tbody>")
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprintln!("</tbody>")
//
val () = gprint_table_close()
//
} (* gprint_table_b1 *)
//
implement
{}(*tmp*)
gprint_table_hb1(_) =
{
//
val () = gprint_table_open()
//
val () = gprintln!("<thead>")
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprintln!("</thead>")
//
val () = gprintln!("<tbody>")
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprintln!("</tbody>")
//
val () = gprint_table_close()
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
val () = gprint_table_open()
//
val () = gprintln!("<thead>")
val () = gprintln!("</thead>")
//
val () = gprintln!("<tbody>")
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprintln!("</tbody>")
//
val () = gprint_table_close()
//
} (* gprint_table_b2 *)
//
implement
{}(*tmp*)
gprint_table_hb2(_) =
{
//
val () = gprint_table_open()
//
val () = gprintln!("<thead>")
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprintln!("</thead>")
//
val () = gprintln!("<tbody>")
//
val () = gprint_table$tr_1_open()
val () = gprint_table$tr_1_data()
val () = gprint_table$tr_1_close()
//
val () = gprint_table$tr_2_open()
val () = gprint_table$tr_2_data()
val () = gprint_table$tr_2_close()
//
val () = gprintln!("</tbody>")
//
val () = gprint_table_close()
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
val () = gprint_table_open()
//
val () = gprintln!("<thead>")
val () = gprintln!("</thead>")
//
val () = gprintln!("<tbody>")
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
val () = gprintln!("</tbody>")
//
val () = gprint_table_close()
//
} (* gprint_table_b3 *)
//
implement
{}(*tmp*)
gprint_table_hb3(_) =
{
//
val () = gprint_table_open()
//
val () = gprintln!("<thead>")
//
val () = gprint_table$tr_0_open()
val () = gprint_table$tr_0_data()
val () = gprint_table$tr_0_close()
//
val () = gprintln!("</thead>")
//
val () = gprintln!("<tbody>")
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
val () = gprintln!("</tbody>")
//
val () = gprint_table_close()
//
} (* gprint_table_hb3 *)
//
(* ****** ****** *)
//
extern
fun{a1:t@ype}
gprint_table_b1_data
  (table_b1_data(a1)): void
extern
fun{a0,a1:t@ype}
gprint_table_hb1_data
  (table_hb1_data(a0,a1)): void
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
extern
fun
{a1,a2:t@ype}
gprint_table_b2_data
  (table_b2_data(a1,a2)): void
extern
fun
{a0,a1,a2:t@ype}
gprint_table_hb2_data
  (table_hb2_data(a0,a1,a2)): void
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

extern
fun
{a1
,a2
,a3:t@ype
} gprint_table_b3_data
  (table_b3_data(a1,a2,a3)): void
extern
fun
{a0
,a1
,a2
,a3:t@ype
} gprint_table_hb3_data
  (table_hb3_data(a0,a1,a2,a3)): void
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
datatype
table_row_c1 = TABLE_ROW_C1 of ()
datatype
table_row_c2 = TABLE_ROW_C2 of ()
datatype
table_row_c3 = TABLE_ROW_C3 of ()
//
(* ****** ****** *)
//
datatype
table_row_c1_data
  (a1:t@ype) = TABLE_ROW_C1_DATA of (a1)
datatype
table_row_c2_data
  (a1:t@ype,a2:t@ype) = TABLE_ROW_C2_DATA of (a1, a2)
datatype
table_row_c3_data
  (a1:t@ype,a2:t@ype,a3:t@ype) = TABLE_ROW_C3_DATA of (a1, a2, a3)
//
(* ****** ****** *)
//
extern
fun{}
gprint_table_row_c1 : table_row_c1 -> void
extern
fun{}
gprint_table_row_c2 : table_row_c2 -> void
extern
fun{}
gprint_table_row_c3 : table_row_c3 -> void
//
(* ****** ****** *)
//
extern
fun{
a1:t@ype
} gprint_table_row_c1_data : table_row_c1_data(a1) -> void
extern
fun
{a1
,a2:t@ype
} gprint_table_row_c2_data : table_row_c2_data(a1,a2) -> void
extern
fun
{a1
,a2
,a3:t@ype
} gprint_table_row_c3_data : table_row_c3_data(a1,a2,a3) -> void
//
(* ****** ****** *)
//
extern
fun{}
gprint_table_row$td_1_open(): void
extern
fun{}
gprint_table_row$td_1_data(): void
extern
fun{}
gprint_table_row$td_1_close(): void
//
extern
fun{}
gprint_table_row$td_2_open(): void
extern
fun{}
gprint_table_row$td_2_data(): void
extern
fun{}
gprint_table_row$td_2_close(): void
//
extern
fun{}
gprint_table_row$td_3_open(): void
extern
fun{}
gprint_table_row$td_3_data(): void
extern
fun{}
gprint_table_row$td_3_close(): void
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_row$td_1_open() = gprintln!("<td>")
implement
{}(*tmp*)
gprint_table_row$td_1_close() = gprintln!("</td>")
//
implement
{}(*tmp*)
gprint_table_row$td_2_open() = gprintln!("<td>")
implement
{}(*tmp*)
gprint_table_row$td_2_close() = gprintln!("</td>")
//
implement
{}(*tmp*)
gprint_table_row$td_3_open() = gprintln!("<td>")
implement
{}(*tmp*)
gprint_table_row$td_3_close() = gprintln!("</td>")
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

(* end of [gprint_html_table.dats] *)
