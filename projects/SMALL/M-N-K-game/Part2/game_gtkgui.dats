(*
** The M-N-K-game
*)

(* ****** ****** *)

#define
ATS_PACKNAME "M_N_K_game"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload
"libats/SATS/athread.sats"

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
staload "./game_gtkgui.sats"

(* ****** ****** *)
//
staload _ =
"libats/DATS/deqarray.dats"
//
staload _ = "libats/DATS/athread.dats"
staload _ = "libats/DATS/athread_posix.dats"
//
staload _ =
"{$LIBATSHWXI}/teaching/mythread/DATS/channel.dats"
//
(* ****** ****** *)

#define NULL the_null_ptr

(* ****** ****** *)

#define XUNIT 36
#define YUNIT 36

(* ****** ****** *)

datatype XY = XY of (int, int)

(* ****** ****** *)

staload CH1 =
{
//
typedef T = ptr
//
fun
initize (x: &T? >> T): void = x := the_null_ptr
//
#include "share/atspre_define.hats"
#include "{$LIBATSHWXI}/globals/HATS/globvar.hats"
//
} (* end of [staload] *)

val () = $CH1.set ($UN.cast2ptr($CHAN.channel_create_exn<int> (i2sz(2))))

(* ****** ****** *)

staload CH2 =
{
//
typedef T = ptr
//
fun
initize (x: &T? >> T): void = x := the_null_ptr
//
#include "share/atspre_define.hats"
#include "{$LIBATSHWXI}/globals/HATS/globvar.hats"
//
} (* end of [staload] *)

val () = $CH2.set ($UN.cast2ptr($CHAN.channel_create_exn<int> (i2sz(2))))

(* ****** ****** *)

implement
game_gtkgui_get_chan1 () = $UN.cast{channel(int)}($CH1.get())
implement
game_gtkgui_get_chan2 () = $UN.cast{channel(int)}($CH2.get())

(* ****** ****** *)

implement
game_gtkgui_enter () = let
//
val ch1 = game_gtkgui_get_chan1 ()
//
in
  $CHAN.channel_insert (ch1, 0(*tok*))
end // end of [game_gtkgui_enter]

implement
game_gtkgui_enter_after () = let
  val ch1 = game_gtkgui_get_chan1 ()
  val tok = $CHAN.channel_takeout (ch1)
in
  // nothing
end // end of [game_gtkgui_enter_after]

(* ****** ****** *)

implement
game_gtkgui_return () = let
  val ch2 = game_gtkgui_get_chan2 ()
  val tok = $CHAN.channel_takeout (ch2)
in
  // nothing
end // end of [game_gtkgui_return]

implement
game_gtkgui_return_before () = let
//
val ch2 = game_gtkgui_get_chan2 ()
//
in
  $CHAN.channel_insert (ch2, 0(*tok*))
end // end of [game_gtkgui_return_before]

(* ****** ****** *)

local

val the_buttonlst = ref<List0(ptr)> (list_nil)

in (* in-of-local *)

fun the_buttonlst_add (p: ptr): void =
  !the_buttonlst := list_cons{ptr}(p, !the_buttonlst)

implement
the_buttonlst_reset () = let
//
fun loop
  (xs: List0 (ptr)): void =
(
case+ xs of
| list_nil () => ()
| list_cons (x, xs) => let
    val btn = $UN.castvwtp0{GtkButton1}(x)
    val () = gtk_button_set_label (btn, (gstring)" ")
    val () = gtk_widget_set_sensitive (btn, GTRUE)
    prval () = $UN.cast2void (btn)
  in
    loop (xs)
  end // end of [list_cons]
)
//
in
  loop (!the_buttonlst)
end // end of [the_buttonlst_reset]

end // end of [local]

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
gtk_button_new_with_label ((gstring)msg)
val p_res = ptrcast (res)
val ((*void*)) = assertloc (p_res > 0)
val () = the_buttonlst_add (p_res)
//
fun f
(
  button: !GtkButton1, udata: gpointer
) : void = let
//
val pid = the_pid_get ()
val lab =
(
if pid = 1 then "X" else if pid = 2 then "O" else "#"
) : string
val () = gtk_button_set_label (button, (gstring)lab)
//
val+XY(i, j) = $UN.cast{XY}(udata) 
val () = the_X_set (i) and () = the_Y_set (j)
//
val () = gtk_widget_set_sensitive (button, GFALSE)
//
in
  game_gtkgui_return_before (); game_gtkgui_enter_after ()
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
        gtk_widget_set_size_request (btn, (gint)(YUNIT), (gint)(XUNIT))
        val () = gtk_box_pack_start (hbox, btn, GTRUE, GTRUE, (guint)0)
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
        gtk_widget_set_size_request (lab, (gint)(YUNIT), (gint)(XUNIT))
        val () = gtk_box_pack_start (hbox, lab, GTRUE, GTRUE, (guint)0)
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
  GTK_ORIENTATION_HORIZONTAL, (gint)0
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
    val () = gtk_box_pack_start (vbox, hbox, GTRUE, GTRUE, (guint)0)
    val () = gtk_widget_show_unref (hbox)
  in
    loop (vbox, m, i + 1)
  end else ((*exit*)) // end of [if]
) (* end of [loop] *)
//
val vbox =
gtk_box_new
(
  GTK_ORIENTATION_VERTICAL, (gint)0
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
val ((*void*)) = assertloc (ptrcast(widget) > 0)
val ((*void*)) =
  gtk_window_set_default_size (widget, (gint)(M*YUNIT), (gint)(N*XUNIT))
val ((*void*)) =
  gtk_window_set_title (widget, (gstring)"M-N-K-game")
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
  window, (gsignal)"destroy", G_CALLBACK(gtk_main_quit), (gpointer)NULL
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
  window, (gsignal)"delete-event", G_CALLBACK(f), (gpointer)NULL
) (* end of [val] *)
//
} (* end of [window_handle_delete_event] *)

(* ****** ****** *)

extern
fun
game_gtkgui_loop (env: ptr): void

(* ****** ****** *)

implement
game_gtkgui_loop (env) = let
//
val () =
$extfcall
(
  void
, "gtk_init", 0(*argc_p*), 0(*argv_p*)
) (* end of [val] *)
//
val () = game_gtkgui_enter_after ()
//
val window = window_create ((*void*))
//
val thePanel = thePanel_create ((*void*))
val () = gtk_container_add (window, thePanel)
val () = gtk_container_set_border_width (window, (guint)10)
val () = gtk_widget_show_unref (thePanel)
//
val () = window_handle_destroy (window)
val () = window_handle_delete_event (window)
//
val () = gtk_widget_show_unref (window)
//
in
  gtk_main ()
end (* end of [game_gtkgui_loop] *)

(* ****** ****** *)

local
//
val tid =
athread_create_cloptr_exn
  (llam () => game_gtkgui_loop(the_null_ptr))
//
(*
val () = println! ("The id of the created thread is [", tid, "].")
*)
//
in (*nothing*) end

(* ****** ****** *)

(* end of [game_gtkgui.dats] *)
