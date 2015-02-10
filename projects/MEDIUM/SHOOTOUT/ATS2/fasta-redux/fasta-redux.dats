(*
** The Computer Language Shootout
** http://shootout.alioth.debian.org/
** 
** Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
*)

(* ****** ****** *)
//
// HX-2014-06-05
//
(* ****** ****** *)

%{^
#undef ATSextfcall
#define ATSextfcall(f, args) f args
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libc/SATS/stdio.sats"  
staload "libc/SATS/string.sats"  
  
(* ****** ****** *)

#define LINE_LENGTH 60
#define LINE_LENGTH1 61
#define LOOKUP_SIZE 4096

(* ****** ****** *)

macdef float (i) = $UN.cast{float}(,(i))

(* ****** ****** *)

val LOOKUP_SCALE = $UN.cast{float}(LOOKUP_SIZE-1)

(* ****** ****** *)

%{^
typedef
unsigned int random_t ;
%}
abst@ype random_t = uint

(* ****** ****** *)
//
extern
fun
random_init
  (seed: &random_t? >> _): void
//
extern
fun
random_next_lookup
  (seed: &random_t): float = "mac#"
//
(* ****** ****** *)

local

assume random_t = uint

in (*in-of-local*)

implement
random_init (seed) = seed := 42u

local
#define IA 3877
#define IC 29573
#define IM 139968
in(*in-of-local*)
implement
random_next_lookup
  (seed) = let
//
val x = g0u2i(seed)
val x_new = (x * IA + IC) mod IM
val () = seed := g0i2u (x_new)
//
in
  x_new * (LOOKUP_SCALE/IM)
end // end of [rand_next_lookup]
end // end of [local]

end // end of [local]

(* ****** ****** *)

%{^
#define fwrite fwrite_unlocked
%} // end of [%{^]
  
(* ****** ****** *)

extern
fun repeat (alu: string, title: string, n: int): void

(* ****** ****** *)

implement
repeat (alu, title, n) = let
//
val alu = g1ofg0 (alu)
val len = string_length (alu)
val len2 = len + i2sz(LINE_LENGTH)
val bufp = $extfcall (ptr, "alloca", len2)
val bufp = g1ofg0 (bufp)
val _(*ptr*) = memcpy_unsafe (bufp, string2ptr(alu), len)
val bufp2 = ptr_add<char> (bufp, len)
val _(*ptr*) = memcpy_unsafe (bufp2, string2ptr(alu), i2sz(LINE_LENGTH))
//
val _(*err*) = fputs (title, stdout_ref)
//
fun loop
(
  n: int, pos: size_t
) : void = let
  val bufp2 = ptr_add<char> (bufp, pos)
in
//
if
n > LINE_LENGTH 
then let
  val () = $extfcall
    (void, "fwrite", bufp2, LINE_LENGTH, 1, stdout_ref)
  val _(*err*) = fputc ('\n', stdout_ref)
  val n = n - LINE_LENGTH
  val pos = pos + i2sz(LINE_LENGTH)
in
  if pos >= len then loop (n, pos-len) else loop (n, pos)
end // end of [then]
else let
  val () = $extfcall
    (void, "fwrite", bufp2, n(*line_length*), 1, stdout_ref)
  val _(*err*) = fputc ('\n', stdout_ref)    
in
  // nothing
end // end of [else]
//
end // end of [loop]
//
in
  loop (n, i2sz(0))
end // end of [repeat]

(* ****** ****** *)

%{^
//
typedef 
struct
amino_acid
{
  char sym;
  float prob;
  float cprob_lookup;
} amino_acid_t ;
//
amino_acid_t
aminoacids[] =
{
   { 'a', 0.27 },
   { 'c', 0.12 },
   { 'g', 0.12 },
   { 't', 0.27 },
   { 'B', 0.02 },
   { 'D', 0.02 },
   { 'H', 0.02 },
   { 'K', 0.02 },
   { 'M', 0.02 },
   { 'N', 0.02 },
   { 'R', 0.02 },
   { 'S', 0.02 },
   { 'V', 0.02 },
   { 'W', 0.02 },
   { 'Y', 0.02 },
} ;
//
amino_acid_t
homosapiens[] = {
  { 'a', 0.3029549426680 },
  { 'c', 0.1979883004921 },
  { 'g', 0.1975473066391 },
  { 't', 0.3015094502008 },
} ;
//
extern
void
randomize
(
  amino_acid_t *amino_acid
, int amino_acid_size,
  const char *title, int n, random_t *seed
) ;
//
%}

(* ****** ****** *)
//
extern
val aminoacids: ptr = "mac#"
and homosapiens: ptr = "mac#"
//
(* ****** ****** *)

typedef
amino_acid_t =
$extype_struct"amino_acid_t" of
{
  sym= char, prob= float, cprob_lookup= float
}

(* ****** ****** *)

extern
fun
lookup_fill{n:pos}
(
  lookup: &array(ptr, LOOKUP_SIZE)
, A: &array(amino_acid_t, n), n: int(n)
) : void = "ext#" // end of [lookup_fill]

(* ****** ****** *)

implement
lookup_fill{n}
(
  lookup, A, n
) = () where
{
//
typedef t = amino_acid_t
//
fun loop
(
  A: &array(t, n), i: natLte(n), cp: float
) : void =
if i < n then let
  val cp = cp + A.[i].prob
  val () = A.[i].cprob_lookup := cp*LOOKUP_SCALE
in
  loop (A, i+1, cp)
end else () // end of [if]
//
fun auxind
(
  A: &array(t, n), i: int, j: natLt(n)
) : natLt(n) =
  if A.[j].cprob_lookup < (float)i
    then auxind (A, i, $UN.cast{natLt(n)}(j+1)) else j
// end of [auxind]
//
fun auxinit 
(
  lookup: &array(ptr, LOOKUP_SIZE)
, A: &array(t, n), i: natLte(LOOKUP_SIZE)
) : void =
  if i < LOOKUP_SIZE then let
    val j = auxind (A, i, 0)
    val () = lookup[i] := addr@(A.[j])
  in
    auxinit (lookup, A, i + 1)
  end else ((*exit*)) // end of [if]
//
val () = loop (A, 0, 0.0f)
val () = A.[n-1].cprob_lookup := LOOKUP_SCALE
val () = auxinit (lookup, A, 0)
//
} (* end of [lookup_fill] *)

(* ****** ****** *)

%{^
#define \
unlikely(x) __builtin_expect((x), 0)
%} // end of [%{^]
extern
fun unlikely (x:bool): bool = "mac#"

(* ****** ****** *)

(*
extern
fun
lookup_find
(
  lookup: &array(ptr, LOOKUP_SIZE), r: float
) : char // end of [lookup_find]
//
implement
lookup_find
  (lookup, r) = let
//
fun
get_sym
  (p: ptr): char = let
  val (pf, fpf | p) = $UN.ptr0_vtake{amino_acid_t}(p)
  val res = p->sym
  prval ((*void*)) = fpf (pf)
in
  res
end // end of [get_sym]
fun
get_cprob_lookup
  (p: ptr): float = let
  val (pf, fpf | p) = $UN.ptr0_vtake{amino_acid_t}(p)
  val res = p->cprob_lookup
  prval ((*void*)) = fpf (pf)
in
  res
end // end of [get_cprob_lookup]
//
val i =
$UN.cast{natLt(LOOKUP_SIZE)}(r)
var p: ptr = lookup.[i]
//
val () = while (unlikely(get_cprob_lookup(p) < r)) (p := ptr_succ<amino_acid_t> (p))
//
in
  get_sym (p)
end // end of [lookup_find]
*)

(* ****** ****** *)

extern
fun
randomize{n:pos}
(
  A: &array(amino_acid_t, n), n: int(n)
, title: string, ntot: int, seed: &random_t
) : void = "mac#" // end of [randomize]

(* ****** ****** *)

(*
implement
randomize
(
  A, n, title, ntot, seed
) = let
//
var lookup = @[ptr][LOOKUP_SIZE]()
var buffer = @[char][LINE_LENGTH1]()
//
val p_lookup = addr@lookup
val p_buffer = addr@buffer
val ((*void*)) =
$UN.ptr0_set_at<char> (p_buffer, LINE_LENGTH, '\n')
//
val (pf, fpf | p) =
$UN.ptr0_vtake{array(ptr,LOOKUP_SIZE)}(addr@lookup)
val () = lookup_fill (!p, A, n)
prval ((*void*)) = fpf (pf)
//
val err = fputs (title, stdout_ref)
//
fun loop
(
  i: int, j: int, seed: &random_t
) : void = let
in
//
if
i < ntot
then let
  var j: int = j
  val () =
  if j = LINE_LENGTH then
  {
    val () = j := 0
    val () = $extfcall
      (void, "fwrite", p_buffer, LINE_LENGTH1, 1, stdout_ref)
    // end of [val]
  }
  val j = j
  val r = random_next_lookup (seed)
//
  val (pf, fpf | p_lookup) =
    $UN.ptr0_vtake{array(ptr,LOOKUP_SIZE)}(p_lookup)
  val sym = lookup_find (!p_lookup, r)
  prval ((*void*)) = fpf (pf)
//
  val () = $UN.ptr0_set_at<char> (p_buffer, j, sym)
in
  loop (i+1, j+1, seed)
end // end of [then]
else let
  val () = $UN.ptr0_set_at<char> (p_buffer, j, '\n')
in
  $extfcall (void, "fwrite", p_buffer, j + 1, 1, stdout_ref)
end // end of [else]
//
end // end of [loop]
//
in
  loop (0, 0, seed)
end // end of [randomize]
*)

(* ****** ****** *)

%{$
//
#define LINE_LENGTH 60
#define LOOKUP_SIZE 4096
//
void
randomize
(
  amino_acid_t *A, int asz,
  const char *title, int ntot, random_t *seed
) {
  char buffer[LINE_LENGTH + 1];
  amino_acid_t *lookup[LOOKUP_SIZE];
  int i, j;

  buffer[LINE_LENGTH] = '\n';
  lookup_fill(lookup, A, asz);
  fputs(title, stdout);
//
  for
  (
    i = 0, j = 0; i < ntot; i++, j++
  ) {
    if (j == LINE_LENGTH) {
      j = 0;
      fwrite(buffer, LINE_LENGTH + 1, 1, stdout);
    }
    float r = random_next_lookup(seed);
    struct amino_acid *u = lookup[(short)r];
    while (unlikely(u->cprob_lookup < r)) ++u;
    buffer[j] = u->sym;
  } // end of [for]
//
  buffer[j] = '\n';
  fwrite(buffer, j + 1, 1, stdout);
  return ;
}
%}


(* ****** ****** *)

val alu = "\
GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTG\
GGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGA\
GACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAA\
AATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAAT\
CCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAAC\
CCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTG\
CACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\
" // end of [val]

(* ****** ****** *)

%{^
#define \
ARRAYSIZE(A) (sizeof(A)/sizeof(A[0]))
%} // end of [%{^]

(* ****** ****** *)

extern
fun ARRAYSIZE (A: ptr): intGte(0) = "mac#"

(* ****** ****** *)

implement
main0 (argc, argv) = let
//
var ntot: int = 512
val () = if argc >= 2 then ntot := g0string2int(argv[1])
val ntot = ntot
val () = assertloc (ntot >= 0)
var seed: random_t
val () = random_init (seed)
//
val () = repeat (alu, ">ONE Homo sapiens alu\n", ntot*2)
//
val [n:int] n = g1ofg0(ARRAYSIZE(aminoacids))
val (pf, fpf | p) =
  $UN.ptr0_vtake{array(amino_acid_t,n)}(aminoacids)
val () = assertloc (n > 0)
(*
val () = println! ("aminoacids: n = ", n)
*)
val () = randomize (!p, n, ">TWO IUB ambiguity codes\n", ntot*3, seed)
prval ((*void*)) = fpf (pf)
//
val [n:int] n = g1ofg0(ARRAYSIZE(homosapiens))
val (pf, fpf | p) =
  $UN.ptr0_vtake{array(amino_acid_t,n)}(homosapiens)
val () = assertloc (n > 0)
(*
val () = println! ("homosapiens: n = ", n)
*)
val () = randomize (!p, n, ">THREE Homo sapiens frequency\n", ntot*5, seed)
prval ((*void*)) = fpf (pf)
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [fasta-redux.dats] *)
