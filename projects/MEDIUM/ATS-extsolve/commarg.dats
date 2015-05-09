(**
 
*)
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "patsolve.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

local

#define :: list_vt_cons
#define nil list_vt_nil

fun
fail {n:int | n >=1}  (
  argv: !argv(n)
): commarglst = let
  val () = prerrln! 
    ("Usage: ", argv[0], " [-s <script>] [-v --verbose] [-e <python path>]")
in
  $raise AssertExn ()
end

in

implement
parse_argv {n} (argc, argv) = let
  fun loop {i:int | i >=1; i <= n} (
    i: int i, argv: !argv (n), res: commarglst
  ): commarglst =
    (**
     We should be able to use templates to make this
     a little cleaner
    *)
    if i = argc then
      res
    else let
      val cmd = argv[i]
    in
      case+ 0 of
        | _ when cmd = "-v" orelse cmd = "--verbose" =>
          loop (succ(i), argv, Verbose() :: res)
        | _ when cmd = "-s" => let
          val i = succ (i)
        in
          if i < argc then let
            val s = argv[i]
          in
            loop (succ (i), argv, Script (s) :: res)
          end
          else let
            val () = list_vt_free (res)
          in
            fail (argv)
          end
        end
        | _ when cmd = "-e" => let
           val i = succ (i)
        in
          if i < argc then let
            val s = argv[i]
          in
            loop (succ (i), argv, Path (s) :: res)
          end
          else let
            val () = list_vt_free (res)
          in
            fail (argv)
          end
        end
        | _ =>> let
          val () = list_vt_free (res)
        in
          fail (argv)
        end
    end
in
  loop (1, argv, nil())
end

end // end of [local]
