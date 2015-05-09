staload _ = "prelude/DATS/integer.dats"

(**
  Check the orderedness of a list
*)
fun
list_is_ordered (xs: List0(int)): bool = let
  //    
  fun loop (y: int, ys: List0(int)): bool =
    case+ ys of
      | list_nil () => true
      | list_cons (z, zss) =>
        if y > z then
          false
        else
          loop (z, zss)
in
    case+ xs of
      | list_nil () => true
      | list_cons (x, xss) => loop (x, xss)
end // end of [list_is_ordered]

(* ****** ****** *)

staload "contrib/libats-/wdblair/prelude/SATS/list.sats"
staload "contrib/libats-/wdblair/patsolve/SATS/stampseq.sats"

// 
(* ****** ****** *)

(**
  A good question is why do we need these props and axioms? Wasn't the
  point of using an external solver to eliminate the need for these?
  If I have to use props anyways, why should I use an external solver?

  Consider a simple example of doing pattern matching on a list xs.
  The value xs is concrete in that it occupies memory in our process
  that we can examine. In order to precisely reason about our
  program's behavior with respect to xs, we have a static sequence of
  stamps sxs that represents the exact contents of xs.

  Assume xs is a sorted list. That is, we can apply a static relation
  sorted to sxs to assert this statically.
  
    extern praxi orderedness_lemma {sxs:stmsq} ( list(a,sxs,n) ):
      [sorted(sxs, n)] void
  
    sorted_lemma (xs)
    
    val list_cons (x, xss) = xs
    
  When we do pattern matching on xs, the constraint solver will have
  the following information given to it.
  
      assert the first n elements of the sequence sxs is sorted.
      
      the sequence xs is cons (x, xss)
      
  Suppose we wanted to now work with xss. Surely, since xs is sorted
  and we only removed its first value (x) we know that xss must be
  sorted as well right? Well, when we use the Array theory of Z3 to
  represent sequences of stamps, it cannot prove that xss is in fact a
  sorted list.
  
  For this reason, we need to use the theorem proving facility in ATS
  in order to relate the construction of a stamp sequence with the
  orderedness property. This speaks volumes to ATS' flexibility as a
  language to facilitate programming with theorem proving. Even with
  an advanced constraint solver backed by any decision procedure,
  there may be relations that it cannot handle. When we encounter
  these, we can just fall back to using proofs to finish verifying
  properties of our programs in which we are interested.
  
  The advantage of having a more advanced constraint solver in the
  first place is that it allows you to balance automated and interactive
  verification as you see fit.
*)
absprop SORTED (xs:stmsq, n:int)

extern
praxi
SORTED_elim
  {xs:stmsq}{n:int}
  (pf: SORTED(xs, n)): [sorted(xs, n)] void
  
extern
praxi
SORTED_nil(): SORTED (nil, 0)

extern
praxi
SORTED_sing{a:t@ype}{x:stamp}
  (x: T(a,x)): SORTED (sing(x), 1)

extern
praxi
SORTED_cons
  {a:t@ype} {x:stamp}
  {xs:stmsq}{n:pos}
  {x <= select(xs,0)}
  (pf: SORTED (xs, n), x: T(a, x)): SORTED (cons(x, xs), n+1)
  
extern
praxi
SORTED_uncons
  {a:t@ype}
  {x:stamp}
  {xs:stmsq}{n:pos}
  (pf: SORTED (cons(x, xs), n), x: T(a,x)): [x <= select(xs,0)] SORTED (xs, n-1)
//
(* ****** ****** *)

// assume T(a:t@ype, xs:stamp) = a

(* ****** ****** *)
//
extern
fun {a:t@ype} insord
  {x0:stamp}
  {xs:stmsq}{n:nat}
(
  pf: SORTED(xs, n) | x0: T(a, x0), xs: list (a, xs, n)
) : [i:nat]
(
  SORTED (insert(xs, i, x0), n+1) | list (a, insert(xs, i, x0), n+1)
)
//
(* ****** ****** *)

