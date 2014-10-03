(**
  Collect input from the user.
*)

datatype commarg = 
  | JsonFile of (string)
  | Verbose of ()
  | ScriptDirectory of (string)
  | Script of (string)
  
typedef commarglst = List0 (commarg)

fun
parse_argv
  {n:int | n >= 1} (
  argc: int (n), argv: !argv (n)
): commarglst

