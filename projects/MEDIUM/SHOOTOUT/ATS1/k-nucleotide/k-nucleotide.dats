(*
** The Great Computer Language Shootout
** http://shootout.alioth.debian.org/
**
** contributed by Hongwei Xi (hwxi AT cs DOT bu DOT edu)
**
** compilation command:
**   atscc -O3 k-nucleotide.dats -o k-nucleotide -D_ATS_GCATS
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libc/SATS/stdio.sats"

(* ****** ****** *)

%{^
// #include "symtbl.hats"
typedef atstype_ptr ats_string_type ;
typedef struct { int beg ; int len ; } symbol_t ;
typedef struct { symbol_t sym ; int cnt ; } tblent_t ;
%} // end of [%{^]

(* ****** ****** *)

// staload "symtbl.sats"
abstype dna_t = ptr // boxed type
abst@ype symbol_t = $extype "symbol_t"
abstype symtbl_t = ptr // boxed type

(* ****** ****** *)

extern
fun print_symbol (dna: dna_t, sym: symbol_t): void

(* ****** ****** *)

extern
fun symtbl_make (dna: dna_t, size: Nat) : symtbl_t
extern
fun symtbl_clear (tbl: symtbl_t) : void = "symtbl_clear"
//
extern
fun symtbl_search
  (tbl: symtbl_t, name: string) : int = "symtbl_search"
//
extern
fun symtbl_insert
  (tbl: symtbl_t, sym: symbol_t, cnt: int) : void = "symtbl_insert"
//
extern
fun symtbl_fold{a:viewt@ype}
  (tbl: symtbl_t, f: !(symbol_t, int, &a) -<cloptr1> void, res: &a) : void
//
extern fun symtbl_dna (tbl: symtbl_t): dna_t
//
(* ****** ****** *)

abst@ype
tblent_t =
$extype"tblent_t"

typedef tblent = tblent_t

viewtypedef
symtbl (
  sz:int, n:int, l:addr
) = @{
  dna= dna_t
, ptr= ptr l
, view_arr= @[tblent][sz] @ l
, view_arr_gc= mfree_gc_v (l)
, size= int sz
, nitm= int n
} // end of [symtbl]

viewtypedef symtbl0 = symtbl (0, 0, null)
viewtypedef symtbl =
  [sz,n:nat | sz > 0] [l:addr] symtbl (sz, n, l)
assume symtbl_t =
  [l_tbl: addr] (vbox (symtbl @ l_tbl) | ptr l_tbl)

(* ****** ****** *)

extern fun fprint_symbol
  (out: FILEref, dna: dna_t, sym: symbol_t): void = "mac#"

%{

atsvoid_t0ype
fprint_symbol
(
  atstype_ptr out
, atstype_ptr dna, symbol_t sym
) {
  char *s ; int i ;
//
  s = (char*)dna + sym.beg - 1 ; i = 0 ;
//
  while (i < sym.len) {
    fputc ( *s, (FILE*)out) ; ++i ; ++s ;
  }
//
  return ;
}

%}

implement
print_symbol (dna, sym) = fprint_symbol (stdout_ref, dna, sym)

(* ****** ****** *)

#define i2u uint1_of_int1
extern fun hash_string_33 (s: string):<> uInt = "hash_string_33"
extern fun hash_symbol_33 (dna: dna_t, sym: symbol_t):<> uInt = "hash_symbol_33"

%{

// a commonly used simple hash function

atstype_uint
hash_string_33
(
  atstype_ptr s0
) {
  unsigned int hash_val ; unsigned char *s ; int c ;
  hash_val = 314159 ;

  s = (unsigned char*)s0 ;
  while (1) {
    c = *s ;
    if (!c) return hash_val ;
    hash_val = ((hash_val << 5) + hash_val) + c ;
    s += 1 ;
  }
}

atstype_uint
hash_symbol_33
(
  atstype_ptr dna, symbol_t sym
) {
//
  unsigned int hash_val, n ; unsigned char *s ;
  hash_val = 314159 ;
//
  n = sym.len ;
  s = (unsigned char*)dna + sym.beg - 1 ;
//
  while (n > 0) {
    hash_val = ((hash_val << 5) + hash_val) + *s ;
    ++s ; --n ;
  }
/*
  fprintf (stdout, "has_symbol_33: \n") ;
  fprintf (stdout, "  sym = ") ;
  fprint_symbol (stdout, dna, sym) ;
  fprintf (stdout, "\n  hash_val = %u\n", hash_val) ;
*/
  return hash_val ;
}

%}

(* ****** ****** *)

extern
fun
tblent_array_make
  {sz: nat}
(
  sz: int sz
) :<> [l:addr]
(
  array_v (tblent, l, sz), mfree_gc_v (l) | ptr l
) = "tblent_array_make"

%{^

atstype_ptr
tblent_array_make (atstype_int sz) {
  return atspre_calloc_gc (sz, sizeof(tblent_t)) ;
}

%}

(* ****** ****** *)

implement
symtbl_make
  (dna, sz) = let
//
val sz = max (sz, 1)
val (pf_tbl, pf_tbl_gc | p_tbl) = ptr_alloc_tsz {symtbl0} (sizeof<symtbl0>)
val (pf_arr, pf_arr_gc | p_arr) = tblent_array_make (sz)
//
val () = begin
  p_tbl->dna := dna;
  p_tbl->ptr := p_arr;
  p_tbl->view_arr := pf_arr;
  p_tbl->view_arr_gc := pf_arr_gc;
  p_tbl->size := sz;
  p_tbl->nitm := 0
end // end of [val]
//
prval () = mfree_gc_v_elim (pf_tbl_gc)
prval pfbox = __assert (pf_tbl | p_tbl) where
{
  extern praxi __assert {l:addr} (pf: symtbl @ l | ptr (l)): vbox (symtbl @ l)
}
//
in
  (pfbox | p_tbl)
end // symtbl_make

(* ****** ****** *)

extern
fun
tblent_array_clear
  {l:addr}{sz:nat}
(
  pf: !array_v (tblent, l, sz) | p: ptr l, sz: int sz
) :<> void = "tblent_array_clear"

%{

atsvoid_t0ype
tblent_array_clear
(
  atstype_ptr p, atstype_int sz
) {
  memset (p, 0, sz * sizeof(tblent_t)) ;
} // end of [tblent_array_clear]

%}

implement
symtbl_clear (tbl) = let
//
val (vbox pf_tbl | p_tbl) = tbl
//
in

tblent_array_clear (p_tbl->view_arr |  p_tbl->ptr, p_tbl->size);
p_tbl->nitm := 0
//
end // end of [symtbl_clear]

(* ****** ****** *)
//
// HX: linear probing
//
extern fun
symtbl_search_probe
  {l:addr}{sz,i:nat | i < sz}
(
  pf: !array_v(tblent, l, sz) |
  dna: dna_t, p: ptr l, sz: int sz, name: string, i: int i
) :<> int = "symtbl_search_probe"

%{

atstype_int
symtbl_search_probe
  (ats_string_type dna,
   atstype_ptr p,
   atstype_int sz,
   ats_string_type name,
   atstype_int i) {

  tblent_t *ent ; int beg ;

  ent = ((tblent_t *)p) + i ;

  while (1) {
    beg = (ent->sym).beg ;
    if (beg == 0) return 0 ; // the entry is unoccupied
    if (strncmp (((char*)dna)+beg-1, (char*)name, (ent->sym).len) == 0) {
      return ent->cnt ;
    }
    ++i ; if (i >= sz) { i = 0 ; ent = (tblent_t *)p ; } else ++ent ;
  }
}

%}

implement
symtbl_search
  (tbl, name) = let
//
val (vbox pf_tbl | p_tbl) = tbl
//
val hval = hash_string_33 (name)
val size = g1int2uint_int_uint (p_tbl->size)
val offset = g1uint2int_uint_int (hval mod size)
//
in
//
symtbl_search_probe
(
  p_tbl->view_arr | p_tbl->dna, p_tbl->ptr, p_tbl->size, name, offset
) (* end of [symtbl_search_probe] *)

end // end of [symtbl_search]

(* ****** ****** *)

extern fun
symtbl_insert_probe
  {l:addr}{sz,i:nat | i < sz}
(
  pf: !array_v (tblent, l, sz) |
  dna: dna_t, p: ptr l, sz: int sz, sym: symbol_t, cnt: int, i: int i
) :<> bool = "symtbl_insert_probe"

%{

atstype_bool
symtbl_insert_probe
  (atstype_ptr dna,
   atstype_ptr p, atstype_int sz,
   symbol_t sym, atstype_int cnt,
   atstype_int i) {

  tblent_t *ent ;
/*
  printf ("symtbl_insert_probe: sz = %i\n", sz) ;
*/

  ent = ((tblent_t *)p) + i ;
  while (1) {
    if (!(ent->sym).beg) { // the entry is not occupied
      ent->sym = sym ;
      if (cnt > 0) ent->cnt = cnt ; else ent->cnt = 1 ;
      return 1 ;
    }
/*
    printf ("symtbl_insert_probe: i = %i\n", i) ;
    fprint_symbol (stdout, dna, ent->sym) ; printf ("\n") ;
    fprint_symbol (stdout, dna, sym) ; printf ("\n") ;
*/
    // linear probing
    if (strncmp (dna+(ent->sym).beg-1, dna+sym.beg-1, sym.len) == 0) {
      if (cnt > 0) ent->cnt = cnt ; else ent->cnt += 1 ;
      return 0 ;
    }
    ++i ; if (i >= sz) { i = 0 ; ent = (tblent_t *)p ; } else ++ent ;
  }
}

%}

(* ****** ****** *)

extern fun
symtbl_resize_move
  {l,l_new:addr}{sz:nat} 
(
  pf: !array_v(tblent, l, sz),
  pf_new: !array_v(tblent, l_new, sz+sz) |
  dna: dna_t, p: ptr l, p_new: ptr l_new, sz: int sz
) :<> void = "symtbl_resize_move"

%{

atsvoid_t0ype
symtbl_resize_move
(
  atstype_ptr dna
, atstype_ptr p, atstype_ptr p_new, atstype_int sz
) {

  int i, sz2, h ;
  tblent_t *ent ;

  i = 0 ; sz2 = sz + sz ; ent = (tblent_t *)p ;
/*
  printf ("symtbl_resize_move: sz2 = %i\n", sz2) ;
*/
  while (i < sz) {
    if (!(ent->sym).beg) { ++i ; ++ent ; continue ; }
    h = hash_symbol_33 (dna, ent->sym) % sz2 ;
    symtbl_insert_probe (dna, p_new, sz2, ent->sym, ent->cnt, h) ;
    ++i ; ++ent ;
  }

  return ;
}

%}

fun
symtbl_resize
  (tbl: symtbl_t): void = let

val (vbox pf_tbl | p_tbl) = tbl
val p_arr = p_tbl->ptr
prval pf_arr = p_tbl->view_arr
prval pf_arr_gc = p_tbl->view_arr_gc
val sz = p_tbl->size
val (pf_arr_new, pf_arr_gc_new | p_arr_new) = tblent_array_make (sz + sz)

in
//
symtbl_resize_move
(
  pf_arr, pf_arr_new
| p_tbl->dna, p_arr, p_arr_new, sz
) ; // end of [symtbl_resize_move]
//
array_ptr_free {tblent?} (pf_arr, pf_arr_gc | p_arr);
//
p_tbl->ptr := p_arr_new;
p_tbl->view_arr := pf_arr_new;
p_tbl->view_arr_gc := pf_arr_gc_new;
p_tbl->size := sz + sz;

end // end of [symtbl_resize]

fun symtbl_resize_if (tbl: symtbl_t): void = let
  val nitm = let val (vbox pf_tbl | p_tbl) = tbl in p_tbl->nitm end
  val size = let val (vbox pf_tbl | p_tbl) = tbl in p_tbl->size end
in
  if (2 * nitm > size) then symtbl_resize (tbl)
end // end of [symtbl_resize]

(* ****** ****** *)

implement
symtbl_insert
  (tbl, sym, cnt) = let
//
val () = symtbl_resize_if (tbl)
val (vbox pf_tbl | p_tbl) = tbl
val hval = hash_symbol_33 (p_tbl->dna, sym)
val size = g1int2uint_int_uint (p_tbl->size)
val offset = g1uint2int_uint_int (hval mod size)
val is_new = symtbl_insert_probe
  (p_tbl->view_arr | p_tbl->dna, p_tbl->ptr, p_tbl->size, sym, cnt, offset)
//
in

if is_new then p_tbl->nitm := 1 + p_tbl->nitm else ()

end // end of [symtbl_insert]

(* ****** ****** *)

extern
fun
tblent_array_fold
  {a:viewt@ype}
  {l:addr}{sz: nat}
(
  pf: !array_v (tblent, l, sz) |
  p: ptr l, sz: int sz, f: !(symbol_t, int, &a) -<cloptr1> void, res: &a
) :<> void = "tblent_array_fold"

%{

atsvoid_t0ype
tblent_array_fold
  (atstype_ptr p, atstype_int sz, atstype_cloptr f, atstype_ptr res) {

  int i ; tblent_t *ent ;

  i = 0 ; ent = (tblent_t *)p ;
  while (i < sz) {
    if (!(ent->sym).beg) { ++i ; ++ent ; continue ; }
    ((atsvoid_t0ype (*)(atstype_cloptr, symbol_t, atstype_int, atstype_ptr))(((ATStyclo()*)f)->cfun))(f, ent->sym, ent->cnt, res) ;
    ++i ; ++ent ;
  }
}

%}

implement
symtbl_fold{a}
  (tbl, f, res) = let

val (vbox pf_tbl | p_tbl) = tbl

in

tblent_array_fold{a}
  (p_tbl->view_arr | p_tbl->ptr, p_tbl->size, f, res)

end // end of [symtbl_insert]

(* ****** ****** *)

implement symtbl_dna (tbl) = begin
  let val (vbox pf_tbl | p_tbl) = tbl in p_tbl->dna end
end

(* ****** ****** *)

(* end of [symtbl.dats] *)

(* ****** ****** *)

extern
fun dna_count {n,k:nat | k <= n}
  (tbl: symtbl_t, n: int n, k: int k) : symtbl_t = "dna_count"

(* ****** ****** *)
//
// a linear datatype
//
dataviewtype frqlst = FRQLSTnil | FRQLSTcons of (symbol_t, float, frqlst)

extern
fun sort (frqlst): frqlst

implement
sort (xs) = let
//
typedef kf = @(symbol_t, float)
//
val xs = $UN.castvwtp0{List_vt(kf)}(xs)
//
implement
list_vt_mergesort$cmp<kf>
  (kx1, kx2) = compare (kx2.1, kx1.1)
//
in
  $UN.castvwtp0{frqlst}(list_vt_mergesort<kf> (xs))
end // end of [sort]

(* ****** ****** *)

// print and free
fun print_frqlst
(
  dna: dna_t, kfs: frqlst
) : void =
(
  case+ kfs of
  | ~FRQLSTnil () => ()
  | ~FRQLSTcons (k, f, kfs) =>
    {
      val () = print_symbol (dna, k)
      val () = $extfcall (void, "printf", " %.3f\n", f)
      val () = print_frqlst (dna, kfs)
    }
) // end of [print_frqlst]

(* ****** ****** *)

macdef float(x) = $UN.cast{float}(,(x))

(* ****** ****** *)

fun
write_frequencies
  {n,k:nat | k <= n}
(
  tbl: symtbl_t, n: int n, k: int k
) : void = let
  val tbl = dna_count (tbl, n, k)
  var total: int = (0: int)
  val f = lam
  (
    k: symbol_t, cnt: int, res: &int
  ) : void =<cloptr1> (res := res + cnt)
  val () = symtbl_fold{int}(tbl, f, total)
  val () = cloptr_free ($UN.castvwtp0{cloptr(void)}(f))
  val ftotal = float(total)
  var frqs: frqlst = FRQLSTnil ()
  val f = lam
  (
    k: symbol_t, cnt: int, res: &frqlst
  ) : void =<cloptr1>
  let
    val fval = 100 * float(cnt) / ftotal in res := FRQLSTcons (k, fval, res)
  end // end of [lam]
  val () = symtbl_fold{frqlst}(tbl, f, frqs)
  val () = cloptr_free ($UN.castvwtp0{cloptr(void)}(f))
in
  print_frqlst (symtbl_dna tbl, sort(frqs))
end // end of [write_frequencies]

(* ****** ****** *)

%{^
typedef char *charptr ;
%} ;
abstype charptr = $extype"charptr"

(* ****** ****** *)

fun
write_count
  {n,k:nat}
(
  tbl: symtbl_t, n: int n, seq: string k
) : void = let
  val k = string1_length seq
  val k = g1uint2int_size_int (k)
  val () = assert (k <= n)
  val tbl = dna_count (tbl, n, k)
  val cnt = symtbl_search (tbl, seq)
in
  $extfcall (void, "printf", "%d\t%s\n", cnt, $UN.cast{charptr}(seq))
end // end of [write_count]

(* ****** ****** *)

typedef string_int = [n:nat] (string n, int n)

extern fun getline (): string
extern fun getrest (): string_int

dataviewtype charlst (int) =
  | charlst_nil (0)
  | {n:nat} charlst_cons (n+1) of (char, charlst n)

#define nil charlst_nil
#define cons charlst_cons
#define :: charlst_cons

extern fun charlst_is_nil {n:nat} (cs: &charlst n): bool (n == 0) =
  "charlst_is_nil"

implement
charlst_is_nil (cs) =
  case+ cs of nil () => true | cons _ => false

extern fun
charlst_uncons {n:pos} (cs: &charlst n >> charlst (n-1)): char =
  "charlst_uncons"

implement charlst_uncons (cs) =
  let val ~(c :: cs_r) = cs in cs := cs_r; c end

extern fun
string_make_charlst_int {n:nat} (cs: charlst n, n: int n): string n =
  "string_make_charlst_int"

#define i2c char_of_int

implement getline () = let
  fun loop {n:nat} (cs: charlst n, n: int n): string =
    let val i = getchar0 () in
      if i >= 0 then let
        val c = int2char0 (i)
      in
        if c <> '\n' then loop (charlst_cons (c, cs), n+1)
        else string_make_charlst_int (cs, n)
      end else begin
        string_make_charlst_int (cs, n)
      end
   end // end of [loop]
in
  loop (charlst_nil (), 0)
end // end of [getline]

implement getrest () = let
  fun loop {n:nat} (cs: charlst n, n: int n): string_int =
    let val i = getchar0 () in
      if i >= 0 then let
        val c = int2char0 (i)
      in
        if c <> '\n' then
          loop (charlst_cons (toupper c, cs), n+1)
        else loop (cs, n)
      end else begin
        @(string_make_charlst_int (cs, n), n)
      end
    end // end of [let]
in
  loop (charlst_nil (), 0)
end // end of [getrest]

(* ****** ****** *)

extern
castfn dna_of_string (s: string): dna_t
extern fun is_three (s: string): bool = "is_three"

%{$

atstype_bool
is_three (
  atstype_ptr s0
) {
  char *s = (char*) s0 ;
//
  if ( *s != '>') return atsbool_false ; ++s ;
  if ( *s != 'T') return atsbool_false ; ++s ;
  if ( *s != 'H') return atsbool_false ; ++s ;
  if ( *s != 'R') return atsbool_false ; ++s ;
  if ( *s != 'E') return atsbool_false ; ++s ;
  if ( *s != 'E') return atsbool_false ;
//
  return atsbool_true ;
} // end of [is_three]

%} // end of [%{$]

implement
main0 (argc, argv) = let
//
fun
dna_three_get
(
) : string_int = let
  val s = getline ()
  val () = assert (s <> "")
  val is3 = is_three (s)
in
  if is3 then getrest () else dna_three_get ()
end // end of [dna_three_get]
//
val (dna_three, n) = dna_three_get ()
val dna_three = dna_of_string dna_three
val dna_table = symtbl_make (dna_three, 0x40000)
val () = assert (n >= 2)
//
in
//
write_frequencies (dna_table, n, 1) ; print_newline () ;
write_frequencies (dna_table, n, 2) ; print_newline () ;
//
write_count (dna_table, n, "GGT") ;
write_count (dna_table, n, "GGTA") ;
write_count (dna_table, n, "GGTATT") ;
write_count (dna_table, n, "GGTATTTTAATT") ;
write_count (dna_table, n, "GGTATTTTAATTTATAGT") ;
//
end // end of [main0]

(* ****** ****** *)

%{$

atstype_ptr
dna_count (
  atstype_ptr tbl
, atstype_int n, atstype_int k
) {
  symbol_t sym ; int i, nk = n - k ;

  symtbl_clear (tbl) ;
  i = 0 ; 
  while (i <= nk) {
    ++i ; sym.beg = i ; sym.len= k ;
    symtbl_insert (tbl, sym, 0) ;
  }
  return tbl ;
} // end of [dna_count]

atstype_ptr
string_make_charlst_int (
  atstype_ptr cs, const atstype_int n
) {
  char *s0, *s;
  s0 = atspre_malloc_gc(n+1) ;
  s = s0 + n ; *s = '\0' ; --s ;
  while (!charlst_is_nil(&cs)) { *s = charlst_uncons(&cs) ; --s ; }
  return s0 ;
} // end of [string_make_charlst_int]

%} // end of [%{$]

(* ****** ****** *)

(* end of [k-nucleotide.dats] *)
