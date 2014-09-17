(*
**
** HX-2014-09-14:
** [weboxy] is a small package for doing
** webpage layout; it generates CSS for use
** and also HTML for the purpose of reviewing
**
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)
//
staload
"./../SATS/weboxy.sats"
//
(* ****** ****** *)
//
datatype gval =
  | GVint of (int)
  | GVfloat of (double)
  | GVstring of (string)
  | {a:type} GVboxed of (a)
//
(* ****** ****** *)

local
//
staload
"{$LIBATSHWXI}/teaching/BUCS/DATS/BUCS.dats"
//
in
//
implement
randcolor() = let
//
  val M = 256
  val r = randint (M)
  val b = randint (M)
  val g = randint (M)
//
  val bsz = 16
  val (pf, pfgc | p) = malloc_gc (i2sz(bsz))
  val () = $extfcall
  (
    void, "snprintf", p, bsz, "#%x%x%x", (i2u)r, (i2u)b, (i2u)g
  ) (* end of [$extfcall] *)
//
in
  $UN.castvwtp0{string}((pf, pfgc | p))
end // end of [randcolor]
//
implement randcolor_initize () = srandom_with_time ()
//
end // end of [local]

(* ****** ****** *)
//
implement
tabstyle_isbox (ts) =
  case+ ts of TSnone () => false | _ => true
implement
tabstyle_ishbox (ts) =
  case+ ts of TShbox () => true | _ => false
implement
tabstyle_isvbox (ts) =
  case+ ts of TSvbox () => true | _ => false  
//
(* ****** ****** *)
//
assume
webox_type = hashtbl (string, gval)
//
(* ****** ****** *)

implement
{}(*tmp*)
webox_get_name
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, NAME)
//
in
//
case+ opt of
| ~Some_vt (gv) =>
    let val-GVstring(nm) = gv in nm end
  // end of [Some_vt]
| ~None_vt ((*void*)) => "" (* nameless *)
//
end // end of [webox_get_name]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_width
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, WIDTH)
//
in
//
case+ opt of
| ~Some_vt (gv) =>
    let val-GVint(w) = gv in w end
  // end of [Some_vt]
| ~None_vt ((*void*)) => ~1 (* erroneous *)
//
end // end of [webox_get_width]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_width
  (wbx, width) = let
//
val w = GVint(width)
//
val cp =
  hashtbl_search_ref (wbx, WIDTH)
//
in
//
if isneqz(cp)
  then $UN.cptr_set(cp, w)
  else hashtbl_insert_any (wbx, WIDTH, w)
//
end // end of [webox_set_width]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_pwidth
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, PWIDTH)
//
in
//
case+ opt of
| ~Some_vt (gv) =>
    let val-GVint(pw) = gv in pw end
  // end of [Some_vt]
| ~None_vt ((*void*)) => ~1 (* erroneous *)
//
end // end of [webox_get_pwidth]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_pwidth
  (wbx, pwidth) = let
//
val pw = GVint(pwidth)
//
val cp =
  hashtbl_search_ref (wbx, PWIDTH)
//
in
//
if isneqz(cp)
  then $UN.cptr_set(cp, pw)
  else hashtbl_insert_any (wbx, PWIDTH, pw)
//
end // end of [webox_set_pwidth]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_height
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, HEIGHT)
//
in
//
case+ opt of
| ~Some_vt (gv) =>
    let val-GVint(h) = gv in h end
  // end of [Some_vt]
| ~None_vt ((*void*)) => ~1 (* erroneous *)
//
end // end of [webox_get_height]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_height
  (wbx, h) = let
//
val h = GVint(h)
//
val cp =
  hashtbl_search_ref (wbx, HEIGHT)
//
in
//
if isneqz(cp)
  then $UN.cptr_set(cp, h)
  else hashtbl_insert_any (wbx, HEIGHT, h)
//
end // end of [webox_set_height]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_color
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, COLOR)
//
in
//
case+ opt of
| ~Some_vt (gv) =>
    let val-GVstring(clr) = gv in clr end
  // end of [Some_vt]
| ~None_vt ((*void*)) => "" (* erroneous *)
//
end // end of [webox_get_color]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_color
  (wbx, clr) = let
//
val clr = GVstring(clr)
//
val cp =
  hashtbl_search_ref (wbx, COLOR)
//
in
//
if isneqz(cp)
  then $UN.cptr_set(cp, clr)
  else hashtbl_insert_any (wbx, COLOR, clr)
//
end // end of [webox_set_color]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_bgcolor
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, BGCOLOR)
//
in
//
case+ opt of
| ~Some_vt (gv) =>
    let val-GVstring(clr) = gv in clr end
  // end of [Some_vt]
