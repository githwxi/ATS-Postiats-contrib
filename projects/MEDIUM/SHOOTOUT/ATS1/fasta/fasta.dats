(*
** The Computer Language Shootout
** http://shootout.alioth.debian.org/
** 
** contributed by Hongwei Xi (hwxi AT cs DOT bu DOT edu)
**
** compilation command:
**   atscc -O3 fasta2.dats -msse2 -mfpmath=sse -o fasta2
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

macdef float(x) = $UN.cast{float}(,(x))

(* ****** ****** *)

local

#define IM 139968
#define IA 3877
#define IC 29573

var state: int = 42
val state = ref_make_viewptr{int}(view@state | addr@state)

in (*in-of-local*)

fn random_gen
  (MAX: float): float = let
  val () = !state := (!state * IA + IC) mod IM in (MAX * float(!state)) / IM
end // end of [random_gen]

end // end of [local]

(* ****** ****** *)

typedef amino = @{ c= char, p= float }
typedef aminoarr (n:int) = @[amino][n] // amino array of size n

fn make_cumulative {n:nat}
  (table: &aminoarr(n), n: size_t n): void = let
  fun loop {i:nat | i <= n} .<n-i>. (
      table: &aminoarr(n), n: size_t n, i: int i, prob: float
    ) : void =
    if n > i then let
      val prob = prob + table.[i].p in
      table.[i].p := prob; loop (table, n, i+1, prob)
    end // end of [if]
  // end of [loop]
in
  loop (table, n, 0, 0.0f)
end // end of [make_cumulative]

(* ****** ****** *)

extern fun fwrite_substring {m,p,n:nat | p + n <= m}
  (str: string m, beg: size_t p, n: size_t n, out: FILEref): void
  = "fasta_fwrite_substring"

extern fun fputc (c: char, out: FILEref): void = "fasta_fputc"

extern fun fwrite_byte {bsz,n:nat | n <= bsz}
  (buf: &bytes (bsz), n: size_t n, out: FILEref):<> sizeLte n
  = "fasta_fwrite_byte"

(* ****** ****** *)

#define WIDTH 60
#define WIDTH1 61

macdef byte(c) = $UN.cast{byte}(,(c))

(* ****** ****** *)

fn repeat_fasta {len:nat} {n:nat}
  (out: FILEref, str: string len, n: size_t n): void = let
  macdef WIDTH_sz = i2sz (WIDTH)
  val len = string1_length str; val () = assert (len >= WIDTH_sz)
  fun loop {n,pos:nat | pos <= len}
    (out: FILEref, n: size_t n, pos: size_t pos):<cloref1> void =
    if n > WIDTH_sz then let
      val left = len - pos in
      if left >= WIDTH_sz then begin
        fwrite_substring (str, pos, WIDTH_sz, out); fputc ('\n', out);
        loop (out, n - WIDTH_sz, pos + WIDTH_sz)
      end else begin
        fwrite_substring (str, pos, left, out);
	fwrite_substring (str, i2sz(0), WIDTH_sz - left, out); fputc ('\n', out);
	loop (out, n - WIDTH_sz, WIDTH_sz - left)
      end // end of [if]
    end else let
      val left = len - pos in
      if left >= n then begin
        fwrite_substring (str, pos, n, out); fputc ('\n', out)
      end else begin
        fwrite_substring (str, pos, left, out);
	fwrite_substring (str, i2sz(0), n-left, out); fputc ('\n', out)
      end // end of [if]
    end (* end of [if] *)
  // end of [loop]
in
  loop (out, n, i2sz(0))
end // end of [repeat_fasta]

fun random_char {n:pos} {l:addr} (
    pf_tbl: !aminoarr(n) @ l | p_tbl: ptr l, n: size_t n, prob: float
  ) : char = let
  prval (pf1, pf2) = array_v_uncons {amino} (pf_tbl)
in
  if prob >= p_tbl->p then let
    prval () = __meta_info () where {
      extern praxi __meta_info (): [n > 1] void // a piece of meta information
    } // end of [prval]
    val ans = random_char (pf2 | ptr_succ<amino>(p_tbl), n - 1, prob)
    prval () = pf_tbl := array_v_cons {amino} (pf1, pf2)
  in
    ans
  end else let
    val ans = p_tbl->c
    prval () = pf_tbl := array_v_cons {amino} (pf1, pf2)
  in
    ans
  end (* end of [if] *)
end // end of [random_char]

fun random_buf
  {n:pos} {i,len,bsz:nat | i <= len; len <= bsz}
  (tbl: &aminoarr(n), buf: &bytes(bsz), n: size_t n, len: size_t len, i: size_t i)
  : void =
  if i < len then let
    val c = random_char (view@tbl | addr@tbl, n, random_gen (1.0f))
    val () = buf.[i] := byte(c)
  in
    random_buf (tbl, buf, n, len, i+1)
  end (* end of [if] *)
// end of [random_buf]

fun random_fasta
  {n:pos}{len:nat}
(
  out: FILEref, tbl: &aminoarr(n), n: size_t n, len: size_t len
) : void = () where {
  macdef WIDTH = i2sz (WIDTH)
  fun loop
    {len:nat} .<len>.
  (
    out: FILEref
  , tbl: &aminoarr(n), buf: &bytes(WIDTH1), n: size_t n, len: size_t len
  ) : void =
    if (len > WIDTH) then let
      val () =
        random_buf (tbl, buf, n, WIDTH, i2sz(0))
      val _(*int*) = fwrite_byte (buf, succ(WIDTH), out)
    in
      loop (out, tbl, buf, n, len-WIDTH)
    end else let
      val () =
        random_buf (tbl, buf, n, len, i2sz(0))
      val _(*int*) = fwrite_byte (buf, len, out)
      val () = fputc ('\n', out)
    in
      // empty
    end // end of [loop]
  val () = make_cumulative (tbl, n)
  var buf = @[byte][WIDTH1]((*void*))
  prval () = view@buf := b0ytes2bytes_v (view@buf)
  val () = buf.[WIDTH] := byte('\n')
  val () = loop (out, tbl, buf, n, len)
} // end of [random_fasta]

val alu ="\
GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG\
GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA\
CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT\
ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA\
GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG\
AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC\
AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"

//

implement
main0 (argc, argv) =
{
val () = assertloc (argc = 2)
val n = g1ofg0_int (g0string2int (argv[1]))
val () = assertloc (n >= 0)
//
val ASZ =
$arrpsz{amino}
(
  @{c='a', p=0.27f}
, @{c='c', p=0.12f}
, @{c='g', p=0.12f}
, @{c='t', p=0.27f}
, @{c='B', p=0.02f}
, @{c='D', p=0.02f}
, @{c='H', p=0.02f}
, @{c='K', p=0.02f}
, @{c='M', p=0.02f}
, @{c='N', p=0.02f}
, @{c='R', p=0.02f}
, @{c='S', p=0.02f}
, @{c='V', p=0.02f}
, @{c='W', p=0.02f}
, @{c='Y', p=0.02f}
) // end of [val]
var iub_sz: size_t
val iub = arrpsz_get_ptrsize (ASZ, iub_sz)
//
val ASZ =
$arrpsz{amino}(
  @{c='a', p=0.3029549426680f}
, @{c='c', p=0.1979883004921f}
, @{c='g', p=0.1975473066391f}
, @{c='t', p=0.3015094502008f}
) // end of [val]
var homo_sz: size_t
val homo = arrpsz_get_ptrsize (ASZ, homo_sz)
//
val () = fprint (stdout_ref, ">ONE Homo sapiens alu\n")
val () = repeat_fasta (stdout_ref, alu, i2sz (2 * n))
//
val () =
fprint (stdout_ref, ">TWO IUB ambiguity codes\n")
//
val (pf | p) =
  arrayptr_takeout_viewptr (iub)
val () = random_fasta (stdout_ref, !p, iub_sz, i2sz (3 * n))
prval () = arrayptr_addback (pf | iub)
//
val ((*void*)) = arrayptr_free (iub)
//
val () =
fprint (stdout_ref, ">THREE Homo sapiens frequency\n")
//
val (pf | p) =
  arrayptr_takeout_viewptr (homo)
val () = random_fasta (stdout_ref, !p, homo_sz, i2sz (n * 5))
prval () = arrayptr_addback (pf | homo)
//
val ((*void*)) = arrayptr_free (homo)
//
} // end of [main]

(* ****** ****** *)

%{^

atstype_void
fasta_fwrite_substring
(
  atstype_ptr str, atstype_size beg
, atstype_size len, atstype_ptr out
) {
  fwrite_unlocked(((char*)str)+beg, 1, len, (FILE*)out) ; return ;
}

atstype_void fasta_fputc
(
  atstype_char c, atstype_ptr out
) {
  fputc_unlocked ((char)c, (FILE*)out) ; return ;
} // end of [fasta_fputc]

atstype_size fasta_fwrite_byte
(
  atstype_ptr buf, atstype_size n, atstype_ptr fil
) {
  return fwrite_unlocked ((void*)buf, (size_t)1, (size_t)n, (FILE*)fil) ;
} // end of [fasta_fwrite_byte]

%}

(* ****** ****** *)

(* end of [fasta.dats] *)
