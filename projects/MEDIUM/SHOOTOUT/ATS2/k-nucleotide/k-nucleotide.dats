(*
** The Great Computer Language Shootout
** http://shootout.alioth.debian.org/
**
** contributed by Hongwei Xi (gmhwxiATgmailDOTcom)
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libc/SATS/string.sats"

(* ****** ****** *)

implement
fileref_get_line_string$bufsize<> () = 64

(* ****** ****** *)
//
extern
fun
fileref_get_rest (inp: FILEref): Strptr0
//
implement
fileref_get_rest
  (inp) = let
//
vtypedef
res = List0_vt(Strptr1)
//
fun loop
  (lines: res): res = let
in
  if fileref_isnot_eof (inp) then let
    val line = fileref_get_line_string (inp)
    val lines = list_vt_cons (line, lines)
  in
    loop (lines)
  end else lines // end of [if]
end // end of [loop]
//
val lines = loop (list_vt_nil)
val lines = list_vt_reverse (lines)
//
in
  strptrlst_concat (lines)
end // end of [fileref_get_rest]
//
(* ****** ****** *)
//
extern
fun
fileref_get_three (inp: FILEref): Strptr0
//
implement
fileref_get_three
  (inp) = let
//
val line =
fileref_get_line_string(inp)
val sgn0 = strncmp ($UN.strptr2string(line), ">THREE", i2sz(6))
val ((*void*)) = free (line)
//
in
  if sgn0 != 0 then fileref_get_three (inp) else fileref_get_rest (inp)
end // end of [fileref_get_three]

(* ****** ****** *)

%{^
//
static
int C__mychar2int[256] = { 0 } ;
static
char C__myint2char[4] = {'A', 'C', 'T', 'G'} ;
//
%} // end of [%{^]

extern
fun
C__mychar2int_initize (): void
implement
C__mychar2int_initize () =
{
//
  val p0 = $extval(ptr, "C__mychar2int")
//
  val A = char2u2int0 ('A')
  val ()= $UN.ptr0_set_at<int> (p0, A, 0)
  val C = char2u2int0 ('C')
  val ()= $UN.ptr0_set_at<int> (p0, C, 1)
  val T = char2u2int0 ('T')
  val ()= $UN.ptr0_set_at<int> (p0, T, 2)
  val G = char2u2int0 ('G')
  val ()= $UN.ptr0_set_at<int> (p0, G, 3)
} (* end of [C__mychar2int_initize] *)

(* ****** ****** *)

extern
fun
mychar2int (c: char): int
implement
mychar2int (c) = let
  val i = char2u2int0 (c)
in
  $UN.ptr0_get_at($extval(ptr, "C__mychar2int"), i)
end // end of [myint2char]

(* ****** ****** *)

extern
fun
myint2char (int: natLt(4)): char
implement
myint2char (i) = $UN.ptr0_get_at($extval(ptr, "C__myint2char"), i)

(* ****** ****** *)

abstype dna = ptr
absvtype symtbl (a:t@ype) = ptr

(* ****** ****** *)

extern
fun{
a:t@ype
} symbol_lsl (key: a, k: Nat): a

implement
symbol_lsl<uint32> (key, k) = key << k
implement
symbol_lsl<uint64> (key, k) = key << k

(* ****** ****** *)

extern
fun{
a:t@ype
} symbol_lnot (key: a): a

implement
symbol_lnot<uint32> (key) = ~key
implement
symbol_lnot<uint64> (key) = ~key

(* ****** ****** *)

extern
fun{
a:t@ype
} symbol_lor (key1: a, key2: a): a

implement
symbol_lor<uint32> (key1, key2) = key1 lor key2
implement
symbol_lor<uint64> (key1, key2) = key1 lor key2

(* ****** ****** *)

extern
fun{
a:t@ype
} symbol_land (key1: a, key2: a): a

implement
symbol_land<uint32> (key1, key2) = key1 land key2
implement
symbol_land<uint64> (key1, key2) = key1 land key2

(* ****** ****** *)

extern
fun{
a:t@ype
} string2symbol (key: string): a

implement
{a}(*tmp*)
string2symbol
  (key) = let
//
val key = g1ofg0 (key)
//
fun
loop{n:nat} .<n>.
(
  key: string(n), res: a
) : a = let
in
//
if string_isnot_empty (key)
  then loop (key.tail, symbol_lor (symbol_lsl (res, 2), $UN.cast{a}(mychar2int(key[0])))) else res
//
end // end of [if]
//
in
  loop (key, $UN.cast{a}(0))
end // end of [string2symbol]

(* ****** ****** *)
//
extern
fun{
a:t@ype
} print_symbol (key: a, k: int): void
//
extern
fun
print_symbol32 (key: uint32, k: int): void
extern
fun
print_symbol64 (key: uint64, k: int): void
//
(* ****** ****** *)
//
implement
print_symbol32
  (key, k) = let
in
//
if
k > 0
then let
  val key2 = key >> 2
  val ((*void*)) = print_symbol32 (key2, k-1)
in
  print_char(myint2char($UN.cast{natLt(4)}(key land $UN.cast{uint32}(0x3))))
end // end of [then]
else () // end of [else]
//
end // end of [print_symbol32]
implement
print_symbol<uint32> = print_symbol32
//
implement
print_symbol64
  (key, k) = let
in
//
if
k > 0
then let
  val key2 = key >> 2
  val ((*void*)) = print_symbol64 (key2, k-1)
in
  print_char(myint2char($UN.cast{natLt(4)}(key land $UN.cast{uint64}(0x3))))
end // end of [then]
else () // end of [else]
//
end // end of [print_symbol64]
implement
print_symbol<uint64> = print_symbol64
//
(* ****** ****** *)

extern
fun{
a:t@ype
} symtbl_make (cap: intGte(1)): symtbl(a)

(* ****** ****** *)

extern
fun{a:t@ype} symtbl_free (tbl: symtbl(a)): void

(* ****** ****** *)

extern
fun{
a:t@ype
} symtbl_incby1
  (tbl: !symtbl(a), key: a): void

(* ****** ****** *)

extern
fun{
a:t@ype
} symtbl_get_count
  (tbl: !symtbl(a), key: a): (int)
extern
fun{
a:t@ype
} symtbl_get_total (tbl: !symtbl(a)): (int)

(* ****** ****** *)

extern
fun{
a:t@ype
} symtbl_listize
  (tbl: symtbl(a)): List0_vt @(a, int)

(* ****** ****** *)
//
staload "libats/SATS/hashfun.sats"
staload "libats/SATS/hashtbl_linprb.sats"
//
staload _(*anon*) = "libats/DATS/hashfun.dats"
(*
staload _(*anon*) = "libats/DATS/linmap_list.dats"
*)
staload _(*anon*) = "libats/DATS/hashtbl_linprb.dats"
//
implement
hashtbl_linprb_keyitm_is_null<uint32,int> (kx) = (kx.1 = 0)
implement
hashtbl_linprb_keyitm_is_null<uint64,int> (kx) = (kx.1 = 0)
//
local

assume
symtbl (a:t@ype) = hashtbl (a, int)

in (*in-of-local*)

implement
{a}(*tmp*)
symtbl_make (cap) =
  hashtbl_make_nil<a,int> (i2sz(cap))

(* ****** ****** *)

implement
{a}(*tmp*)
symtbl_free (tbl) = hashtbl_free<a,int> (tbl)

(* ****** ****** *)

implement
{a}(*tmp*)
symtbl_incby1
  (tbl, key) = let
//
val cp =
hashtbl_search_ref<a,int> (tbl, key)
val isnot = isneqz (cp)
//
in
//
if
isnot
then let
  val (
    pf, fpf | p
  ) = $UN.cptr_vtake (cp)
  val ((*void*)) = !p := succ (!p)
  prval ((*void*)) = fpf (pf)
in
  // nothing
end // end of [then]
else let
  val-~None_vt() =
    hashtbl_insert_opt<a,int> (tbl, key, 1)
  // end of [val]
in
  // nothing
end // end of [else]
//
end // end of [symtbl_incby1]

(* ****** ****** *)

implement
{a}(*tmp*)
symtbl_get_count
  (tbl, key) = let
//
val opt =
  hashtbl_search_opt<a,int> (tbl, key)
//
in
//
case+ opt of ~Some_vt (n) => n | ~None_vt () => 0
//
end // end of [symtbl_get_count]

(* ****** ****** *)

implement
{a}(*tmp*)
symtbl_get_total
  (tbl) = let
//
implement
hashtbl_foreach$fwork<a,int><int>
  (key, cnt, total) = total := total + cnt
//
var total: int = 0
val ((*void*)) =
  hashtbl_foreach_env<a,int><int> (tbl, total)
//
in
  total
end // end of [symtbl_get_total]

(* ****** ****** *)

implement
{a}(*tmp*)
symtbl_listize (tbl) = hashtbl_listize<a,int> (tbl)

end // end of [local]

(* ****** ****** *)
//
extern
fun{
a:t@ype
} symbol_extend (key: a, c: char): a
//
extern
fun{
a:t@ype
} dna_count
  {n,k:nat | k <= n}
  (dna: dna, tbl: !symtbl(a), n: int n, k: int k): void
//
implement
{a}(*tmp*)
dna_count
(
  dna, tbl, n, k
) = let
//
val mask = $UN.cast{a}(~1)
val mask = symbol_lsl<a> (mask, 2*k)
val mask = symbol_lnot<a> (mask)
//
implement
symbol_extend<a>
  (key, c) = let
  val key = symbol_lsl<a> (key, 2)
  val key = symbol_land<a> (mask, key)
in
  symbol_lor<a> (key, $UN.cast{a}(mychar2int(c)))
end // end of [symbol_extend]
//
fun aux0
(
  p: ptr, k: int, key: &a >> _
) : ptr =
(
if k > 0
  then let
    val c =
      $UN.ptr0_get<char> (p)
    // end of [val]
    val () = key := symbol_extend (key, c)
  in
    aux0 (ptr_succ<char> (p), k - 1, key)
  end // end of [then]
  else (p) // end of [else]
)
//
var key: a
prval () =
__assert (view@key) where
{
  extern
  praxi __assert(pf: !(a?)@key >> (a)@key): void
}
//
val p0 = $UN.cast2ptr(dna)
val p1 = aux0 (p0, k, key)
val () = symtbl_incby1 (tbl, key)
val key = key
//
fun aux1
(
  tbl: !symtbl(a), p: ptr, nk: int, key: a
) : void =
(
if
nk > 0
then let
  val c =
    $UN.ptr0_get<char> (p)
  // end of [val]
  val key = symbol_extend (key, c)
  val () = symtbl_incby1 (tbl, key)
in
  aux1 (tbl, ptr_succ<char> (p), nk-1, key)
end // end of [then]
else () // end of [else]
)
//
val () = aux1 (tbl, p1, n - k, key)
//
in
  // nothing
end // end of [dna_count]

(* ****** ****** *)

extern
fun{
a:t@ype
} print_keyfrequencies
  (kfs: List0_vt @(a, float), k: int): void

implement
{a}(*tmp*)
print_keyfrequencies
  (kfs, k) = let
in
//
case+ kfs of
| ~list_vt_nil () => ()
| ~list_vt_cons (kf, kfs) =>
  {
    val () = print_symbol<a> (kf.0, k)
    val () = $extfcall (void, "printf", " %.3f\n", kf.1)
    val () = print_keyfrequencies<a> (kfs, k)
  }
//
end // end of [print_keyfrequencies]

(* ****** ****** *)

extern
fun{
a:t@ype
} write_frequencies
  {n,k:nat}
(
  dna: dna, n: int n, k: int k
) : void // end of [write_frequencies]

(* ****** ****** *)

implement
{a}(*tmp*)
write_frequencies
  (dna, n, k) = let
//
val () = assertloc (n >= k)
//
val tbl = symtbl_make<a> (1024)
val ((*void*)) = dna_count (dna, tbl, n, k)
//
val ftotal =
  $UN.cast{float}(symtbl_get_total<a> (tbl))
//
val kxs = symtbl_listize<a> (tbl)
//
typedef ki = (a, int) and kf = (a, float)
//
local
implement
list_vt_mapfree$fopr<ki><kf>
  (kx) = (kx.0, 100.0f*kx.1/ftotal)
in(*in-of-local*)
val kfs = list_vt_mapfree<ki><kf> (kxs)
end // end of [local]
//
local
implement
list_vt_mergesort$cmp<kf>
  (kf1, kf2) = compare (kf2.1, kf1.1)
in(*in-of-local*)
val kfs = list_vt_mergesort<kf> (kfs)
end // end of [local]
//
in
  print_keyfrequencies (kfs, k)
end // end of [write_frequencies]

(* ****** ****** *)

%{^
typedef char *charptr ;
%} ;
abstype charptr = $extype"charptr"
  
(* ****** ****** *)

extern
fun{
a:t@ype
} write_count
  {n:nat}
(
  dna: dna, n: int n, key: string
) : void // end of [write_frequencies]

(* ****** ****** *)

implement
{a}(*tmp*)
write_count
  (dna, n, key) = let
//
val k = length(key)
val k = g1ofg0_uint (k)
val k = g1uint2int_size_int (k)
val () = assertloc (n >= k)
//
val tbl = symtbl_make<a> (1024*1024)
val ((*void*)) = dna_count (dna, tbl, n, k)
//
val key2 = string2symbol<a> (key)
val cnt = symtbl_get_count (tbl, key2)
val ((*void*)) = symtbl_free (tbl)
//
in
  $extfcall (void, "printf", "%d\t%s\n", cnt, $UN.cast{charptr}(key))
end // end of [write_frequencies]
  
(* ****** ****** *)
//
implement
hash_key<uint32> (x) =
  $UN.cast{ulint}(inthash_jenkins(x))
implement
hash_key<uint64> (x) =
  $UN.cast{ulint}(inthash_jenkins($UN.cast{uint32}(x)))
//
implement
gequal_val<uint32> (x1, x2) = (x1 = x2)
implement
gequal_val<uint64> (x1, x2) = (x1 = x2)
//
(* ****** ****** *)

implement
main0 () = () where
{
//
val () = C__mychar2int_initize ()
//
(*
val i = 0
val () = println! ("myint2char(", i, ") = ", myint2char(i))
val i = 1
val () = println! ("myint2char(", i, ") = ", myint2char(i))
val i = 2
val () = println! ("myint2char(", i, ") = ", myint2char(i))
val i = 3
val () = println! ("myint2char(", i, ") = ", myint2char(i))
*)
//
(*
val c = 'A'
val () = println! ("mychar2int(", c, ") = ", mychar2int(c))
val c = 'C'
val () = println! ("mychar2int(", c, ") = ", mychar2int(c))
val c = 'T'
val () = println! ("mychar2int(", c, ") = ", mychar2int(c))
val c = 'G'
val () = println! ("mychar2int(", c, ") = ", mychar2int(c))
*)
//
val dna =
fileref_get_three(stdin_ref)
val () = assertloc(ptrcast(dna) > 0)
val dna = strptr2strnptr(dna)
prval () = lemma_strnptr_param (dna)
//
local
implement(env)
strnptr_foreach$fwork<env>
  (c, env) =
(
  c := $UN.cast{charNZ}(toupper(c))
) (* end of [strnptr_foreach$fwork] *)
in (*in-of-local*)
val dna_len = strnptr_foreach<> (dna)
end // end of [local]
//
val dna = $UN.castvwtp0{dna}(dna)
val dna_len = g1uint2int_size_int (dna_len)
//
(*
val () = println! ("dna_len = ", dna_len)
*)
//
val () =
write_frequencies<uint32> (dna, dna_len, 1)
val () = print_newline ()
val () =
write_frequencies<uint32> (dna, dna_len, 2)
val () = print_newline ()
//
val () = write_count<uint32> (dna, dna_len, "GGT")
val () = write_count<uint32> (dna, dna_len, "GGTA")
val () = write_count<uint32> (dna, dna_len, "GGTATT")
val () = write_count<uint32> (dna, dna_len, "GGTATTTTAATT")
val () = write_count<uint64> (dna, dna_len, "GGTATTTTAATTTATAGT")
//
} (* end of [main0] *)

(* ****** ****** *)

local
//
#include "prelude/DATS/filebas.dats"
//
in (* nothing *) end // end of [local]

(* ****** ****** *)

(* end of [k-nucleotide.dats] *)
