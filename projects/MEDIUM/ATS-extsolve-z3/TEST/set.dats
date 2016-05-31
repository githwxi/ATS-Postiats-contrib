(**
  Testing sets
*)

datasort set = (** *)

stacst empty_set: () -> set
stacst full_set: () -> set 
stacst set_add: (set, int) -> set
stacst set_del: (set, int) -> set
stacst set_union: (set, set) -> set 
stacst set_intersect: (set, set) -> set
stacst set_difference: (set, set) -> set
stacst set_complement: (set) -> set
stacst set_member: (int, set) -> bool
stacst set_subset: (set, set) -> bool

stadef add = set_add 
stadef del = set_del 
stadef cup = set_union
stadef cap = set_intersect
stadef dif = set_difference
stadef com = set_complement
stadef mem = set_member
stadef sub = set_subset

stacst set_eq: (set, set) -> bool
stadef == = set_eq

stacst set_count: (set) -> int


datatype set (set) = 
| Empty (empty_set ()) of ()
| {s:set} {x:int} Add (set_add (s, x)) of (int x, set s)

#define :: Add 
infixr ::

//extern fun set_add {s:set} {x:int} (set s, int x): set (add (s, x))

//extern praxi set_eq {a,b:set|sub(a,b) && sub(b,a)} (): [a==b] unit_p
extern fun set_union {a,b:set} (set a, set b): set (cup(a,b))
extern fun set_eq {a,b:set} (set a, set b): bool (a==b)
//extern
//praxi
//empty_set_is_empty(): [set_count(empty_set()) == 0] unit_p

//abstype MySet(s:set)

//extern
//fun
//make_empty(): MySet(empty_set())

//extern
//fun
//require_empty {xs: set | set_count(xs) == 0} (MySet(xs)): void

local
//  prval _ = $solver_assert(set_eq)
in
  val s = 1 :: 2 :: 3 :: Empty()
  val r = 4 :: 2 :: Empty()
  val true = set_eq (set_union (s, r), set_union (r, s))
end