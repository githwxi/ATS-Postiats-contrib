(*
** libatscc2py_pygame
*)

(* ****** ****** *)
//
// HX-2016-05:
// prefix for external names
//
(* ****** ****** *)
//
staload "./../../basics_py.sats"
//
(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "ats2py_pygame_"

(* ****** ****** *)

typedef int2 = $tup(int, int)
typedef int3 = $tup(int, int, int)

(* ****** ****** *)

abstype Rect
abstype Color

(* ****** ****** *)
//
abstype Event
//
typedef Eventlist = PYlist(Event)
//
abstype Event_type
//
(* ****** ****** *)

abstype Surface

(* ****** ****** *)
//
fun
pygame_init(): void = "mac#%"
//
fun
pygame_init_ret
(
// argumentless
) : $tup(int(*npass*), int(*nfail*)) = "mac#%"
//
(* ****** ****** *)

fun pygame_quit(): void = "mac#%"

(* ****** ****** *)
//
fun
rect_make_int4
(
  t:int, l:int, b:int, r:int
) : Rect = "mac#%" 
fun
rect_make_int22
(
  topleft: int2, botright: int2
) : Rect = "mac#%" 
//
overload Rect with rect_make_int22
//
(* ****** ****** *)
//
fun
rect_copy
  (r0: Rect): Rect = "mac#%"
//
overload .copy with rect_copy
//
(* ****** ****** *)
//
fun
rect_fit(Rect, Rect): Rect = "mac#%"
//
overload .fit with rect_fit
//
fun
rect_clip(Rect, Rect): Rect = "mac#%"
//
overload .clip with rect_clip
//
(* ****** ****** *)
//
fun
rect_contains(Rect, Rect): bool = "mac#%"
//
overload .contains with rect_contains
//
(* ****** ****** *)
//
fun
rect_move
  (Rect, x: int, y: int): Rect = "mac#%"
fun
rect_move_ip
  (Rect, x: int, y: int): void = "mac#%"
//
overload .move with rect_move
overload .move_ip with rect_move_ip
//
(* ****** ****** *)
//
fun
rect_inflate
  (Rect, x: int, y: int): Rect = "mac#%"
fun
rect_inflate_ip
  (Rect, x: int, y: int): void = "mac#%"
//
overload .inflate with rect_inflate
overload .inflate_ip with rect_inflate_ip
//
(* ****** ****** *)
//
fun
rect_clamp(Rect, Rect): Rect = "mac#%"
fun
rect_clamp_ip(Rect, Rect): void = "mac#%"
//
overload .clamp with rect_clamp
overload .clamp_ip with rect_clamp_ip
//
(* ****** ****** *)
//
fun
rect_union(Rect, Rect): Rect = "mac#%"
fun
rect_union_ip(Rect, Rect): void = "mac#%"
//
overload .union with rect_union
overload .union_ip with rect_union_ip
//
(* ****** ****** *)
//
fun
color_make_rgb(r:int, g:int, b:int): Color = "mac#%"
fun
color_make_rgba(r:int, g:int, b:int, a:int): Color = "mac#%"
//
overload Color with color_make_rgb
overload Color with color_make_rgba
//
(* ****** ****** *)

(*
QUIT             none
ACTIVEEVENT      gain, state
KEYDOWN          unicode, key, mod
KEYUP            key, mod
MOUSEMOTION      pos, rel, buttons
MOUSEBUTTONUP    pos, button
MOUSEBUTTONDOWN  pos, button
JOYAXISMOTION    joy, axis, value
JOYBALLMOTION    joy, ball, rel
JOYHATMOTION     joy, hat, value
JOYBUTTONUP      joy, button
JOYBUTTONDOWN    joy, button
VIDEORESIZE      size, w, h
VIDEOEXPOSE      none
USEREVENT        code
*)
//
macdef
QUIT = $extval(Event_type, "QUIT")
//
macdef
KEYUP = $extval(Event_type, "KEYUP")
macdef
KEYDOWN = $extval(Event_type, "KEYDOWN")
//
macdef
USEREVENT = $extval(Event_type, "USEREVENT")
//
macdef
ACTIVEEVENT = $extval(Event_type, "ACTIVEEVENT")
//
macdef
MOUSEMOTION = $extval(Event_type, "MOUSEMOTION")
//
macdef
MOUSEBUTTONUP = $extval(Event_type, "MOUSEBUTTONUP")
macdef
MOUSEBUTTONDOWN = $extval(Event_type, "MOUSEBUTTONDOWN")
//
macdef
VIDEORESIZE = $extval(Event_type, "VIDEORESIZE")
macdef
VIDEOEXPOSE = $extval(Event_type, "VIDEOEXPOSE")
//
macdef
JOYBUTTONUP = $extval(Event_type, "JOYBUTTONUP")
macdef
JOYBUTTONDOWN = $extval(Event_type, "JOYBUTTONDOWN")
//
macdef
JOYHATMOTION = $extval(Event_type, "JOYHATMOTION")
macdef
JOYAXISMOTION = $extval(Event_type, "JOYAXISMOTION")
macdef
JOYBALLMOTION = $extval(Event_type, "JOYBALLMOTION")
//
(* ****** ****** *)
//
fun event_pump(): void = "mac#%"
//
(* ****** ****** *)
//
fun event_get(): Eventlist = "mac#%"
fun event_get_type(Event_type): Eventlist = "mac#%"
//
(* ****** ****** *)
//
fun event_poll(): Event = "mac#%"
//
(* ****** ****** *)
//
fun event_wait(): Event = "mac#%"
//
(* ****** ****** *)
//
fun event_clear(): void = "mac#%"
fun event_clear_type(Event_type): void = "mac#%"
//
(* ****** ****** *)
//
fun event_post(Event): void = "mac#%"
//
(* ****** ****** *)
//
fun
event_event_name(Event_type): string = "mac#%"
//
(* ****** ****** *)
//
fun
event_set_blocked(): bool = "mac#%"
fun
event_set_blocked_type(Event_type): bool = "mac#%"
//
(* ****** ****** *)
//
fun
event_set_allowed(): bool = "mac#%"
fun
event_set_allowed_type(Event_type): bool = "mac#%"
//
(* ****** ****** *)
//
fun
event_get_blocked(Event_type): bool = "mac#%"
//
(* ****** ****** *)
//
macdef
SRCALPHA = $extval(int, "SRCALPHA")
//
fun surface_make_(wh: int2): Surface
fun surface_make_flags_depth(wh: int2, int, int): Surface
fun surface_make_flags_surface(wh: int2, int, Surface): Surface
//
overload surface_make with surface_make_
overload surface_make with surface_make_flags_depth
overload surface_make with surface_make_flags_surface
//
fun surface_get_size(Surface): int2 = "mac#%"
fun surface_get_width(Surface): int = "mac#%"
fun surface_get_height(Surface): int = "mac#%"
//
overload .get_size with surface_get_size
overload .get_width with surface_get_width
overload .get_height with surface_get_height
//
(* ****** ****** *)
//
fun
surface_fill_
  (Surface, Color): Rect = "mac#%"
fun
surface_fill_rect_flags
  (Surface, Color, Rect, int): Rect = "mac#%"
//
overload .fill with surface_fill_
overload .fill with surface_fill_rect_flags
//
(* ****** ****** *)

fun
surface_blit_xy(src: Surface, dst: int2): Rect
fun
surface_blit_xy_area_flags
  (src: Surface, dst: int2, area: Rect, flags: int): Rect
//
fun
surface_blit_rect(src: Surface, dst: Rect): Rect
fun
surface_blit_rect_area_flags
  (src: Surface, dst: Rect, area: Rect, flags: int): Rect
//
overload .blit with surface_blit_xy
overload .blit with surface_blit_xy_area_flags
overload .blit with surface_blit_rect
overload .blit with surface_blit_rect_area_flags
//
(* ****** ****** *)
//
fun
display_init(): void = "mac#%" // called by pygame_init
fun
display_quit(): void = "mac#%" // called by pygame_init
//
fun
display_get_init(): bool = "mac#%"
fun
display_get_active(): bool = "mac#%"
//
fun
display_set_mode_resolution
  (resolution: int2): Surface = "mac#%"
fun
display_set_mode_resolution_flags_depth
  (resolution: int2, flags: int, depth: int): Surface = "mac#%"
//
overload display_set_mode with display_set_mode_resolution
overload display_set_mode with display_set_mode_resolution_flags_depth
//
fun
display_get_surface(): Surface = "mac#%"
//
fun
display_flip(): void = "mac#%"
fun
display_update(xs: PYlist(Rect)): void = "mac#%"
//
fun
display_iconify(): bool = "mac#%"
//
(* ****** ****** *)

(* end of [pygame.sats] *)
