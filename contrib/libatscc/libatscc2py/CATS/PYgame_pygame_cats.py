######
#
# HX-2016-05: pygame
#
######

######
#beg of [PYgame_pygame_cats.py]
######

import pygame

############################################
#
def ats2py_pygame_pygame_init(): return pygame.init()
def ats2py_pygame_pygame_init_ret(): return pygame.init()
#
def ats2py_pygame_pygame_quit(): return pygame.quit()
#
############################################
#
def ats2py_pygame_rect_make_int4(t, l, b, r): return pygame.Rect(t, l, b, r)
def ats2py_pygame_rect_make_int22(topleft, botright): return pygame.Rect(topleft, botright)
#
############################################
#
def ats2py_pygame_rect_copy(obj): return obj.copy()
#
def ats2py_pygame_rect_fit(obj, obj2): return obj.fit(obj2)
def ats2py_pygame_rect_clip(obj, obj2): return obj.clip(obj2)
#
def ats2py_pygame_rect_move(obj, x, y): return obj.move(x, y)
def ats2py_pygame_rect_move_ip(obj, x, y): return obj.move_ip(x, y)
#
def ats2py_pygame_rect_inflate(obj, x, y): return obj.inflate(x, y)
def ats2py_pygame_rect_inflate_ip(obj, x, y): return obj.inflate_ip(x, y)
#
def ats2py_pygame_rect_clamp(obj, obj2): return obj.clamp(obj2)
def ats2py_pygame_rect_clamp_ip(obj, obj2): return obj.clamp_ip(obj2)
#
def ats2py_pygame_rect_contains(obj, obj2): return obj.contains(obj2)
#
############################################

def ats2py_pygame_color_make_rgb(r, g, b): return pygame.Color(r, g, b, 0)
def ats2py_pygame_color_make_rgba(r, g, b, a): return pygame.Color(r, g, b, a)

############################################
#
def ats2py_pygame_event_pump(): return pygame.event.pump()
#
############################################

def ats2py_pygame_event_get(): return pygame.event.get()
def ats2py_pygame_event_get_type(x): return pygame.event.get_type(x)
def ats2py_pygame_event_get_types(xs): return pygame.event.get_types(xs)

############################################
#
def ats2py_pygame_event_poll(): return pygame.event.poll()
#
def ats2py_pygame_event_wait(): return pygame.event.wait()
#
############################################

def ats2py_pygame_event_clear(): return pygame.event.clear()
def ats2py_pygame_event_clear_type(x): return pygame.event.clear(x)
def ats2py_pygame_event_clear_types(xs): return pygame.event.clear(xs)

############################################

def ats2py_pygame_event_post(event): return pygame.event.post(event)

############################################

def ats2py_pygame_event_event_name(type): return pygame.event.event_name(type)

############################################
#
def ats2py_pygame_event_set_blocked(): return pygame.event.set_blocked()
def ats2py_pygame_event_set_blocked_type(x): return pygame.event.set_blocked(x)
def ats2py_pygame_event_set_blocked_types(xs): return pygame.event.set_blocked(xs)
#
def ats2py_pygame_event_set_allowed(): return pygame.event.set_allowed()
def ats2py_pygame_event_set_allowed_type(x): return pygame.event.set_allowed(x)
def ats2py_pygame_event_set_allowed_types(xs): return pygame.event.set_allowed(xs)
#
def ats2py_pygame_event_get_blocked(type): return pygame.event.get_blocked(type)
#
############################################
#
def ats2py_pygame_surface_make_(clr): return Surface(clr)
def ats2py_pygame_surface_make_flags_depth(clr, flags, depth): return Surface(clr,flags,depth)
def ats2py_pygame_surface_make_flags_surface(clr, flags, surface): return Surface(clr,flags,surface)
#
def ats2py_pygame_surface_get_size(obj): return obj.get_size()
def ats2py_pygame_surface_get_width(obj): return obj.get_width()
def ats2py_pygame_surface_get_height(obj): return obj.get_height()
#
def ats2py_pygame_surface_fill_(obj, clr): return obj.fill(clr)
def ats2py_pygame_surface_fill_rect_flags(obj, clr, rect, flags): return obj.fill(clr,rect,flags)
#
def ats2py_pygame_surface_blit_xy(obj, dst): return obj.blit(dst)
def ats2py_pygame_surface_blit_xy_area_flags(obj, dst, area, flags): return obj.blit(dst,area,flags)
#
def ats2py_pygame_surface_blit_rect(obj, dst): return obj.blit(dst)
def ats2py_pygame_surface_blit_rect_area_flags(obj, dst, area, flags): return obj.blit(dst,area,flags)
#
############################################
#
def ats2py_pygame_display_init(): return pygame.display.init()
def ats2py_pygame_display_quit(): return pygame.display.quit()
#
def ats2py_pygame_display_get_init(): return pygame.display.get_init()
def ats2py_pygame_display_get_active(): return pygame.display.get_active()
#
def ats2py_pygame_display_set_mode_resolution(res): return pygame.display.set_mode(res)
def ats2py_pygame_display_set_mode_resolution_flags_depth(res,fs,dep): return pygame.display.set_mode(res,fs,dep)
#
def ats2py_pygame_display_flip(): return pygame.display.flip()
def ats2py_pygame_display_update(xs): return pygame.display.update(xs)
#
def ats2py_pygame_display_iconify(xs): return pygame.display.iconify()
#
############################################

###### end of [PYgame_pygame_cats.py] ######
