staload "contrib/libats-/wdblair/patsolve/SATS/stampseq.sats"
staload "contrib/libats-/wdblair/prelude/SATS/array.sats"

staload _ = "prelude/DATS/integer.dats"
staload _ = "prelude/DATS/pointer.dats"

staload _ = "contrib/libats-/wdblair/prelude/DATS/array.dats"

#define ATS_DYNLOADFLAG 0
#define ATS_STALOADFLAG 0

(**
  The user needs to implement this template to compare two 
  elements in the array.
*)
extern
fun {}
compare_ptr_ptr {a:t@ype}{p,q:addr}{x,y:stamp} (
  pfp: !T(a,x) @ p, pfq: !T(a,y) @ q | p: ptr p, q: ptr q
): int (sgn(x - y))

extern
fun rand_int {n:nat} (
  size_t (n)
): [s:nat | s < n] size_t (s) = "mac#"

%{^
size_t rand_int (size_t n) {

  return (size_t) (rand() % (unsigned int)n);
}
%}

(* ****** ****** *)

(**
  Define some short hand to make the example a little
  more readable.
*)
macdef offset = ptr_offset
macdef swap = array_ptrswap
macdef compare = compare_ptr_ptr
macdef split = array_v_split
macdef unsplit = array_v_unsplit
#define :: array_v_cons

(* ****** ****** *)

fun {}
quicksort {a:t@ype} {l:addr} {xs:stmsq} {n:nat} .<n>. (
  pf: array_v (a, l, xs, n) | 
    p: ptr l, n: size_t (n), sz: size_t (sizeof(a))
): [ys:stmsq | sorted (ys, n); permutation (xs, ys, n)] (
  array_v (a, l, ys, n) | void
) =
  if n <= 1 then
    (pf | ())
  else let
    //
    macdef + (p, i) = add_ptr_bsz(,(p), ,(i) * sz)
    macdef succ(p) = add_ptr_bsz(,(p), sz)
    //
    val pivot = rand_int (n)
    //
    val (perm, pf | i) = partition (pf | p, pivot, n, sz)
    prval parted = Parted_make (perm, pf, i)
    //
    prval (ls, rs) = split (pf, i)
    prval pfr :: rss = rs
    //
    val (sls | ()) = quicksort (ls | p, i, sz)
    val (srs | ()) = quicksort (rss | succ (p + i), n - i - 1, sz)
    //
    prval () = partitioned_lemma (parted, sls, pfr, srs)
    //
    prval (pfs) = unsplit (sls, pfr :: srs)
  in
    (pfs | ())
  end
  //
  where {
    absprop Perm (xs: stmsq, ys: stmsq, n:int) // ys is a permutation of xs

    extern
    praxi Perm_sing {a:t@ype}{l:addr}{xs:stmsq}{n:nat} (
      !array_v(a, l, xs, n)
    ): Perm(xs, xs, n)

    extern
    praxi Perm_cons {a:t@ype}{l:addr}{n:nat}{i,j:nat | i < n; j < n}
      {xs,ys:stmsq} (
      Perm (xs, ys, n), !array_v(a, l, swap_at(ys, i, j), n) | size_t (n)
    ): Perm (xs, swap_at(ys, i, j), n)

    extern
    praxi Perm_elim {xs,ys:stmsq} {n:nat} (
      Perm(xs, ys, n) | size_t n
    ): [permutation(xs,ys,n)] void

    absprop Parted (a:t@ype, l:addr, xs: stmsq, ps: stmsq, p:int, n:int)

    extern
    praxi 
    Parted_make 
      {l:addr}{a:t@ype}
      {n,p:nat | p < n}
      {xs, ps:stmsq | partitioned (ps, p, n)} (
        Perm (xs, ps, n), !array_v (a, l, ps, n), size_t (p)
      ): Parted (a, l, xs, ps, p, n)

    (**
      I'm cheating a bit here in saying the appending of the two
      arrays yields a permutation, a pre condition needs to be
      given saying that ls,rs are permutations of sub arrays of
      xs.
    *)
    extern
    praxi partitioned_lemma
      {l:addr}{a:t@ype}
      {xs,ps:stmsq} {p,n:nat | p < n}
      {ls,rs:stmsq} (
      Parted(a, l, xs, ps, p, n),
      !array_v (a, l, ls, p),
      !T(a, select(ps, p)) @ l+p*sizeof(a),
      !array_v (a, l+((p+1)*sizeof(a)), rs, n - p - 1)
    ): [
      lte (ls, p, select(ps, p)); lte (select(ps, p), rs, n - p - 1);
      permutation(xs, append(ls, p, cons(select(ps,p), rs), n-p), n)
    ] void

    (**
      Partition an array by a pivot chosen by the user. The static types
      provide the following guarantees:
        - The resulting array at pointer l is of length n
        - The array is partitioned by a pivot
        - The pivot in the resulting array is the element xs[piv]
          which the user gave as the desired pivot.
        - The result is a permutation of the original array.

      We first swap the desired pivot to the last spot in the array. Then we
      start at i=0  and maintain a partition index. Any  element to the left
      of this index  is <= a[n-1] (the  pivot). Any element to  the right of
      this index,  up until the current  element i, must be  greater than or
      equal to the pivot.

      part_left and part_right are two predicates defined
      to enforce these invariance.

      (define-fun part-left ((a (Array Int Int)) (pindex Int) (last Int))
        (forall ((i Int))
          (=> ( and (<= 0 i) (< i pindex) )
            (<= (select a i) (select a last)))))
            
      (define-fun part-left ((a (Array Int Int)) (i Int) (pindex Int) 
                            (last Int))
        (forall ((j Int))
          (=> ( and (<= pindex j) (j < i))
            ((select a last) <= (select a j)))))

      If we encounter an element less than the pivot, we swap it with the
      current pindex and increment pindex by one.

      When we're all done, and i = n - 1, we've reached the pivot, and so 
      from our loop invariants, if we swap the pointer at n-1 with pindex, 
      we'll have an array partitioned by the desired pivot. As an added 
      bonus, we have a termination metric to guarantee that the loop 
      terminates.
    *)
    
    fun {}
    partition{a:t@ype} {l:addr} {xs:stmsq} {pivot,n:nat | pivot < n} (
      pf: array_v (a, l, xs, n) | p: ptr l, pivot: size_t (pivot),
                                  n: size_t (n), sz: size_t(sizeof(a))
    ): [p:nat | p < n]
       [ys: stmsq | partitioned (ys, p, n);
                    select(xs, pivot) == select (ys, p)] (
        Perm(xs, ys, n), array_v (a, l, ys, n) | size_t (p)
    ) = let
      //
      macdef + (p, i) = add_ptr_bsz(,(p), ,(i)*sz)
      macdef succ (p) = add_ptr_bsz(,(p), sz)
      //
      prval perm = Perm_sing (pf)
      //
      val pi = p + pivot
      val pn = p + (n-1)
      //
      val () = swap{a}{l}{n}{pivot, n-1} (pf | pi, pn, sz)
      //
      fun loop {ps:stmsq} {i, pind: nat | pind <= i; i <= n-1 |
        lte (ps, pind, select(ps, n-1));
        lte (select(ps, n-1), ps, pind, i);
        select (ps, n-1) == select (xs, pivot)
      } .<n-i>. (
        perm: Perm(xs, ps, n), pf: array_v (a, l, ps, n) |
          pi: ptr (l+i*sizeof(a)), pind: ptr (l+pind*sizeof(a))
      ): [ys:stmsq]
         [p:nat | p < n;
          partitioned(ys, p, n); select (ys, p) == select (xs, pivot)] (
        Perm(xs, ys, n), array_v (a, l, ys, n) | size_t (p)
      ) =
        if pi = pn then let
          prval () = equal_ptr_lemma{a}{l}{i,n-1} (pi, pn)
          //
          val () = swap{a}{l}{n}{pind, n-1} (pf | pind, pn, sz)
          prval perm = Perm_cons{a}{l}{n}{pind, n-1} (perm, pf | n)
        in 
          (perm, pf | offset{a}{l}{pind}(p, pind, sz))
        end
        else let
          //
          prval (front, last) = split (pf, n-1)
          prval pfn :: ns = last
          prval (pff, pfis) = split (front, offset{a}{l}{i} (p, pi, sz))
          prval pfi :: pfiss = pfis
          //
          val sgn = compare (pfi, pfn | pi, pn)
          //
          prval front = unsplit (pff, pfi :: pfiss)
          prval last = pfn :: ns
          prval () = pf := unsplit (front, last)
          //
        in
          if sgn < 0 then let
              val () = swap{a}{l}{n}{i, pind} (pf | pi, pind, sz)
              prval perm = Perm_cons {a}{l}{n}{i,pind}(perm, pf | n)
            in
              loop {swap_at(ps,i,pind)}{i+1, pind+1} (
                perm, pf | succ (pi), succ (pind)
              )
            end
          else
            loop {ps} {i+1,pind} (perm, pf | succ (pi), pind)
        end
      // end of [loop]
      prval perm = Perm_cons{a}{l}{n}{pivot, n-1} (perm, pf | n)
    in 
      loop {swap_at(xs,pivot,n-1)} {0,0} (perm, pf | p, p)
    end // end of [partition]
    
  } // end of [quicksort]
  
