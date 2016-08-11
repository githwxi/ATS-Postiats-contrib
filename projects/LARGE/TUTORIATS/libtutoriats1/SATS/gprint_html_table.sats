(* ****** ****** *)
//
// HX: 2016-08-09:
// for generating HTML-tables
// 
(* ****** ****** *)
//
(*
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
*)
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
datatype
table_b4 = TABLE_B4 of ()
datatype
table_hb4 = TABLE_HB4 of ()
//
(* ****** ****** *)
//
datatype
table_bs(int) = {n:nat} TABLE_BS(n) of (int(n))
datatype
table_hbs(int) = {n:nat} TABLE_HBS(n) of (int(n))
//
(* ****** ****** *)
//
datatype
table_b1_data
  (a1:t@ype) = TABLE_B1_DATA of (a1)
datatype
table_hb1_data
  (a0:t@ype, a1:t@ype) = TABLE_HB1_DATA of (a0, a1)
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
  (a0:t@ype, a1:t@ype, a2:t@ype, a3:t@ype) = TABLE_HB3_DATA of (a0, a1, a2, a3)
//
(* ****** ****** *)
//
datatype
table_b4_data
  (a1:t@ype, a2:t@ype, a3:t@ype, a4:t@ype) = TABLE_B4_DATA of (a1, a2, a3, a4)
datatype
table_hb4_data
  (a0:t@ype, a1:t@ype, a2:t@ype, a3:t@ype, a4:t@ype) = TABLE_HB4_DATA of (a0, a1, a2, a3, a4)
//
(* ****** ****** *)
//
datatype
table_bs_data
  (a1:t@ype, int) = {n:nat} TABLE_BS_DATA(a1, n) of list(a1, n)
datatype
table_hbs_data
  (a0:t@ype, a1:t@ype, int) = {n:nat} TABLE_HBS_DATA(a0, a1, n) of (a0, list(a1, n))
//
(* ****** ****** *)
//
fun{}
gprint_table$open(): void
fun{}
gprint_table$close(): void
//
(* ****** ****** *)
//
fun{}
gprint_table$thead_open(): void
fun{}
gprint_table$thead_close(): void
//
fun{}
gprint_table$tbody_open(): void
fun{}
gprint_table$tbody_close(): void
//
(* ****** ****** *)
//
fun{}
gprint_table$tr_open(): void
fun{}
gprint_table$tr_close(): void
//
(* ****** ****** *)
//
fun{}
gprint_table_b1(table_b1): void
fun{}
gprint_table_hb1(table_hb1): void
//
fun{}
gprint_table_b2(table_b2): void
fun{}
gprint_table_hb2(table_hb2): void
//
fun{}
gprint_table_b3(table_b3): void
fun{}
gprint_table_hb3(table_hb3): void
//
fun{}
gprint_table_b4(table_b4): void
fun{}
gprint_table_hb4(table_hb4): void
//
overload gprint with gprint_table_b1
overload gprint with gprint_table_hb1
//
overload gprint with gprint_table_b2
overload gprint with gprint_table_hb2
//
overload gprint with gprint_table_b3
overload gprint with gprint_table_hb3
//
overload gprint with gprint_table_b4
overload gprint with gprint_table_hb4
//
(* ****** ****** *)
//
fun{}
gprint_table$tr_0_open((*void*)): void
fun{}
gprint_table$tr_0_data((*void*)): void
fun{}
gprint_table$tr_0_close((*void*)): void
//
fun{}
gprint_table$tr_1_open((*void*)): void
fun{}
gprint_table$tr_1_data((*void*)): void
fun{}
gprint_table$tr_1_close((*void*)): void
//
fun{}
gprint_table$tr_2_open((*void*)): void
fun{}
gprint_table$tr_2_data((*void*)): void
fun{}
gprint_table$tr_2_close((*void*)): void
//
fun{}
gprint_table$tr_3_open((*void*)): void
fun{}
gprint_table$tr_3_data((*void*)): void
fun{}
gprint_table$tr_3_close((*void*)): void
//
fun{}
gprint_table$tr_4_open((*void*)): void
fun{}
gprint_table$tr_4_data((*void*)): void
fun{}
gprint_table$tr_4_close((*void*)): void
//
(* ****** ****** *)
//
(* ****** ****** *)
//
fun{a1:t@ype}
gprint_table_b1_data
  (table_b1_data(a1)): void
