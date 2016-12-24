(*
**
** HX-2014-09-14:
** [weboxy] is a small package that
** does webpage layout by generating CSS;
** it also generats HTML for reviewing purpose
**
*)

(* ****** ****** *)
//
abstype
charptr = $extype"atstype_string"
//
(* ****** ****** *)

abstype webox_type = ptr
typedef webox = webox_type
typedef weboxlst = List0(webox)
typedef weboxopt = Option(webox)

(* ****** ****** *)

typedef color = string

(* ****** ****** *)

fun randcolor ((*void*)): color
fun randcolor_initize ((*void*)): void
  
(* ****** ****** *)

datatype
tabstyle =
  | TSnone of ()
  | TShbox of ()
  | TSvbox of ()
// end of [tabstyle]

(* ****** ****** *)
//
fun tabstyle_isbox (ts: tabstyle): bool
fun tabstyle_ishbox (ts: tabstyle): bool
fun tabstyle_isvbox (ts: tabstyle): bool
//
overload .isbox with tabstyle_isbox
overload .ishbox with tabstyle_ishbox
overload .isvbox with tabstyle_isvbox
//
(* ****** ****** *)
//
#define UID "uid"
#define NAME "name"
//
#define WIDTH "width"
#define PWIDTH "pwidth"
//
#define HEIGHT "height"
#define PHEIGHT "pheight"
//
#define COLOR "color"
#define BGCOLOR "bgcolor"
//
#define PARENT "parent"
#define CHILDREN "children"
//
#define CONTENT "content"
//
#define PCNTLST "pcntlst"
#define TABSTYLE "tabstyle"
//
(* ****** ****** *)
//
// HX-2014-09-13:
// uid: unique indentification
//
fun{}
webox_get_uid(webox): int
//
// HX-2014-09-13:
// name: name given by the user
//
fun{}
webox_get_name(webox): string
//
overload .uid with webox_get_uid
overload .name with webox_get_name
//
(* ****** ****** *)
//
fun{}
webox_get_width (webox): int
fun{}
webox_set_width (webox, width: int): void
//
overload .width with webox_get_width
overload .width with webox_set_width
//
(* ****** ****** *)
//
// HX: p...: percentage
//
fun{}
webox_get_pwidth (webox): int
fun{}
webox_set_pwidth (webox, pwidth: int): void
//
overload .pwidth with webox_get_pwidth
overload .pwidth with webox_set_pwidth
//
(* ****** ****** *)
//
fun{}
webox_get_height (webox): int
fun{}
webox_set_height (webox, height: int): void
//
overload .height with webox_get_height
overload .height with webox_set_height
//
(* ****** ****** *)
//
// HX: p...: percentage
//
fun{}
webox_get_pheight (webox): int
fun{}
webox_set_pheight (webox, pheight: int): void
//
overload .pheight with webox_get_pheight
overload .pheight with webox_set_pheight
//
(* ****** ****** *)
//
fun{}
webox_get_color (webox): color
fun{}
webox_set_color (webox, c: color): void
//
overload .color with webox_get_color
overload .color with webox_set_color
//
(* ****** ****** *)
//
fun{}
webox_get_bgcolor (webox): color
fun{}
webox_set_bgcolor (webox, c: color): void
//
overload .bgcolor with webox_get_bgcolor
overload .bgcolor with webox_set_bgcolor
//
(* ****** ****** *)
//
fun{}
webox_isrt (x: webox): bool
fun{}
webox_get_parent (webox): weboxopt
fun{}
webox_set_parent (webox, opt: weboxopt): void
//
overload .isrt with webox_isrt
overload .parent with webox_get_parent
overload .parent with webox_set_parent
//
(* ****** ****** *)
//
fun{}
webox_get_children (webox): weboxlst
fun{}
webox_set_children (webox, xs: weboxlst): void
fun{}
webox_set_children_1 (webox, x: webox): void
fun{}
webox_set_children_2 (webox, x1: webox, x2: webox): void
fun{}
webox_set_children_3 (webox, x1: webox, x2: webox, x3: webox): void
fun{}
webox_set_children_4 (webox, x1: webox, x2: webox, x3: webox, x4: webox): void
//
overload .children with webox_get_children
overload .children with webox_set_children
overload .children with webox_set_children_1
overload .children with webox_set_children_2
overload .children with webox_set_children_3
overload .children with webox_set_children_4
//
(* ****** ****** *)
//
fun{}
webox_get_tabstyle(webox): tabstyle
fun{}
webox_set_tabstyle(webox, sty: tabstyle): void
//
overload .tabstyle with webox_get_tabstyle
overload .tabstyle with webox_set_tabstyle
//
(* ****** ****** *)
//
datatype pcnt =
  | PCNTnone of ()
  | PCNThard of int
  | PCNTsoft of int
//
typedef pcntlst = List0(pcnt)
//
fun{}
pcntlst_get_at
  (xs: pcntlst, i: intGte(0)): pcnt
//
(* ****** ****** *)
//
fun{}
webox_get_pcntlst (webox): pcntlst
fun{}
webox_set_pcntlst (webox, xs: pcntlst): void
//
overload .pcntlst with webox_get_pcntlst
overload .pcntlst with webox_set_pcntlst
//
(* ****** ****** *)
//
fun{}
webox_get_content (webox): string
fun{}
webox_set_content (webox, content: string): void
//
overload .content with webox_get_content
overload .content with webox_set_content
//
(* ****** ****** *)
//
fun
webox0_make ((*void*)): webox
//
fun{}
webox_make ((*void*)): webox
fun{}
webox_make_name (name: string): webox
fun{}
webox_make_name_width (name: string, width: int): webox
fun{}
webox_make_name_pwidth (name: string, pwidth: int): webox
//
(* ****** ****** *)

fun{}
fprint_webox_width (out: FILEref, wbx: webox): void

(* ****** ****** *)

fun{}
fprint_webox_height (out: FILEref, wbx: webox): void

(* ****** ****** *)

fun{}
fprint_webox_color (out: FILEref, wbx: webox): void
fun{}
fprint_webox_bgcolor (out: FILEref, wbx: webox): void

(* ****** ****** *)

fun{}
fprint_css_preamble (out: FILEref): void
fun{}
fprint_css_postamble (out: FILEref): void

(* ****** ****** *)

fun{}
fprint_webox_css_one (out: FILEref, webox): void
fun{}
fprint_webox_css_all (out: FILEref, webox): void
fun{}
fprint_weboxlst_css_all (out: FILEref, weboxlst): void

(* ****** ****** *)

fun{}
fprint_webox_head_beg (out: FILEref): void
fun{}
fprint_webox_head_end (out: FILEref): void

(* ****** ****** *)

fun{}
fprint_webox_body_end (out: FILEref): void
fun{}
fprint_webox_body_after (out: FILEref): void

(* ****** ****** *)

fun{}
fprint_webox_html_all (out: FILEref, webox): void

(* ****** ****** *)

(* end of [weboxy.sats] *)
