(*
** Source:
** APUE3-page-5/figure-1.3
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload "./apue.sats"
//
#staload "{$LIBATSEXT}/libc/basics.sats"
#staload "{$LIBATSEXT}/libc/SATS/dirent.sats"
//
(* ****** ****** *)

implement
main0
(
argc, argv
) =
{
//
val () =
if
(argc != 2)
then
$extfcall
  (void, "err_quit", "usage: ls <dirname>")
// end of [if] // end of [val]
//
val () =
assertloc(argc = 2)
//
val dp = opendir(argv[1])
val () =
if
(dp = 0)
then 
$extfcall
(void, "err_sys", "can't open %s", argv[1])
// end of [if] // end of [val]
//
val () = assertloc(dp > 0)
//
fun
loop
(
dp: wptr1(DIR)
) : void = let
//
val
ent = readdir(dp)
//
in
//
if
ent > 0
then let
  val () = println! (ent.d_name()) in loop(dp)
end // end of [then]
//
end // end of [loop]
//
val () = loop(dp)
//
val err = closedir(dp)
//
val ((*void*)) = exit(0){void}
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [APUE3-1-3.dats] *)
