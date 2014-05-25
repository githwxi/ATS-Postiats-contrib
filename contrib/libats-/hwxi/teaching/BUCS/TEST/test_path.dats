(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
STDLIB = "libc/SATS/stdlib.sats"

(* ****** ****** *)

staload "./../DATS/BUCS.dats"

(* ****** ****** *)

implement
main0 () =
{
//
val (fpf | path) = $STDLIB.getenv ("PATH")
//
val () =
if (
strptr2ptr(path) = 0
) then {
  val () =
  prerrln! ("The environment variable [PATH] is undefined!")
  val () = exit(1){void}
} (* end of [if] *)
//
val () =
println! ("PATH = ", path)
//
val () = assertloc (strptr2ptr(path) > 0)
val dirs = string_split_delim_string ($UN.strptr2string(path), ":")
//
prval ((*void*)) = fpf (path)
//
val () = let
fun loop
(
  dirs: List_vt (Strptr1)
) : void =
  case+ dirs of
  | ~list_vt_nil () => ()
  | ~list_vt_cons
      (dir, dirs) => let
      val () = fprintln! (stdout_ref, dir)
    in
      free (dir); loop (dirs)
    end // end of [list_vt_cons]
in
  loop (dirs)
end // end of [val]
//
} (* end of [main0] *)
  
(* ****** ****** *)

(* end of [test_path.dats] *)
