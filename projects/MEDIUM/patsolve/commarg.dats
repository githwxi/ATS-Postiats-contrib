(**
  
*)
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "patsolve.sats"

(* ****** ****** *)

local

#define :: list_cons
#define nil list_nil

fun
fail {n:int | n >=1}  (
  argv: !argv(n)
): commarglst = let
  val () = prerrln! 
    ("Usage: ", argv[0], 
    " [<constraint-file>] [-l <library-directory>]",
    " [-s <script>] [-v --verbose]")
in
  exit (1)
end

in

implement
parse_argv {n} (argc, argv) = let
  fun loop {i:int | i >=1; i <= n} (
    i: int i, argv: !argv (n), res: commarglst
  ): commarglst =
    if i = argc then
      res
    else let
      val cmd = argv[i]
    in
      case+ 0 of
        | _ when cmd = "-v" => 
          loop (succ(i), argv, Verbose() :: res)
        | _ when cmd = "-l" => let
          val i = succ (i)
        in
          if i < argc then let
            val dir = argv[i]
          in
            loop (i, argv, ScriptDirectory (dir) :: res)
          end
          else
            fail (argv)
        end
        | _ when cmd = "-s" => let
          val i = succ (i)
        in
          if i < argc then let
            val s = argv[i]
          in
            loop (i, argv, Script (s) :: res)
          end
          else
            fail (argv)
        end
        | _ => let
          val file = argv[i]
        in
          loop (succ (i), argv, JsonFile (file) :: res)
        end
    end
in
  loop (1, argv, nil())
end

end // end of [local]
