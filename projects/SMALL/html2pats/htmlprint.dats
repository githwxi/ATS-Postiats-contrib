#include
"share/atspre_staload.hats"

staload
"./htmlprint.sats"

// TODO:
// 1. extend with comments (combeg/comend): DONE
// 2. extend with more printing functions (+ overloading and htmlprint_mac)
// 3. provide string injection function (for raw output): DONE
// 4. remove tag stack?
datatype
HTMLstate = HS_NONE | HS_COMMENT | HS_TAG | HS_ATTR | HS_TAGNAME

assume
HTMLprint = @{
  tags= List_vt (string)
, state= HTMLstate
, out= FILEref
, tagname= Stropt0
, do_indent= bool
, indent= int
}
//
fun
clear_tag_name (hp: &HTMLprint): void = hp.tagname := stropt_none ()
//
fun
close_tag_start (hp: &HTMLprint, self_closed: bool): void =
  case- hp.state of
  | HS_TAGNAME () => {
      prval () = lemma_list_vt_param (hp.tags)
      val tn = hp.tagname
      val-true = stropt_is_some (tn)
      val tagname = stropt_unsome (tn)
      val () = hp.tags := list_vt_cons (tagname, hp.tags)
      val () = if self_closed then fprint! (hp.out, '/')
      val () = fprint! (hp.out, '>')
    }
  | HS_ATTR () => {
      val () = fprint! (hp.out, '\"')
      val () = if self_closed then fprint! (hp.out, '/')
      val () = fprint! (hp.out, '>')
    }
  | HS_TAG () => {
      val () = if self_closed then fprint! (hp.out, '/')
      val () = fprint! (hp.out, '>')
    }
  | _ => ()
//
fun
end_tag (hp: &HTMLprint, tag: string): void = {
  fun
  aux (hp: &HTMLprint, brk: bool): void =
    if isneqz (hp.tags) * ~brk then let
      val top = list_vt_get_at (hp.tags, 0)
      val () =
      case+ hp.state of
      | HS_NONE () => fprint! (hp.out, "</", top,">")
      | _ => {
          val () = close_tag_start (hp, true)
          val () = hp.state := HS_NONE ()
        }
      // end of [val]
      val brk = (tag="") || (tag = top)
      val-true = isneqz (hp.tags)
      val _ = list_vt_uncons (hp.tags)
    in
      aux (hp, brk)
    end
  val () = aux (hp, false)
}
//
implement
htmlprint_prolog (hp) = fprint! (hp.out, "<!DOCTYPE html>")
//
implement
htmlprint_combeg (hp) = {
  val () = close_tag_start (hp, false)
  val () = fprint! (hp.out, "<!--")
  val () = hp.state := HS_COMMENT ()
} (* end of [htmlprint_combeg] *)
//
implement
htmlprint_comend (hp) = {
  val- HS_COMMENT () = hp.state
  val () = fprint! (hp.out, "-->")
  val () = hp.state := HS_NONE ()
} (* end of [htmlprint_comend] *)
//
implement
htmlprint_tagname (hp, tagname) = {
  val () = close_tag_start (hp, false)
  val () = fprint! (hp.out, "<")
  val () =
    if tagname="" then {
      val () = hp.tagname := stropt_none ()
      val () = hp.state := HS_TAGNAME ()
    } else {
      val () = fprint! (hp.out, tagname)
      prval () = lemma_list_vt_param (hp.tags)
      val () = hp.tags := list_vt_cons (tagname, hp.tags)
      val () = hp.state := HS_TAG ()
    }
} (* end of [htmlprint_tagname] *)
//
implement
htmlprint_tagend (hp, tagname) = {
  val () = end_tag (hp, tagname)
} (* end of [htmlprint_tagend] *)
//
implement
htmlprint_attrib (hp, attname) = {
  val () =
  case- hp.state of
  | HS_TAGNAME () => {
      prval () = lemma_list_vt_param (hp.tags)
      val tn = hp.tagname
      val-true = stropt_is_some (tn)
      val tagname = stropt_unsome (tn)
      val () = hp.tags := list_vt_cons (tagname, hp.tags)
      val () = fprint! (hp.out, attname, "=\"")
      val () = hp.state := HS_ATTR ()
    }
  | HS_ATTR () => {
      val () = fprint! (hp.out, "\" ", attname, "=\"")
    }
  | _ => {
      val () = fprint! (hp.out, " ", attname, "=\"")
      val () = hp.state := HS_ATTR ()
    }
} (* end of [htmlprint_attrib] *)
//
implement
htmlprint_chardata (hp) = {
  val () = close_tag_start (hp, false)
  val () = hp.state := HS_NONE ()
} (* end of [htmlprint_chardata] *)
//
implement
htmlprint_unsafe_inject (hp, s) = {
  val () = fprintln! (hp.out, s)
} (* end of [htmlprint_unsafe_inject] *)
//
implement
htmlprint_alloc (out, do_indent, res) = {
  val () = res.out := out
  val () = res.tags := list_vt_nil {string} ()
  val () = res.tagname := stropt_none ()
  val () = res.state := HS_NONE ()
  val () = res.indent := 0
  val () = res.do_indent := do_indent
} (* end of [htmlprint_alloc] *)
//
implement
htmlprint_free (res) = {
  val () =
    case+ :(res: HTMLprint) => res.state of
    | HS_TAGNAME () => {
        val () = fprint!(res.out, "/>")
        val () = res.state := HS_NONE ()
      }
    | _ => ()
  // end of [val]
  fun
  aux (hp: &HTMLprint): void =
    if isneqz (hp.tags) then let
      val top = list_vt_get_at (hp.tags, 0)
    in
      end_tag (hp, top);
      aux (hp)
    end // end of [aux]
  val () = aux (res)
  val () = list_vt_free<string> (res.tags)
  val () = res.out := the_null_ptr
  val () = res.tagname := the_null_ptr
  val () = res.state := the_null_ptr
} (* end of [htmlprint_free] *)

