// staload _ = "prelude/DATS/integer.dats"

(* ****** ****** *)

staload "contrib/libats-/wdblair/prelude/SATS/array.sats"
staload "contrib/libats-/wdblair/patsolve/SATS/stampseq.sats"

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

#define :: array_v_cons

fn
sort {a:t@ype} {l:addr} {xs:stmsq} {n:nat} .<n>. (
  pf: array_v (a, l, xs, n) | 
    p: ptr l, n: size_t n, sz: size_t (sizeof(a)), cmp: cmp_fn(a)
): [ys:stmsq | ordered(ys)] (
  array_v (a, l, ys, n) | void
)  = let

  fun 
  loop {m:nat | m <= n}
           {ys:stmsq | ordered(ys)} .<n-m>. (
    pfsorted: array_v (a, l, ys, m), 
    pfrem: array_v (a, l+m*sizeof(a), drop(xs, m), n-m) |
      ps: ptr l, pr: ptr (l+m*sizeof(a)), m: size_t (m)
  ): [zs:stmsq | ordered(zs)] (
    array_v (a, l, zs, n) | void
  ) =
    if m = n then let
        prval array_v_nil () = pfrem
    in 
         (pfsorted | ())
    end
    else let
    
          fn
          insert {n:nat} {l:addr}
                      {x:stamp} {xs:stmsq | ordered(xs)} .<n>. (
              pfxs: array_v (a, l, xs, n), pfx: T(a, x) @ l + n*sizeof(a) |  
                  p: ptr l,  px: ptr (l + n *sizeof(a)), n: size_t n
          ): [ys:stmsq | ordered(ys)] (
                  array_v (a, l, ys, n+1) | void
          ) = let
              prval () = array_sorted_len_lemma (pfxs)
              prval pfxsx = array_v_extend (pfxs, pfx)
              
              fun
              loop {i:nat | i <= n} {x:stamp}
                       {xs:stmsq | sorted(xs, n) ; lte(x, xs, i, n)} .<i>. (
                  pf: array_v (a, l, insert(xs, i, x), n+1) | pi: ptr (l+i*sizeof(a))
              ): [j:nat | sorted(insert(xs, j, x), n+1)] (
                  array_v (a, l, insert(xs, j, x), n+1) | void
              ) = 
                  if p = pi then let
                      prval  () = equal_ptr_lemma {a} {l} {0,i} (p, pi)
                  in
                      #[0 | (pf | ())]
                  end
                  else let 
                      val q = sub_ptr_bsz(pi, sz)
                      
                      prval (front, last) = array_v_split (pf, ptr_offset{a}{l}{i}(p, pi, sz))
                      prval pfx :: pfxs = last
                      prval (pff, pfis) = 
                          array_v_split (front, ptr_offset{a}{l}{i-1}(p, q, sz))
                      prval pfi1 :: pfiss = pfis

                      val sgn = cmp (pfi1, pfx | q, pi)
                      
                      prval front = array_v_unsplit (pff, pfi1 :: pfiss)
                      prval last = pfx :: pfxs
                      prval () = pf := array_v_unsplit (front, last)
                  in
                      if sgn < 0 then
                          (** 
                              Found our final position
                          *) 
                          #[i | (pf | ())]
                      else let
                          (**
                              pi-1 > pi, swap and try again
                          *)
                          val () = array_ptrswap {a}{l}{n+1}{i-1, i} (pf | q, pi, sz)
                          val [i':int] (pfins | ()) = loop {i-1} {x} {xs} (pf | q)
                       in
                           #[i' | (pfins | ())]
                       end
                  end
          
              val (pfins | ()) = loop {n}{x}{xs} (pfxsx | px)
              
              prval () = array_ordered_lemma (pfins)
           in
               (pfins | ())
          end
            
          prval array_v_cons (pfr, pfrss) = pfrem
          
          val (pfinserted | ()) = insert (pfsorted, pfr | ps, pr, m)
     in
         loop (pfinserted, pfrss | ps, add_ptr_bsz(pr, sz), succ(m))
     end
        
in
    loop (array_v_nil(), pf | p, p, u2sz(0u))
end


    

        


       
