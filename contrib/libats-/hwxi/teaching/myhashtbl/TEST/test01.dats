(*
** For testing
** myhashtbl.hats
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

typedef
key = string and itm = int

(* ****** ****** *)

#include "./../HATS/myhashtbl.hats"

(* ****** ****** *)

#define N 1024

(* ****** ****** *)
//
val mytbl = myhashtbl_make_nil(N)
//
(* ****** ****** *)
//
val-~None_vt() = mytbl.insert("a", 0)
val-~Some_vt(0) = mytbl.insert("a", 0)
//
val-~None_vt() = mytbl.insert("b", 1)
val-~Some_vt(1) = mytbl.insert("b", 1)
//
val-~None_vt() = mytbl.insert("c", 2)
val-~Some_vt(2) = mytbl.insert("c", 2)
//
(* ****** ****** *)
//
val out = stdout_ref
//
val ((*void*)) = fprintln! (out, "mytbl = ", mytbl)
//
(* ****** ****** *)

implement main0((*void*)) = ((*void*))

(* ****** ****** *)

(* end of [test01.dats] *)
