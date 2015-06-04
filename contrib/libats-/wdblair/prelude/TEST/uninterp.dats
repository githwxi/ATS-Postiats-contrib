(**
  Some examples of playing with uninterpreted functions.
  
  If you wanted to write these with the default constraint
  solver, we would need to define props and use them in our
  function definition.
  
  These examples demonstrate a different system where you 
  can describe the meaning of static functions (with axioms) 
  to an SMT solver and then the constraint solver will use 
  said axioms to determine if your code implements the
  appropriate function.
*)

// Multiplication

absvt@ype matrix (a:t@ype, m:int, n:int) = ptr

assume matrix (a, m, n) = arrayptr (a, m * n)

(**

Even if we assume that i *n + j < m * n in the SMT
script, the SMT solver cannot decide this entirely
on its own.

fun {a:t@ype}
matrix_get {m,n:nat} {i,j:nat | i < m; j < n} (
    mat: !matrix(a, m, n), i: int i, n: int n, j: int j
): a = mat[i*n + j]

*)

// Factorial

stacst fact_int: (int) -> int
stadef fact = fact_int

fun 
fact {n:nat} (
  n: int n
): int (fact (n)) = 
  if n = 0 then
    1
  else
    n * fact (pred (n))
    
fun 
fact1 {n:nat} (
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

// Fibonacci

stacst fib_int: (int) -> int
stadef fib = fib_int

fun 
fib {n:nat} (
  n: int n
): int (fib(n)) = 
  if n < 2 then
    n
  else
    fib (n-1) + fib (n-2)
    
fun 
fib1 {n:nat} (
  n: int n
): int (fib (n)) = let

  fun loop {i:nat | i > 0} (
      i: int i,
      r: int (fib (i)), s: int (fib (i-1))
  ): int (fib (n)) =
    if i = n then
      r
    else
      loop (succ (i), r + s, r)

in
  loop (1, 1, 0)
end

// Euclid's Algorithm

stacst gcd_int: (int, int) -> int
stadef gcd = gcd_int

(**
  Something like mod1 isn't included
  in the prelude.
*)

infix mod1

%{^
#define mod1_int(a, b) (a % b)
%}

extern
fun mod1_int {a,b:nat | b > 0} (
  a: int (a), b: int (b)
): int (a % b) = "mac#"

overload mod1 with mod1_int

fun
gcd {a,b:nat | a > 0} (
  a: int a, b: int b
): int (gcd (a, b)) =
  if b = 0 then
    a
  else
    gcd (b, a mod1 b)
    
// Power (for positive integers)

stacst power_int_int : (int, int) -> int
stadef power = power_int_int

fun 
power {n,p:nat} (
  n: int n, p: int p
): int (power(n, p)) =
  if p = 0 then
    1
  else
    n * power (n, pred (p))
    
fun
power1 {n,p:nat} (
  n: int n, p: int p
): int (power(n, p)) = let
  //
  fun loop {i:nat | i <= p} (
    i: int i, r: int(power(n, i))
  ): int (power (n, p)) =
    if i = p then
      r
    else
      loop (succ (i), n * r)
  //
in
  loop (0, 1)
end
  

