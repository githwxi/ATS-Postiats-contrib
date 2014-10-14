(**
  Some examples of playing with uninterpreted functions.
*)

// Factorial

stacst fact_int: (int) -> int
stadef fact = fact_int

fun fact {n:nat} (
  n: int n
): int (fact (n)) = 
  if n = 0 then
    1
  else
    n * fact (pred (n))
    
fun fact1 {n:nat} (
  n: int n
): int (fact (n)) = let
  fun loop {i:nat} (
    i: int i, r: int (fact (i))
  ): int (fact (n)) =
    if i = n then
      r
    else let
      val i' = succ (i)
    in
      loop (i', i' * r)
    end
in
  loop (0, 1)
end
