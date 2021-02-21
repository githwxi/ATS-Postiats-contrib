#define
HTML2PATS_targetloc "$PATSHOMERELOC/projects/SMALL/html2pats"

staload "{$HTML2PATS}/htmlprint.sats"

extern
fun
hello (out: &HTMLprint, t: string, xs: !List_vt (int)): void

#include "{$HTML2PATS}/htmlprint.dats"

#include "./hello.hats"

implement
main0 () = {
  val t = "String Parameter"
  var xs = $list_vt{int}(1,2,3,4)
  var xp : HTMLprint
  val () = htmlprint_alloc (stdout_ref, true, xp)
  val () = hello (xp, t, xs)
  val () = list_vt_free (xs)
  val () = htmlprint_free (xp)
}

