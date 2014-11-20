staload "contrib/libats-/wdblair/prelude/SATS/array.sats"
staload "contrib/libats-/wdblair/patsolve/SATS/stampseq.sats"

(* ****** ****** *)

staload _ = "prelude/DATS/integer.dats"
staload _ = "prelude/DATS/pointer.dats"

staload _ = "contrib/libats-/wdblair/prelude/DATS/array.dats"

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0
#define ATS_STALOADFLAG 0

(* ****** ****** *)

// assume T(a:t@ype, xs:stamp) = a

(* ****** ****** *)

typedef cmp_fn(a:t@ype) = {l1,l2:addr} {x1,x2:stamp} (
  !T(a, x1) @ l1, !T(a, x2) @ l2 | 
    ptr (l1), ptr (l2)) -> int (sgn(x1-x2))

(* ****** ****** *)

extern
praxi array_sorted_len_lemma 
                 {a:t@ype} {l:addr} {xs:stmsq | ordered(xs)} {n:nat} (
    pf: !array_v (a, l, xs, n)
): [sorted(xs, n)] void

extern
praxi array_ordered_lemma
                 {a:t@ype} {l:addr} {n:nat} {xs:stmsq | sorted(xs, n)}  (
    pf: !array_v (a, l, xs, n)
): [ordered(xs)] void

(* ****** ****** *)

(**
    Shorthand to make the example more readable
*)

#define :: array_v_cons
#define nil array_v_nil

macdef offset = ptr_offset
macdef swap = array_ptrswap
macdef split = array_v_split
macdef join = array_v_unsplit


(* ****** ****** *)

extern
fn patslibc_qsort {a:t@ype} {l:addr} {xs:stmsq} {n:nat}  (
  pf: array_v (a, l, xs, n) | 
    p: ptr l, n: size_t n, sz: size_t (sizeof(a)), cmp: cmp_fn(a)
): [ys:stmsq | ordered(ys)] (
  array_v (a, l, ys, n) | void
) = "ext#"

implement
patslibc_qsort {a} {l} {xs} {n} (
    pf | p, n, sz, cmp
) = let
   (*
       Short hand to abstract sz, which stays the same for the whole
       function.
   *)
  macdef ptrsucc(p) = add_ptr_bsz(,(p), sz)
  macdef ptrpred(p) = sub_ptr_bsz(,(p), sz)
   
  fun 
  loop {m:nat | m <= n}
           {ys:stmsq | ordered(ys)} .<n-m>. (
    pfsorted: array_v (a, l, ys, m), 
    pfrem: array_v (a, l+m*sizeof(a), drop(xs, m), n-m) |
      ps: ptr l, pr: ptr (l+m*sizeof(a)), m: size_t (m), cmp: cmp_fn(a)
  ):[zs:stmsq | ordered(zs)] (
    array_v (a, l, zs, n) | void
  ) =
    if m = n then let
        prval nil () = pfrem
    in 
         (pfsorted | ())
    end
    else let
    
          fn
          insert {n:nat} {l:addr}
                      {x:stamp} {xs:stmsq | ordered(xs)} .<n>. (
              pfxs: array_v (a, l, xs, n), pfx: T(a, x) @ l + n*sizeof(a) |  
                  p: ptr l,  px: ptr (l + n *sizeof(a)), n: size_t n, cmp: cmp_fn(a)
          ):[ys:stmsq | ordered(ys)] (
                  array_v (a, l, ys, n+1) | void
          ) = let
              prval () = array_sorted_len_lemma (pfxs)
              prval pfxsx = array_v_extend (pfxs, pfx)
              
              fun
              loop {i:nat | i <= n} {x:stamp}
                       {xs:stmsq | sorted(xs, n) ; lte(x, xs, i, n)} .<i>. (
                  pf: array_v (a, l, insert(xs, i, x), n+1) | px: ptr (l+i*sizeof(a)), cmp: cmp_fn(a)
              ): [j:nat | sorted(insert(xs, j, x), n+1)] (
                  array_v (a, l, insert(xs, j, x), n+1) | void
              ) = 
                  if p = px then let
                      prval  () = equal_ptr_lemma {a} {l} {0,i} (p, px)
                  in
                      #[0 | (pf | ())]
                  end
                  else let 
                      val py = ptrpred(px)
                      
                      prval (front, last) = split (pf, offset{a}{l}{i}(p, px, sz))
                      prval pfx :: pfxs = last
                      prval (sortedfront, pfys) = split (front, offset{a}{l}{i-1}(p, py, sz))
                      prval pfy :: pfyss = pfys

                      val sgn = cmp (pfy, pfx | py, px)
                      
                      prval front = join (sortedfront, pfy :: pfyss)
                      prval last = pfx :: pfxs
                      prval () = pf := join (front, last)
                  in
                      if sgn <= 0 then
                          (** 
                              Found our final position
                          *) 
                          #[i | (pf | ())]
                      else let
                          (**
                              py > px, swap and try again
                          *)
                          val () = swap {a}{l}{n+1}{i-1, i} (pf | py, px, sz)
                          val [i':int] (pfins | ()) = loop {i-1} {x} {xs} (pf | py, cmp)
                       in
                           #[i' | (pfins | ())]
                       end
                  end
          
              val (pfins | ()) = loop {n}{x}{xs} (pfxsx | px, cmp)
              
              prval () = array_ordered_lemma (pfins)
           in
               (pfins | ())
          end
            
          prval array_v_cons (pfr, pfrss) = pfrem
          
          val (pfinserted | ()) = insert (pfsorted, pfr | ps, pr, m, cmp)
     in
         loop (pfinserted, pfrss | ps, ptrsucc(pr), succ(m), cmp)
     end
        
in
    loop (array_v_nil(), pf | p, p, u2sz(0u), cmp)
end


    

        


       
