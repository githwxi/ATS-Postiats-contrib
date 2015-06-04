(**
  Collect input from the user.
*)

datatype commarg =
  | Verbose of ()
  | Script of (string)
  | Path of (string)
  
vtypedef commarglst = List0_vt (commarg)

fun
parse_argv
  {n:int | n >= 1} (
  argc: int (n), argv: !argv (n)
): commarglst