(* ****** ****** *)
  
(**
  We can use the verified templated version above to implement the
  qsort function in the C library and make it available to C programs.
  
  We make use of local template instantiation in order to support this.
*)

typedef compare_fn(a:t@ype) = {l1,l2:addr} {x1,x2:stamp} (
  !T(a, x1) @ l1, !T(a, x2) @ l2 | 
    ptr (l1), ptr (l2)) -> int (sgn(x1-x2))
    
extern
fun libc_qsort {a:t@ype} {l:addr}{xs:stmsq}{n:nat} (
  pf: array_v (a, l, xs, n) |
    ptr l, size_t (n), size_t (sizeof (a)), compare_fn (a)
): [ys:stmsq | sorted (ys, n)] (
  array_v (a, l, ys, n) | void
) = "ext#"

local

  (**
    An unsafe assumption we use to make qsort available.
  *)
  extern
  castfn bless_cmp {a,b:t@ype} (compare_fn(a)): compare_fn(b)
    
  in

  implement libc_qsort {a} (pf | p, n, sz, cmp) = let
    implement compare_ptr_ptr<> {b} (pfx, pfy | px, py) = let
      val cmp0 = bless_cmp{a,b} (cmp)
    in
      cmp0 (pfx, pfy | px, py)
    end
  in
    quicksort (pf | p, n, sz)
  end
end