| ~None_vt ((*void*)) => "" (* erroneous *)
//
end // end of [webox_get_bgcolor]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_bgcolor
  (wbx, clr) = let
//
val clr = GVstring(clr)
//
val cp =
  hashtbl_search_ref (wbx, BGCOLOR)
//
in
//
if isneqz(cp)
  then $UN.cptr_set(cp, clr)
  else hashtbl_insert_any (wbx, BGCOLOR, clr)
//
end // end of [webox_set_bgcolor]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_parent
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, PARENT)
//
in
//
case+ opt of
| ~None_vt () => None()
| ~Some_vt (gv) => let
    val-GVboxed(x) = gv in $UN.cast{weboxopt}(x)
  end // end of [Some_vt]
//
end // end of [webox_get_parent]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_parent
  (wbx, opt) = let
//
val opt = GVboxed(opt)
//
val cp =
  hashtbl_search_ref (wbx, PARENT)
//
in
//1
if isneqz(cp)
  then $UN.cptr_set(cp, opt)
  else hashtbl_insert_any (wbx, PARENT, opt)
//
end // end of [webox_set_parent]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_children
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, CHILDREN)
//
in
//
case+ opt of
| ~None_vt () => nil()
| ~Some_vt (gv) => let
    val-GVboxed(x) = gv in $UN.cast{weboxlst}(x)
  end // end of [Some_vt]
//
end // end of [webox_get_children]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_children
  (wbx, xs) = let
//
val opt = Some(wbx)
//
val () = (
fix f
(
  xs: weboxlst
) : void =<cloref1>
  case+ xs of
  | list_nil() => () | list_cons (x, xs) => (x.parent(opt); f(xs))
) (xs) // end of [val]
//
val xs = GVboxed(xs)
//
val cp =
  hashtbl_search_ref (wbx, CHILDREN)
//
in
//1
if isneqz(cp)
  then $UN.cptr_set(cp, xs)
  else hashtbl_insert_any (wbx, CHILDREN, xs)
//
end // end of [webox_set_children]

(* ****** ****** *)
//
implement
{}(*tmp*)
webox_set_children_1
  (wbx, x) = webox_set_children (wbx, list_sing(x))
implement
{}(*tmp*)
webox_set_children_2
  (wbx, x1, x2) = webox_set_children (wbx, list_pair(x1, x2))
implement
{}(*tmp*)
webox_set_children_3
  (wbx, x1, x2, x3) = webox_set_children (wbx, $list_t(x1, x2, x3))
//
(* ****** ****** *)

implement
{}(*tmp*)
webox_get_tabstyle
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, TABSTYLE)
//
in
//
case+ opt of
| ~None_vt () => TSnone()
| ~Some_vt (gv) => let
    val-GVboxed(x) = gv in $UN.cast{tabstyle}(x)
  end // end of [Some_vt]
//
end // end of [webox_get_tabstyle]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_tabstyle
  (wbx, ts) = let
//
val ts = GVboxed(ts)
//
val cp =
  hashtbl_search_ref (wbx, TABSTYLE)
//
in
//1
if isneqz(cp)
  then $UN.cptr_set(cp, ts)
  else hashtbl_insert_any (wbx, TABSTYLE, ts)
//
end // end of [webox_set_tabstyle]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_percentlst
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, PERCENTLST)
//
in
//
case+ opt of
| ~None_vt () => list_nil()
| ~Some_vt (gv) => let
    val-GVboxed(pcs) = gv in $UN.cast{List0(int)}(pcs)
  end // end of [Some_vt]
//
end // end of [webox_get_percentlst]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_percentlst
  (wbx, pcs) = let
//
val pcs = GVboxed(pcs)
//
val cp =
  hashtbl_search_ref (wbx, PERCENTLST)
//
in
//1
if isneqz(cp)
  then $UN.cptr_set(cp, pcs)
  else hashtbl_insert_any (wbx, PERCENTLST, pcs)
//
end // end of [webox_set_percentlst]

(* ****** ****** *)

implement
{}(*tmp*)
percentlst_get_at
  (pcs, i) = let
//
fun
loop
(
  pcs: List(int), i: int
) : int =
(
case+ pcs of
| list_nil () => ~1
| list_cons (pc, pcs) =>
    if i > 0 then loop (pcs, i-1) else pc
  // end of [list_cons]
)
//
in
  loop (pcs, i)
end // end of [percentlst_get_at]

(* ****** ****** *)

implement
{}(*tmp*)
webox_get_content
  (wbx) = let
//
val opt =
  hashtbl_search (wbx, CONTENT)
//
in
//
case+ opt of
| ~None_vt () => ""
| ~Some_vt (gv) => let
    val-GVstring(content) = gv in content
  end // end of [Some_vt]