fun{a0,a1:t@ype}
gprint_table_hb1_data
  (table_hb1_data(a0,a1)): void
//
overload gprint with gprint_table_b1_data
overload gprint with gprint_table_hb1_data
//
(* ****** ****** *)
//
fun
{a1,a2:t@ype}
gprint_table_b2_data
  (table_b2_data(a1,a2)): void
fun
{a0,a1,a2:t@ype}
gprint_table_hb2_data
  (table_hb2_data(a0,a1,a2)): void
//
overload gprint with gprint_table_b2_data
overload gprint with gprint_table_hb2_data
//
(* ****** ****** *)
//
fun
{a1
,a2
,a3:t@ype
} gprint_table_b3_data
  (table_b3_data(a1,a2,a3)): void
fun
{a0
,a1
,a2
,a3:t@ype
} gprint_table_hb3_data
  (table_hb3_data(a0,a1,a2,a3)): void
//
overload gprint with gprint_table_b3_data
overload gprint with gprint_table_hb3_data
//
(* ****** ****** *)
//
fun
{a1
,a2
,a3
,a4:t@ype
} gprint_table_b4_data
  (table_b4_data(a1,a2,a3,a4)): void
fun
{a0
,a1
,a2
,a3
,a4:t@ype
} gprint_table_hb4_data
  (table_hb4_data(a0,a1,a2,a3,a4)): void
//
overload gprint with gprint_table_b4_data
overload gprint with gprint_table_hb4_data
//
(* ****** ****** *)
//
datatype
table_row_c1 = TABLE_ROW_C1 of ()
datatype
table_row_c2 = TABLE_ROW_C2 of ()
datatype
table_row_c3 = TABLE_ROW_C3 of ()
datatype
table_row_c4 = TABLE_ROW_C4 of ()
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
datatype
table_row_c4_data
  (a1:t@ype,a2:t@ype,a3:t@ype,a4:t@ype) = TABLE_ROW_C4_DATA of (a1, a2, a3, a4)
//
(* ****** ****** *)
//
fun{}
gprint_table_row$th_open(): void
fun{}
gprint_table_row$th_close(): void
//
fun{}
gprint_table_row$td_open(): void
fun{}
gprint_table_row$td_close(): void
//
(* ****** ****** *)
//
fun{}
gprint_table_row_c1 : table_row_c1 -> void
fun{}
gprint_table_row_c2 : table_row_c2 -> void
fun{}
gprint_table_row_c3 : table_row_c3 -> void
fun{}
gprint_table_row_c4 : table_row_c4 -> void
//
(* ****** ****** *)
//
fun{
a1:t@ype
} gprint_table_row_c1_data : table_row_c1_data(a1) -> void
fun
{a1
,a2:t@ype
} gprint_table_row_c2_data : table_row_c2_data(a1,a2) -> void
fun
{a1
,a2
,a3:t@ype
} gprint_table_row_c3_data : table_row_c3_data(a1,a2,a3) -> void
fun
{a1
,a2
,a3
,a4:t@ype
} gprint_table_row_c4_data : table_row_c4_data(a1,a2,a3,a4) -> void
//
(* ****** ****** *)
//
fun{}
gprint_table_row$td_1_open(): void
fun{}
gprint_table_row$td_1_data(): void
fun{}
gprint_table_row$td_1_close(): void
//
fun{}
gprint_table_row$td_2_open(): void
fun{}
gprint_table_row$td_2_data(): void
fun{}
gprint_table_row$td_2_close(): void
//
fun{}
gprint_table_row$td_3_open(): void
fun{}
gprint_table_row$td_3_data(): void
fun{}
gprint_table_row$td_3_close(): void
//
fun{}
gprint_table_row$td_4_open(): void
fun{}
gprint_table_row$td_4_data(): void
fun{}
gprint_table_row$td_4_close(): void
//
(* ****** ****** *)

(* end of [gprint_html_table.sats] *)
