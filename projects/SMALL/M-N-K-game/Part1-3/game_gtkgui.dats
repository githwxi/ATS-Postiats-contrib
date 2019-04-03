(*
** The M-N-K-game
*)

(* ****** ****** *)

#define
ATS_PACKNAME "M_N_K_game"

(* ****** ****** *)
//
#define
GTK_targetloc
"$PATSCONTRIB/contrib/GTK"
#define
GLIB_targetloc
"$PATSCONTRIB/contrib/glib"
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
staload
"{$GLIB}/SATS/glib.sats"
staload
"{$GLIB}/SATS/glib-object.sats"
//
staload "{$GTK}/SATS/gtk.sats"
//
(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

#define NULL the_null_ptr

(* ****** ****** *)

#define XUNIT 36
#define YUNIT 36

(* ****** ****** *)

datatype XY = XY of (int, int)

(* ****** ****** *)

staload WINDOW =
{
//
typedef T = ptr
//
fun
initize
(x: &T? >> T): void = x := the_null_ptr
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

local

fun
label_create
(
  msg: SHR(string)
) : GtkLabel1 = let
//
val res = gtk_label_new (msg)
val ((*void*)) = assertloc (ptrcast (res) > 0)
//
in
  res
end // end of [label_create]

fun
button_create
(
  msg: SHR(string), i: int, j: int
) : GtkButton1 = let
//
val res =
gtk_button_new_with_label(gstring(msg))
val ((*void*)) = assertloc(ptrcast (res) > 0)
//
fun f
(
  button: !GtkButton1, udata: gpointer
) : void = let
//
val+XY(i, j) = $UN.cast{XY}(udata) 
val () = the_X_set (i) and () = the_Y_set (j)
//
in
  gtk_widget_destroy0 ($UN.castvwtp0{GtkWidget0}($WINDOW.get()))
end // end of [f]
//
val id =
g_signal_connect
(
  res, (gsignal)"clicked", G_CALLBACK(f), $UN.cast{gpointer}(XY(i, j))
) (* end of [val] *)
//
in
  res
end // end of [button_create]

fun
row_create
(
  board: board, i: int
) : GtkBox1 = let
//
fun loop
(
  hbox: !GtkBox1 >> _, n: int, j: int
) : void =
  if j < n then let
    val pid = board_get_at (board, i, j)
    val () =
    if pid <= 0
      then let
        val btn = button_create (" ", i, j)
        val () =
        gtk_widget_set_size_request (btn, gint(YUNIT), gint(XUNIT))
        val () = gtk_box_pack_start (hbox, btn, GTRUE, GTRUE, guint(0))
      in
        gtk_widget_show_unref (btn)
      end // end of [then]
      else let
        val msg =
        (
          if pid = 1 then "X" else if pid = 2 then "O" else "#"
        ) : string
        val lab = label_create (msg)
        val () =
        gtk_widget_set_size_request (lab, gint(YUNIT), gint(XUNIT))
        val () = gtk_box_pack_start (hbox, lab, GTRUE, GTRUE, guint(0))
      in
        gtk_widget_show_unref (lab)
      end // end of [then]
    // end of [if]
  in
    loop (hbox, n, j+1)
  end else ((*exit*)) // end of [if]
//
val hbox =
gtk_box_new
(
  GTK_ORIENTATION_HORIZONTAL, gint(0)
) (* end of [val] *)
val () = assertloc (ptrcast(hbox) > 0)
//
val ((*void*)) = loop (hbox, board_ncol(board), 0)
//
in
  hbox
end // end of [row_create]

fun
nrow_create
(
  board: board
) : GtkBox1 = let
//
fun loop
(
  vbox: !GtkBox1 >> _, m: int, i: int
) : void =
(
  if i < m then let
    val hbox = row_create (board, i)
    val () = gtk_box_pack_start (vbox, hbox, GTRUE, GTRUE, guint(0))
    val () = gtk_widget_show_unref (hbox)
  in
    loop (vbox, m, i + 1)
  end else ((*exit*)) // end of [if]
) (* end of [loop] *)
//
val vbox =
gtk_box_new
(
  GTK_ORIENTATION_VERTICAL, gint(0)
) (* end of [val] *)
val () = assertloc (ptrcast(vbox) > 0)
//
val ((*void*)) = loop (vbox, board_nrow(board), 0)
//
in
  vbox
end // end of [nrow_create]

in (* in-of-[local] *)

fun thePanel_create (): GtkBox1 = nrow_create (game_conf_get_board ())

end // end of [local]

(* ****** ****** *)

extern
fun window_create (): GtkWindow1
extern
fun window_handle_destroy (!GtkWindow1): void
extern
fun window_handle_delete_event (!GtkWindow1): void

(* ****** ****** *)

implement
window_create () = let
//
val M = game_conf_get_m ()
val N = game_conf_get_n ()
//
val widget =
  gtk_window_new (GTK_WINDOW_TOPLEVEL)
val p_window = ptrcast(widget)
val () = $WINDOW.set (p_window)
val ((*void*)) = assertloc (p_window > 0)
val ((*void*)) =
gtk_window_set_default_size
  (widget, gint(M*YUNIT), gint(N*XUNIT))
val ((*void*)) =
gtk_window_set_title (widget, gstring"M-N-K-game")
//
in
  widget
end // end of [window_create]

(* ****** ****** *)

implement
window_handle_destroy
  (window) = () where
{
//
val id =
g_signal_connect
(
  window
, (gsignal)"destroy"
, G_CALLBACK(gtk_main_quit), gpointer(NULL)
) (* end of [val] *)
//
} (* end of [window_handle_destroy] *)

(* ****** ****** *)

implement
window_handle_delete_event
  (window) = () where
{
//
fun f (x: GtkWindow1): gboolean =
  let val () = gtk_widget_destroy0 (x) in GTRUE end
//
val id =
g_signal_connect
(
  window
, (gsignal)"delete-event", G_CALLBACK(f), gpointer(NULL)
) (* end of [val] *)
//
} (* end of [window_handle_delete_event] *)

(* ****** ****** *)

implement
interaction_loop
(
) = gtk_main () where
{
//
val window = window_create ()
//
val thePanel = thePanel_create ()
val () = gtk_container_add (window, thePanel)
val () = gtk_container_set_border_width (window, guint(10))
val () = gtk_widget_show_unref (thePanel)
//
val () = window_handle_destroy (window)
val () = window_handle_delete_event (window)
//
val () = gtk_widget_show_unref (window)
//
} (* end of [interaction_loop] *)

(* ****** ****** *)
//
val () = $extfcall (void, "gtk_init", 0(*argc_p*), 0(*argv_p*))
//
(* ****** ****** *)

(* end of [game_gtkgui.dats] *)