(* ****** ****** *)

implement
htmlprint_char (hp, c) = (
case+ c of
| '"' => fprint! (hp.out, "&quot;")
| '\'' => fprint! (hp.out, "&apos;")
| '<' => fprint! (hp.out, "&lt;")
| '>' => fprint! (hp.out, "&gt;")
| '&' => fprint! (hp.out, "&amp;")
| _ => fprint! (hp.out, c)
) (* end of [htmlprint_char] *)
//
implement
htmlprint_float (hp, f) = fprint! (hp.out, f)
//
implement
htmlprint_double (hp, f) = fprint! (hp.out, f)
//
implement
htmlprint_ldouble (hp, f) = fprint! (hp.out, f)
//
implement
htmlprint_int (hp, i) = fprint! (hp.out, i)
//
implement
htmlprint_lint (hp, i) = fprint! (hp.out, i)
//
implement
htmlprint_llint (hp, i) = fprint! (hp.out, i)
//
implement
htmlprint_ssize (hp, s) = fprint! (hp.out, s)
//
implement
htmlprint_ulint (hp, i) = fprint! (hp.out, i)
//
implement
htmlprint_ullint (hp, i) = fprint! (hp.out, i)
//
implement
htmlprint_size (hp, s) = fprint! (hp.out, s)
//
implement
htmlprint_string (hp, s) = {
  fun
  aux {n:nat} (hp: &HTMLprint, s: string(n)): void =
    if string_isnot_empty (s) then let
      val c = string_head (s)
      val s = string_tail (s)
    in
      htmlprint_char (hp, c);
      aux (hp, s)
    end // end of [if]
  // end of [aux]
  val s = (g1ofg0)s
  val () = aux (hp, s)
} (* end of [htmlprint_string] *)
//
implement
htmlprint_stropt (hp, s) =
  if stropt_is_some (s) then {
    val () = htmlprint_string (hp, $UNSAFE.castvwtp0{string}(s))
  } (* end of [if] *)
//
implement
htmlprint_strbuf {m,n} (hp, sbf) = {
  val p = $UNSAFE.castvwtp0{string} (addr@sbf)
  val () = htmlprint_string (hp, p)
} (* end of [htmlprint_strbuf] *)
//

(* ****** ****** *)

(*

// testing code
implement
main0 () = let
  var xp : HTMLprint
  val () = htmlprint_alloc (stdout_ref, true, xp)

  val () = htmlprint_prolog (xp)
  (*
  val () = xmlprint_comment(xp, "this is a comment!")
  *)
  val () = htmlprint_tagname (xp, "html")

  val () = htmlprint_tagname (xp, "head")

  val () = htmlprint_tagname (xp, "title")
  val () = htmlprint_chardata (xp)
  val () = htmlprint_string (xp, "Hello!")
  val () = htmlprint_tagend (xp, "title")
  val () = htmlprint_tagend (xp, "head")

  val () = htmlprint_tagname (xp, "body")
  val () = htmlprint_attrib (xp, "onload")
  val () = htmlprint_string (xp, "alert('hello!')")
  val () = htmlprint_string (xp, "; var x = 0;")
  val () = htmlprint_attrib (xp, "style")
  val () = htmlprint_string (xp, "font-weight: bold")

  val () = htmlprint_combeg (xp)
  val () = htmlprint_string (xp, "This is a comment")
  val () = htmlprint_string (xp, ". It should be emitted as-is.")
  val () = htmlprint_comend (xp)

  val () = htmlprint_tagname (xp, "p")
  val () = htmlprint_chardata (xp)
  val () = htmlprint_string (xp, "Hello from ")
  val () = htmlprint_tagname (xp, "em")
  val () = htmlprint_chardata (xp)
  val () = htmlprint_string (xp, "ATS")
  val () = htmlprint_tagend (xp, "em")
  val () = htmlprint_tagend (xp, "p")
  
  val () = htmlprint_string (xp, "!")
  val () = htmlprint_string (xp, " Happy New Year!")

  val () = htmlprint_tagend (xp, "body")

  val () = htmlprint_tagend (xp, "html")
  
  val () = htmlprint_free (xp)
in
end

*)