//
end // end of [webox_get_content]

(* ****** ****** *)

implement
{}(*tmp*)
webox_set_content
  (wbx, content) = let
//
val content = GVstring(content)
//
val cp =
  hashtbl_search_ref (wbx, CONTENT)
//
in
//1
if isneqz(cp)
  then $UN.cptr_set(cp, content)
  else hashtbl_insert_any (wbx, CONTENT, content)
//
end // end of [webox_set_content]

(* ****** ****** *)

local
//
macdef CAP = i2sz(32)
//
var theUID = 0
val theUID =
ref_make_viewptr{int}(view@theUID|addr@theUID)
//
fun theUID_getinc () =
  let val n = !theUID in !theUID := n+1; n end
//
in (* in-of-local *)

implement
webox0_make
(
// argumentless
) = wbx where {
//
val uid = theUID_getinc ()
val wbx = hashtbl_make_nil (CAP)
//
val ((*void*)) =
  hashtbl_insert_any (wbx, UID, GVint(uid))
//
} (* end of [webox_make] *)

end // end of [local]

(* ****** ****** *)

implement
{}(*tmp*)
webox_make () = webox0_make ()

(* ****** ****** *)

implement
{}(*tmp*)
webox_make_name
  (name) = wbx where
{
//
val wbx = webox_make()
val ((*void*)) = 
  hashtbl_insert_any (wbx, NAME, GVstring(name))
//
} (* end of [webox_make_name] *)

(* ****** ****** *)

implement
{}(*tmp*)
webox_make_name_width
  (name, width) = wbx where
{
//
val wbx = webox_make_name(name)
val ((*void*)) = 
  hashtbl_insert_any (wbx, WIDTH, GVint(width))
//
} (* end of [webox_make_name_width] *)

(* ****** ****** *)

implement
{}(*tmp*)
webox_make_name_pwidth
  (name, pwidth) = wbx where
{
//
val wbx = webox_make_name(name)
val ((*void*)) = 
  hashtbl_insert_any (wbx, PWIDTH, GVint(pwidth))
//
} (* end of [webox_make_name_pwidth] *)