implement {a}
insord {x0}{xs}{n} (pf | x0, xs) =
(
case+ xs of
| list_nil () =>
    #[0 | (SORTED_sing (x0) | list_cons {a} (x0, list_nil))]
| list_cons (x, xs1) =>
  (
    if x0 <= x
      then
        #[0 | (SORTED_cons (pf, x0) | list_cons (x0, xs))]
      else let
        prval (pfs) = SORTED_uncons (pf, x)
        val [i:int] (pfres | ys1) = insord  (pfs | x0, xs1)
      in
        #[i+1 | (SORTED_cons (pfres, x) | list_cons (x, ys1))]
      end // end of [if]
    // end of [if]
  )
) (* end of [insort] *)

(* ****** ****** *)

extern
fun {a:t@ype} sort
  {xs:stmsq}{n:int}
  (xs: list (a, xs, n)): [ys:stmsq] (SORTED (ys, n) | list (a, ys, n))

implement {a}
sort (xs) =
(
case+ xs of
| list_nil () =>
    (SORTED_nil() | list_nil())
| list_cons (x, xs1) => let
    val (pf1 | ys1) = sort (xs1) in insord (pf1 | x, ys1)
  end // end of [list_cons]
) (* end of [sort] *)

(* ****** ****** *)

extern
fun {a:t@ype} insord1
  {x0:stamp} {n:nat}
  {xs:stmsq | ordered (xs)}
(
  x: T(a, x0), xs: list (a, xs, n)
) : [i:nat | i <= n; ordered (insert(xs, i, x0))]
(
  list (a, insert(xs, i, x0), n+1)
)

extern
fun {a:t@ype} sort1 
  {n:nat} {xs: stmsq} 
(
  xs: list (a, xs, n)
) : [ys:stmsq | ordered (ys); permutation(xs, ys, n)]
(
  list (a, ys, n)
)

(* ****** ****** *)


(**
  This is an interesting example where we don't even need proof terms.
  The SMT solver can take the axioms we have given it and prove that
  this implementation matches our specification.
*)

#define :: list_cons
#define nil list_nil

implement {a}
insord1 (x0, xs) =
case+ xs of 
  | nil () =>
    #[0 | x0 :: nil()]
  | x :: xss =>
    if x0 <= x then
      #[0 | x0 :: xs]
    else let
      val [i:int] ys1 = insord1 (x0, xss)
    in
      #[i+1 | x :: ys1]
    end
    
implement {a}
sort1 (xs) =
case+ xs of
  | nil ()  => nil ()
  | x :: xss =>
    insord1 (x, sort1 (xss))

(* ****** ****** *)

(**
  This example is more for comparing ATS to a similar Liquid Haskell
  example. To prove that this would yield a list that is an ordered
  permutation of the input list, they introduce "Inductive Abstract
  Refinements". I do not believe that ATS can support these forms of
  refinements (without using proof terms of course).
*)

local

datatype 
list (a:t@ype, stmsq) =
  | list_nil (a, stampseq_nil) of ()
  | {xs:stmsq} {x:stamp}
    list_cons (a, cons (x, xs)) of (T (a, x), list (a, xs))

in

typedef ordered_list(a:t@ype) =
  [xs:stmsq | ordered(xs)] list (a, xs)

extern
fun {a:t@ype} insord2
  {x0:stamp}
(
  x: T(a, x0), xs: ordered_list (a)
) :
(
  ordered_list (a)
)

extern
fun {a:t@ype} sort2 {xs:stmsq} (
  xs: list(a, xs)
): ordered_list (a)

extern
fun foldr {a:t@ype}{b:t@ype} {xs:stmsq} (
  func: {i:int}(T(a,i), b) -> b,
  y: b,
  xs: list (a, xs)
): b
       
implement {a}
sort2 (xs) =
  foldr (insord2, nil (), xs)

end // end of [local]

(* ****** ****** *)

implement main0 () = let
  val xs = $list{int} (10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
  val xs = list_stampseq_of_list (xs)
  (**
    Need to implement a comparison operator
  *)
  extern
  castfn _t {a:t@ype} {xs:stamp} (T(a, xs)): a
  //
  implement lte_T_T<int> {x1,x2} (x, y) =
    let
      val lt = _t{int}(x) <= _t{int}(y)
      extern castfn bless (
        bool
      ): bool (x1 <= x2)
  in
      bless (lt)
  end
  //
  val (pfsorted | xs) = sort<int> (xs)

  val xs = list_of_list_stampseq{int} (xs)
in
  assert(list_is_ordered (xs));
  println! ("sort test passes!")
end // end of [main0]

(* end of [list_insort.dats] *)
