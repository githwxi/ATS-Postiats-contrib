(*
** source: gtkbutton.h
*)

(* ****** ****** *)
//
fun gtk_button_new
  ((*void*)): gobjref0(GtkButton) = "mac#%"
//
fun gtk_button_new_with_label
  (label: gstring): gobjref0(GtkButton) = "mac#%"
//
fun gtk_button_new_with_mnemonic
  (label: gstring): gobjref0(GtkButton) = "mac#%"
//
fun gtk_button_new_from_stock
  (stockid: gstring): gobjref0(GtkButton) = "mac#%"
//
(* ****** ****** *)
//
// HX-2010-04-26: the label string belongs to the widget!
// HX-2010-05-07: the label string can be NULL (if it is not set)
//
fun
gtk_button_get_label
  {l:agz} (button: !GtkButton (l))
: [l2:agez] (
  minus (GtkButton (l), gstrptr (l2)) | gstrptr (l2)
) = "mac#%" // endfun

(* ****** ****** *)

fun
gtk_button_set_label
  (button: !GtkButton1, label: gstring): void = "mac#%"
// end of [gtk_button_set_label]

(* ****** ****** *)

fun
gtk_button_enter (button: !GtkButton1): void = "mac#%"
fun
gtk_button_leave (button: !GtkButton1): void = "mac#%"
fun
gtk_button_pressed (button: !GtkButton1): void = "mac#%"
fun
gtk_button_released (button: !GtkButton1): void = "mac#%"
fun
gtk_button_clicked (button: !GtkButton1): void = "mac#%"

(* ****** ****** *)

(* end of [gtkbutton.sats] *)