(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_width
  (out, wbx) = let
//
val h = wbx.width
//
in
//
if h >= 0
then fprintln! (out, "width: ", h, "px ;")
else let
//
val ph = wbx.pwidth
//
in
  if ph >= 0
    then fprintln! (out, "width: ", ph, "% ;\n")
  // end of [if]
end // end of [else]
//
end // end of [fprint_webox_height]
  
(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_height
  (out, wbx) = let
//
val h = wbx.height
//
in
//
if h >= 0
  then fprintln! (out, "height: ", h, "px ;")
//
end // end of [fprint_webox_height]
  
(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_color
  (out, wbx) = let
//
val clr = wbx.color
//
in
//
if isneqz(clr)
  then fprintln! (out, "color: ", clr, ";")
//
end // end of [fprint_webox_color]
  
(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_bgcolor
  (out, wbx) = let
//
val clr = wbx.bgcolor
//
in
//
if isneqz(clr)
  then fprintln! (out, "background-color: ", clr, ";")
//
end // end of [fprint_webox_bgcolor]
  
(* ****** ****** *)

implement
{}(*tmp*)
fprint_css_preamble (out) = ()
implement
{}(*tmp*)
fprint_css_postamble (out) = ()

(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_css_one
  (out, wbx0) = {
//
fun auxlst
(
  out: FILEref
, wbxs: weboxlst, i: int
) : void =
(
//
case+ wbxs of
| list_nil () => ()
| list_cons (wbx, wbxs) => let
    val () =
    if i > 0
      then fprint (out, ", ")
    // end of [if]
    val () = fprint (out, wbx.name)
  in
    auxlst (out, wbxs, i+1)
  end // end of [list_cons]
)
//
val name = wbx0.name
//
val () =
fprint! (out, "#", name, " {\n")
//
val () = fprint_string (out, "/*")
val () = fprint_string (out, "\nparent: ")
val () = (
//
case+ wbx0.parent of
| None () => () | Some (wbx) => fprint (out, wbx.name)
//
) (* end of [val] *)
val () = fprint_string (out, "\nchildren: ")
val () = auxlst (out, wbx0.children, 0(*i*))
val ((*closing*)) = fprint_string (out, "\n*/\n")
//
val () = fprint_webox_width (out, wbx0)
val () = fprint_webox_height (out, wbx0)
val () = fprint_webox_color (out, wbx0)
val () = fprint_webox_bgcolor (out, wbx0)
//
val ((*closing*)) = fprintln! (out, "} /* ", name, " */")
//
} (* end of [fprint_webox_css_one] *)

(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_css_all
  (out, x0) = let
//
val xs = x0.children
val () = fprint_weboxlst_css_all (out, xs)
val () = if isneqz (xs) then fprint_newline (out)
//
in
  fprint_webox_css_one (out, x0)
end // end of [fprint_webox_css_all]

implement
{}(*tmp*)
fprint_weboxlst_css_all
  (out, xs) = let
//
fun
loop
(
  xs: weboxlst, i: int
) : void =
  case+ xs of
  | list_nil () => ()
  | list_cons (x, xs) => let
      val () =
        if i > 0 then fprint (out, "\n")
      val () = fprint_webox_css_all (out, x)
    in
      loop (xs, i+1)
    end // end of [list_cons]
// end of [loop]
//
in
  loop (xs, 0)
end // end of [fprint_weboxlst_css_all]

(* ****** ****** *)

extern
fun{}
fprint_webox_html
  (out: FILEref, webox): void
extern
fun{}
fprint_weboxlst_html
(
  out: FILEref
, ts: tabstyle, pcs: List0(int), xs: weboxlst
) : void // end-of-function

(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_html
  (out, wbx0) = let
//
val name = wbx0.name
//
val () =
fprint! (out, "<div id=\"", name, "\">\n")
//
val wbxs = wbx0.children
//
val () = (
//
if
isneqz(wbxs)
then let
  val ts = wbx0.tabstyle
  val pcs = webox_get_percentlst (wbx0)
in
  fprint_weboxlst_html (out, ts, pcs, wbxs)
end // end of [then]
else let
  val msg = wbx0.content
in
  if isneqz(msg)
    then fprint (out, msg)
    else fprint! (out, "[", name , "]\n")
  // end of [if]
end // end of [else]
) : void // end of [val]
//
val ((*closing*)) =
  fprintln! (out, "</div><!--", name, "-->")
//
in
  // nothing
end // end of [fprint_webox_html]

(* ****** ****** *)

implement
{}(*tmp*)
fprint_weboxlst_html
  (out, ts, pcs, wbxs) = let
//
val isbox = ts.isbox
val ishbox = ts.ishbox
val isvbox = ts.isvbox
//
fun
loop{i:nat}
(
  wbxs: weboxlst, i: int i
) : void = let
in
//
case+ wbxs of
| list_nil () => ()
| list_cons
    (wbx, wbxs) => let
    val () =
    if i > 0 then fprint (out, "\n")
    val () =
    if isvbox then fprint (out, "<tr>\n")
//
    val () =
    if ishbox then let
      val pc = percentlst_get_at (pcs, i)
    in
      if pc >= 0
        then
        fprint! (out
        , "<td style=\"vertical-align: top; width: ", pc, "%;\">\n"
        ) (* end of [fprint!] *)
        else fprint! (out, "<td style=\"vertical-align: top;\">\n")
      // end of [if]
    end // end of [then] // end of [if]
//
    val () =
    if isvbox then fprint (out, "<td>\n") // HX: no halign!
//
    val () = fprint_webox_html (out, wbx)
    val () = if isbox then fprint (out, "</td>\n")
    val () = if isvbox then fprint (out, "</tr>\n")
  in
    loop (wbxs, i+1)
  end // end of [list_cons]
end // end of [loop]
//
val () =
if
isbox
then (
//
fprint (out
, "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
) (* end of [val] *)
//
) (* end of [then] *) // end of [if]
//
val () =
if ishbox then fprint (out, "<tr>\n")
val () = loop (wbxs, 0)
val () =
if ishbox then fprint (out, "</tr>\n")
//
val () = if isbox then fprint (out, "</table>\n")
in
  // nothing
end // end of [fprint_weboxlst_html]

(* ****** ****** *)

implement
{}(*tmp*)
fprint_webox_html_all
  (out, wbx0) = let
//
val () =
fprint! (out, "\
<!DOCTYPE html>\n\
<html>\n\
<head>\n\
<style>\n\
") (* end of [val] *)
//
val () =
  fprint_css_preamble (out)
val () =
  fprint_webox_css_all (out, wbx0)
val () =
  fprint_css_postamble (out)
//
val () =
fprint! (out, "\
</style>\n\
</head>\n\
") (* end of [val] *)
//
val () =
fprint! (out, "<body>\n")
//
val () = fprint_webox_html (out, wbx0)
//
val () =
fprint! (out, "</body>\n")
val () =
fprint! (out, "</html>\n")
//
val ((*flushing*)) = fileref_flush (out)
//
in
  // nothing
end // end of [fprint_webox_html_all]

(* ****** ****** *)

(* end of [weboxy.dats] *)
