(*
** HTML 2 ATS/Postiats
**
** For simplifying the task of writing HTML-producing functions
** in ATS/Postiats.
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
#define
LIBXML2_targetloc "$PATSHOMERELOC/contrib/libxml2/libxml"
//
(* ****** ****** *)
//
staload "{$LIBXML2}/SATS/xml0.sats"
staload _ = "{$LIBXML2}/DATS/xml0.dats"
//
(* ****** ****** *)

staload "{$LIBXML2}/SATS/tree.sats"
staload "{$LIBXML2}/SATS/parser.sats"
staload "{$LIBXML2}/SATS/HTMLparser.sats"

(* ****** ****** *)

#define ATS_DYNARGS_TOP "ats-dynargs"
#define ATS_CALL "ats-call"
#define ATS_IMPL "ats-impl"
#define ATS_TMP "tmp"
#define ATS_FUN "fun"
#define ATS_TMPARGS "tmpargs"
#define ATS_GENARGS "genargs"
#define ATS_DYNARGS "dynargs"
#define ATS_DLR "$"
#define ATS_LBRACE "{"
#define ATS_RBRACE "}"
#define ATS_ESCAPE "\\"

(* ****** ****** *)
//
// Parsing of embedded variables and expressions
//

%{^
ATSinline()
atstype_bool
ATSPRELUDE_STRNPTR_IS_ATEND(atstype_strptr s, atstype_size i) {
  return (s[i]) == '\000'? atsbool_true : atsbool_false;
}
ATSinline()
atstype_void
ATSPRELUDE_STRBUF_INIT(atstype_ptrk sbf) {
  ((atstype_char*)sbf)[0] = '\000';
}
ATSinline()
atstype_size
ATSPRELUDE_STRBUF_PUT(atstype_ptrk sbf, atstype_size i, atstype_char c) {
  ((atstype_char*)sbf)[i] = c;
  return i+1;
}
ATSinline()
atstype_void
ATSPRELUDE_STRBUF_FIN(atstype_ptrk sbf, atstype_size i) {
  ((atstype_char*)sbf)[i] = '\000';
}
ATSinline()
atstype_char
ATSPRELUDE_STRBUF_GET_AT(atstype_ptrk sbf, atstype_size i) {
  return ((atstype_char*)sbf)[i];
}
%}

extern
fun
strnptr_is_atend
  {l:agz}{n:int}{i:nat | i <= n}
  (s: !strnptr (l, n), i: size_t (i)):<> bool (i==n) = "mac#ATSPRELUDE_STRNPTR_IS_ATEND"

extern
fun
strbuf_is_atend
  {m,n,i:int | i <= n}
  (s: &strbuf (m, n), i: size_t (i)):<> bool (i==n) = "mac#ATSPRELUDE_STRNPTR_IS_ATEND"
extern
fun
strbuf_get_at
  {m,n,i:int | i < n}
  (s: &strbuf (m, n), i: size_t (i)):<> charNZ = "mac#ATSPRELUDE_STRBUF_GET_AT"

// "extended" (for lack of better word)
abst@ype estrbuf (m:int, n:int) // size same as strbuf (m, n)

extern
castfn
strbuf_init {m:int | m > 0} (
  &b0ytes(m) >> estrbuf (m, 0)
): void = "mac#ATSPRELUDE_STRBUF_INIT"
extern
castfn
strbuf_clear {m,n:int} (
  !estrbuf (m, n) >> estrbuf (m, 0)
): void
extern
fun
strbuf_reset {m,n:int | m > 0} (
  &strbuf (m, n) >> estrbuf (m, 0)
): void = "mac#ATSPRELUDE_STRBUF_INIT"
extern
fun
strbuf_extend {m,n:int; n+1 < m} (
  sbf: &estrbuf (m, n) >> estrbuf (m, n+1), size_t n, c: charNZ
): size_t (n+1) = "mac#ATSPRELUDE_STRBUF_PUT"
extern
fun
strbuf_finalize {m,n:int; n < m} (
  sbf: &estrbuf (m, n) >> strbuf (m, n), size_t n
): void = "mac#ATSPRELUDE_STRBUF_FIN"

datatype TOKTYPE =
  | TT_TEXT
  | TT_VAR
  | TT_EXPR
datatype ERRTYPE =
  | ET_INVALID_CHARACTER
  | ET_PREMATURE_EOF
  | ET_OVERFLOW // buffer overflowed

extern
fun
fprint_TOKTYPE (FILEref, TOKTYPE): void
overload fprint with fprint_TOKTYPE

extern
fun
print_TOKTYPE (TOKTYPE): void
overload print with print_TOKTYPE

extern
fun
fprint_ERRTYPE (FILEref, ERRTYPE): void
overload fprint with fprint_ERRTYPE
extern
fun
print_ERRTYPE (ERRTYPE): void
overload print with print_ERRTYPE

extern
fun{env:vt@ype}
paremit$fwork {m,n:int} (
  TOKTYPE, &strbuf (m, n), &(env) >> _
): void
extern
fun{env:vt@ype}
paremit$err {l:agz}{n,i:int | i <= n} (
  ERRTYPE
, !strnptr (l, n), size_t i, &(env) >> _
, string(*message*)
): void

extern
fun{env:vt@ype}
paremit_env {l:agz} {n:int} (
  !strnptr (l, n)
, env: &(env) >> _
): void

implement
fprint_TOKTYPE (out, tp) =
  case+ tp of
  | TT_TEXT () => fprint_string (out, "text")
  | TT_VAR () => fprint_string (out, "variable")
  | TT_EXPR () => fprint_string (out, "expression")
implement
print_TOKTYPE (tp) = fprint_TOKTYPE (stdout_ref, tp)

implement
fprint_ERRTYPE (out, et) =
  case+ et of
  | ET_INVALID_CHARACTER () => fprint_string (out, "invalid character")
  | ET_PREMATURE_EOF () => fprint_string (out, "premature EOF")
  | ET_OVERFLOW () => fprint_string (out, "buffer overflow")
implement
print_ERRTYPE (et) = fprint_ERRTYPE (stdout_ref, et)

implement{env}
paremit_env {l} {n} (str, env) = let
//
  #define BUFSIZ 16384
  typedef Sbuf (k:int) = estrbuf (BUFSIZ, k)
//
  fun
  aux {n,j,k1:nat | j <= n; k1+1 <= BUFSIZ} (
    str: !strnptr (l, n)
  , j: size_t j
  , k: size_t k1
  , sbf: &Sbuf (k1) >> Sbuf (k2)
  , env: &(env) >> _
  ): #[k2:int | k2+1 <= BUFSIZ] size_t k2 =
    if strnptr_is_atend (str, j) then let
      // flush the text, if any
      val () =
        if :(sbf: Sbuf (0)) => k > (i2sz)0 then let
          val () = strbuf_finalize (sbf, k)
          val () = paremit$fwork<env> (TT_TEXT, sbf, env) in
          strbuf_reset (sbf)
        end
      // end of [val]
    in
      (i2sz)0
    end else let
      val j0 = j
      val c = strnptr_get_at (str, j)
    in
      case+ c of
      | '\\' => let
          val j = succ(j)
        in
          if strnptr_is_atend (str, j) then let
            val () = paremit$err<env> (ET_PREMATURE_EOF, str, j, env, "looking for {, }, \\ or $")
          in
            k
          end else let
            val c1 = strnptr_get_at (str, j)
          in
            case+ 0 of
            | _ when c1 = '$' || c1 = '\{' || c1 = '}' || c1 = '\\' =>
              // okay to overflow here, just emit the existing TEXT you got so far
              if succ(k) < BUFSIZ then let
                val k = strbuf_extend (sbf, k, c1)
              in
                aux (str, succ(j), k, sbf, env)
              end else let
                val () = strbuf_finalize (sbf, k)
                val () = paremit$fwork<env> (TT_TEXT, sbf, env)
                val () = strbuf_reset (sbf)
                val k = (i2sz)0
                val k1 = strbuf_extend (sbf, k, c1)
              in
                aux (str, succ(j), k1, sbf, env)
              end // end of [if]
            | _ => let
                val () = paremit$err<env> (ET_INVALID_CHARACTER, str, j, env, "looking for {, }, \\ or $")
              in
                k
              end // end of [let]
          end // end of [if]
        end // end of [let]
      | '$' => let
          // flush the text, if any
          val () =
            if :(sbf: Sbuf (0)) => k > (i2sz)0 then let
              val () = strbuf_finalize (sbf, k)
              val () = paremit$fwork<env> (TT_TEXT, sbf, env) in
              strbuf_reset (sbf)
            end
          // end of [val]
          val k = (i2sz)0
          val j = succ(j)
        in
          if strnptr_is_atend (str, j) then let
            val () = paremit$err<env> (ET_PREMATURE_EOF, str, j, env, "looking for alphabetic symbol or {")
          in
            k
          end else let
            val c = strnptr_get_at (str, j)
          in
            case+ 0 of
            | _ when c = '\{' => block (str, succ(j), k, sbf, env, 1)
            | _ when c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' =>
              if succ(k) < BUFSIZ then let
                val k = strbuf_extend (sbf, k, c)
              in
                ident (str, succ(j), k, sbf, env)
              end else let
                val () = strbuf_finalize (sbf, j)
                val () = paremit$err<env> (ET_OVERFLOW, str, j, env, "error")
                val () = strbuf_reset (sbf)
                val k = (i2sz)0
              in
                k
              end // end of [if]
            | _ => let
                val () = paremit$err<env> (ET_INVALID_CHARACTER, str, j, env, "looking for alphabetic symbol or {")
              in
                k
              end
          end // end of [if]
        end // end of [let]
      | _ =>
        // okay to overflow here, just emit the TEXT you got so far
        if succ(k) < BUFSIZ then let
          val k = strbuf_extend (sbf, k, c)
        in
          aux (str, succ(j), k, sbf, env)
        end else let
          val () = strbuf_finalize (sbf, k)
          val () = paremit$fwork<env> (TT_TEXT, sbf, env)
          val () = strbuf_reset (sbf)
          val k = (i2sz)0
          val k = strbuf_extend (sbf, k, c)
        in
          aux (str, succ(j), k, sbf, env)
        end // end of [if]
    end // end of [aux]

  and
  block {n,j,k1:nat | j <= n; k1+1 <= BUFSIZ} (
    str: !strnptr (l, n),  j: size_t j
  , k: size_t k1, sbf: &Sbuf (k1) >> Sbuf (k2)
  , env: &(env) >> _
  , count: int // brace count
  ): #[k2:nat | k2+1 <= BUFSIZ] size_t (k2) =
    if strnptr_is_atend (str, j) then let
      val () = paremit$err<env> (ET_PREMATURE_EOF, str, j, env, "looking for }")
    in
      k
    end else let
      val c = strnptr_get_at (str, j)
    in
      case+ c of
      | '\\' => let
          val j = succ(j)
        in
          if strnptr_is_atend (str, j) then let
            val () = paremit$err<env> (ET_PREMATURE_EOF, str, j, env, "looking for {, }, \\ or $")
          in
            k
          end else let
            val c1 = strnptr_get_at (str, j)
          in
            case+ 0 of
            | _ when c1 = '$' || c1 = '\{' || c1 = '}' =>
              if succ(k) < BUFSIZ then let
                val k = strbuf_extend (sbf, k, c1)
              in
                block (str, succ(j), k, sbf, env, count)
              end else let
                val () = strbuf_finalize (sbf, k)
                val () = paremit$err<env> (ET_OVERFLOW, str, j, env, "error")
                val k = (i2sz)0
                val () = strbuf_reset (sbf)
              in
                k
              end // end of [if]
            | _ => let
                val () = paremit$err<env> (ET_INVALID_CHARACTER, str, j, env, "looking for {, }, \\ or $")
              in
                k
              end // end of [let]
          end // end of [if]
        end // end of [let]
      | '}' => let
          val count = pred(count)
        in
          if count = 0 then let
            // flush the text, if any
            val () =
              if :(sbf: Sbuf (0)) => k > (i2sz)0 then let
                val () = strbuf_finalize (sbf, k)
                val () = paremit$fwork<env> (TT_EXPR, sbf, env) in
                strbuf_reset (sbf)
              end
            val k = (i2sz)0
            val j = succ(j)
            val k2 = aux (str, j, k, sbf, env)
            prval () = lemma_g1uint_param (k2)
          in
            k2
          end else let
            val j = succ(j)
          in
            if succ(k) < BUFSIZ then let
              val k = strbuf_extend (sbf, k, c)
            in
              block (str, j, k, sbf, env, count)
            end else let
              val () = paremit$err<env> (ET_OVERFLOW, str, j, env, "error")
              val k = (i2sz)0
              val () = strbuf_clear (sbf)
            in
              k
            end // end of [if]
          end // end of [if]
        end // end of [let]
      | _ => let
          val j = succ(j)
          val count = if c = '\{' then succ(count) else count
        in
          if succ(k) < BUFSIZ then let
            val k = strbuf_extend (sbf, k, c)
          in
            block (str, j, k, sbf, env, count)
          end else let
            val () = paremit$err<env> (ET_OVERFLOW, str, j, env, "error")
            val k = (i2sz)0
            val () = strbuf_clear (sbf)
          in
            k
          end // end of [if]
      end // end of [let]
    end // end of [if]
  // end of [block]

  and
  ident {n,k1,j:nat | j <= n; k1+1 <= BUFSIZ} (
    str: !strnptr (l, n)
  , j: size_t j
  , k: size_t k1, sbf: &Sbuf (k1) >> Sbuf (k2)
  , env: &(env) >> _
  ): #[k2:nat | k2+1 <= BUFSIZ] size_t (k2) =
    if strnptr_is_atend (str, j) then (
      // flush the text, if any
      if :(sbf: Sbuf (0)) => k > (i2sz)0 then let
        val () = strbuf_finalize (sbf, k)
        val () = paremit$fwork<env> (TT_VAR, sbf, env)
        val () = strbuf_reset (sbf) in
        (i2sz)0
      end else k
    ) else let
      val c = strnptr_get_at (str, j)
    in
      case+ 0 of
      | _ when c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' =>
        if succ(k) < BUFSIZ then let
          val k = strbuf_extend (sbf, k, c)
        in
          ident (str, succ(j), k, sbf, env)
        end else let
          val () = paremit$err<env> (ET_OVERFLOW, str, j, env, "error")
          val k = (i2sz)0
          val () = strbuf_clear (sbf)
        in
          k
        end // end of [if]
      | _ => let
        val () =
          if :(sbf: Sbuf (0)) => k > (i2sz)0 then let
            val () = strbuf_finalize (sbf, k)
            val () = paremit$fwork<env> (TT_VAR, sbf, env) in
            strbuf_reset (sbf)
          end
        // end of [val]
        val k = (i2sz)0
        val k = strbuf_extend (sbf, k, c)
        val k2 = aux (str, succ(j), k, sbf, env)
        prval () = lemma_g1uint_param (k2)
      in
        k2
      end // end of [let]
    end // end of [if]
  // end of [ident]
  prval () = lemma_strnptr_param (str)
  var sbuf = @[byte][BUFSIZ]()
  val () = strbuf_init (sbuf)
  val _ = aux (str, (i2sz)0, (i2sz)0, sbuf, env)
  val () = strbuf_clear (sbuf)
  val () = strbuf_finalize (sbuf, (i2sz)0)
  prval () = strbuf2bytes (sbuf)
in
end // end of [paremit_env]

(* ****** ****** *)
//
fun indent
(
  out: FILEref, n: int
) : void =
  if n > 0 then (fprint (out, ' '); indent (out, n-1))
// end of [indent]

extern
fun
emit_tmpargs {l:addr}{n:int} (out: FILEref, gen: bool, tmpargs: !strnptr (l, n)): void
implement
emit_tmpargs {l}{n} (out, gen, args) = let
  fun
  aux0 {l:agz}{i,n:nat | i <= n} (dynargs: !strnptr (l, n), i: size_t (i), append: bool, gen: bool): void =
    if strnptr_is_atend (dynargs, i) then fprint! (out, (if gen then ")" else ">"):string)
    else let
      val c = strnptr_get_at (dynargs, i)
    in
      case+ 0 of
      | _ when c = ' ' || c = '\n' || c = '\r' || c = '\t' || c = ';' => aux0 (dynargs, succ(i), append, gen)
      | _ => let
          val () = if append then fprint! (out, (if gen then ")(" else "><"):string)
        in
          aux1 (dynargs, i, (i2sz)0, append, gen)
        end // end of [let]
      // end of [case]
    end // end of [if]
  // end of [aux]
  
  and
  aux1 {l:agz}{i,j,n:nat | i < n; i+j <= n} (dynargs: !strnptr (l, n), i: size_t (i), j: size_t (j), fst: bool, gen: bool): void =
    if strnptr_is_atend (dynargs, i+j) then fprint! (out, (if gen then ")" else ">"):string)
    else let
      val c = strnptr_get_at (dynargs, i+j)
    in
      case+ 0 of
      | _ when c = ' ' || c = '\n' || c = '\r' || c = '\t' || c = ';' => aux0 (dynargs, succ(i+j), true, gen)
      | _ => let
          val () = fprint! (out, c)
        in
          aux1 (dynargs, i, succ(j), false, gen)
        end // end of [let]
      // end of [case]
    end // end of [if]
  // end of [aux1]
in
  if strnptr_isnot_null (args) then let    
    prval () = lemma_strnptr_param (args)
    val i = (i2sz)0
    val () = fprint! (out, (if gen then "(" else "<"): string)
  in
    if strnptr_is_atend (args, i) then fprint! (out, (if gen then ")" else ">"):string)
    else aux0 (args, i, false, gen)
  end // end of [if]
end // end of [emit_tmpargs]

extern
fun
emit_dynargs {l:addr}{n:int} (out: FILEref, dynargs: !strnptr (l, n), append: bool): void
implement
emit_dynargs {n} (out, dynargs, append) = let
  fun
  aux0 {l:agz}{i,n:nat | i <= n} (dynargs: !strnptr (l, n), i: size_t (i), append: bool): void =
    if strnptr_is_atend (dynargs, i) then fprint! (out, ")")
    else let
      val c = strnptr_get_at (dynargs, i)
    in
      case+ 0 of
      | _ when c = ' ' || c = '\n' || c = '\r' || c = '\t' || c = ',' => aux0 (dynargs, succ(i), append)
      | _ => let
          val () = if append then fprint! (out, ", ")
        in
          aux1 (dynargs, i, (i2sz)0, append)
        end // end of [let]
      // end of [case]
    end // end of [if]
  // end of [aux]
  
  and
  aux1 {l:agz}{i,j,n:nat | i < n; i+j <= n} (dynargs: !strnptr (l, n), i: size_t (i), j: size_t (j), fst: bool): void =
    if strnptr_is_atend (dynargs, i+j) then fprint! (out, ")")
    else let
      val c = strnptr_get_at (dynargs, i+j)
    in
      case+ 0 of
      | _ when c = ' ' || c = '\n' || c = '\r' || c = '\t' || c = ',' => aux0 (dynargs, succ(i+j), true)
      | _ => let
          val () = fprint! (out, c)
        in
          aux1 (dynargs, i, succ(j), false)
        end // end of [let]
      // end of [case]
    end // end of [if]
  // end of [aux1]
in
  if strnptr_isnot_null (dynargs) then let    
    prval () = lemma_strnptr_param (dynargs)
    val i = (i2sz)0
    val () = if ~append then fprint! (out, "(")
  in
    if strnptr_is_atend (dynargs, i) then fprint! (out, ")")
    else aux0 (dynargs, i, append)
  end // end of [if]
end // end of [emit_dynargs]

//
extern
fun
emit_fun_impl (out: FILEref, filename: string, dynargs: Strptr0): void

implement
emit_fun_impl (out, filename, dynargs) = {
//
val (fpf_filename_base | filename_base) = filename_get_base (filename)
val () = fprint!(out, "implement ")
val base = strptr2strnptr (filename_base)
prval [l:addr] EQADDR () = eqaddr_make_ptr (strnptr2ptr(base))
prval [n:int] EQINT () = lemma_strnptr_eqint (base) where {
  extern
  praxi
  lemma_strnptr_eqint {l:addr}{n:int} (!strnptr (l, n)) : [m:int] EQINT (n, m)
}
prval () = lemma_strnptr_param (base)
val () =
//
if :(base: strnptr(l,n)) => strnptr_isnot_null (base) then let
  implement{env}
  strnptr_foreach$cont (c, env) = (c <> '.')
  implement{env}
  strnptr_foreach$fwork (c, env) = fprint!(out, c)
  prval () = lemma_strnptr_param (base)
  val _ = strnptr_foreach (base)
in
  (*empty*)
end // end of [if]
val () = fprint!(out, " (out")
val dynargs = strptr2strnptr (dynargs)
val () = emit_dynargs (out, dynargs, true)
val () = strnptr_free (dynargs)
val () = fprintln!(out, " = ")
val bas = strnptr2strptr {l}{n} (base)
prval () = fpf_filename_base (bas)
//
} (* end of [emit_fun_impl] *)

(* ****** ****** *)

extern
fun
fprint_strbuf_pats_esc {m,n:int} (out: FILEref, sbf: &strbuf (m, n)): void
implement
fprint_strbuf_pats_esc {m,n} (out, sbf) = let
  fun
  aux {i,n:nat | i <= n} (out: FILEref, sbf: &strbuf (m, n), i: size_t (i)): void =
    if strbuf_is_atend (sbf, i) then ()
    else let
      val c = strbuf_get_at (sbf, i)
      val i = succ(i)
    in
      (
      case+ c of
      | '\n' => fprint! (out, "\\n")
      | '\r' => fprint! (out, "\\r")
      | '\t' => fprint! (out, "\\t")
      | '\f' => fprint! (out, "\\f")
      | '\v' => fprint! (out, "\\v")
      | '\b' => fprint! (out, "\\b")
      | '\\' => fprint! (out, "\\\\")
      | '"' => fprint! (out, "\\\"")
      | _ => fprint! (out, c)
      );
      aux (out, sbf, i)
    end // end of [if]
  // end of [aux]
  prval () = lemma_strbuf_param (sbf)
  prval () = __trustme (sbf) where {
    extern
    prfun
    __trustme {m,n:int} (!strbuf (m, n)): [m > 0;n>=0] void
  } (* end of [prval] *)
in
  aux (out, sbf, (i2sz)0)
end // end of [fprint_strbuf_pats_esc]

extern
fun
fprint_strptr_pats_esc (out: FILEref, s: !Strptr0): void
implement
fprint_strptr_pats_esc (out, s) =
  if strptr_isnot_null (s) then {
    val p = strptr2ptr (s)
    prval (pf_at, fpf) = __trustme (s) where {
      extern
      prfun
      __trustme {l:agz} (
        !strptr (l) >> ptr (l)
      ): #[m,n:int] (strbuf_v (l, m, n), (strbuf_v (l, m, n), ptr (l)) -<lin,prf> strptr (l))
    }
    val () = fprint_strbuf_pats_esc (out, !s)
    prval () = s := fpf (pf_at, p)
  } (* end of [if] *)
// end of [fprint_strptr_pats_esc] *)

(* ****** ****** *)
//
extern
fun treeWalk
(out: FILEref, !xmlDocPtr1, !xmlNodePtr0): void
//
implement
treeWalk (out, doc, node) = let
//
fun auxNode
(
  out: FILEref
, doc: !xmlDocPtr1
, node: !xmlNodePtr0
, nspace: int
) : void = let
//
val p_node = ptrcast (node)
//
in
//
if p_node > 0 then let
  val nodetype = xmlNode_get_type (node)
in
  if nodetype = XML_ELEMENT_NODE then let
    // if node is one of special tags? otherwise, carry on
    // - if special: e.g. call, impl
    // - otherwise: just print it
    //   - look out for text nodes, these might contain what we want to use
    //     - similarly to attribute values, these might contain stuff we want to use
    val name = __name (node)
    val name = xmlString2string (name)
  in
    case+ 0 of
    | _ when name = ATS_CALL => let
        // @fun (name of function to call)
        val attr_fun = xmlGetProp (node, ATS_FUN)
        val attr_fun = xmlStrptr2strptr (attr_fun)
        // @tmpargs (comma-/semicolon-separated list of identifiers for specific template arguments)
        val tmpargs = xmlGetProp (node, ATS_TMPARGS)
        val tmpargs = xmlStrptr2strptr (tmpargs)
        // @dynargs (comma-separated list of identifiers for dynamic arguments)
        val dynargs = xmlGetProp (node, ATS_DYNARGS)
        val dynargs = xmlStrptr2strptr (dynargs)
        val () = indent (out, nspace)
        val () = fprint! (out, "val () = ", attr_fun)
        val tmpargs = strptr2strnptr (tmpargs)
        val () = emit_tmpargs (out, false, tmpargs)
        val dynargs = strptr2strnptr (dynargs)
        val () = emit_dynargs (out, dynargs, false)
        val () = fprintln! (out, " where {")
        // recur
        val (fpf | nodelst) = __children (node)
        val () = auxNode (out, doc, nodelst, nspace+2)
        prval () = minus_addback (fpf, nodelst | node)
        // end
        val () = indent (out, nspace)
        val () = fprintln! (out, "}")
        val () = strptr_free (attr_fun)
        val () = strnptr_free (tmpargs)
        val () = strnptr_free (dynargs)
        // ... stands for something else (e.g. the children of CALL)
      in
      end // end of [let]
    | _ when name = ATS_IMPL => let
        // @tmp (name of function template to implement)
        val tmp = xmlGetProp (node, ATS_TMP)
        val tmp = xmlStrptr2strptr (tmp)
        // @genargs (comma-/semicolon-separated list of identifiers for generic template arguments)
        val genargs = xmlGetProp (node, ATS_GENARGS)
        val genargs = xmlStrptr2strptr (genargs)
        val genargs = strptr2strnptr (genargs)
        // @tmpargs (comma-/semicolon-separated list of identifiers for template arguments)
        val tmpargs = xmlGetProp (node, ATS_TMPARGS)
        val tmpargs = xmlStrptr2strptr (tmpargs)
        val tmpargs = strptr2strnptr (tmpargs)
        // @dynargs (comma-separated list of identifiers for dynamic arguments)
        val dynargs = xmlGetProp (node, ATS_DYNARGS)
        val dynargs = xmlStrptr2strptr (dynargs)
        val dynargs = strptr2strnptr (dynargs)
        // implement tmp<tmpargs> (dynargs) = ...
        // ... stands for something else (e.g. the children of IMPL)
        val () = indent (out, nspace)
        val () = fprint! (out, "implement")
        val () = emit_tmpargs (out, true, genargs)
        val () = fprintln! (out)
        val () = indent (out, nspace)
        val () = fprint! (out, tmp)
        val () = emit_tmpargs (out, false, tmpargs)
        val () = emit_dynargs (out, dynargs, false)
        val () = fprintln! (out, " = {")
        val () = strptr_free (tmp)
        val () = strnptr_free (genargs)
        val () = strnptr_free (tmpargs)
        val () = strnptr_free (dynargs)
        // recur
        val (fpf | nodelst) = __children (node)
        val () = auxNode (out, doc, nodelst, nspace+2)
        prval () = minus_addback (fpf, nodelst | node)
        // end
        val () = indent (out, nspace)
        val () = fprintln! (out, "}")        
      in
      end // end of [let]
    | _ => {
      val () = indent (out, nspace)
      val () = fprintln! (out, "val () = htmlprint_tagname (out, \"", name, "\")")
    //
      val (fpf | proplst) = __properties (node)
      val () = auxAttr (out, doc, proplst, nspace)
      prval () = minus_addback (fpf, proplst | node)
    //
      val () = indent (out, nspace)
      val () = fprintln! (out, "val () = htmlprint_chardata (out)")
    //
      val () = indent (out, nspace)
      val () = fprintln!(out, "val () = {")
      val (fpf | nodelst) = __children (node)
      val () = auxNode (out, doc, nodelst, nspace+2)
      prval () = minus_addback (fpf, nodelst | node)
      val () = indent (out, nspace)
      val () = fprintln!(out, "} (* end of [", name, "] *)")
    //
      val () = indent (out, nspace)
      val () = fprintln! (out, "val () = htmlprint_tagend (out, \"", name, "\")")
    //
      val (fpf | node_next) = __next (node)
      val () = auxNode (out, doc, node_next, nspace)
      prval () = minus_addback (fpf, node_next | node)
    //
    } (* end of [_] *)
  end else if nodetype = XML_TEXT_NODE || nodetype = XML_CDATA_SECTION_NODE then let
    val text = xmlNodeGetContent (node)
    val text = xmlStrptr2strptr (text)
    val text = strptr2strnptr (text)
    local
    implement{env}
    paremit$fwork (toktype, sbf, env) = let
      val () = indent (out, nspace)
    in
      case+ toktype of
      | TT_TEXT () => {
          val () = fprint! (out, "val () = htmlprint_string (out, \"")
          val () = fprint_strbuf_pats_esc (out, sbf)
          val () = fprintln! (out, "\")")
        } (* end of [TT_TEXT] *)
      | TT_VAR () => fprintln! (out, "val () = htmlprint_mac (out, ", sbf, ")")
      | TT_EXPR () => fprintln! (out, "val () = htmlprint_mac (out, ", sbf, ")")
    end // end of [paremit$fwork]
    implement{env}
    paremit$err {l}{n,i} (errtype, str, i, env, msg) =
    {
      val () = fprintln!(out, "error (", errtype, "): i: ", i, ":", msg)
    } (* end of [paremit$err] *)
    in // in-of-local
    var env = (g0ofg1)0
    val () = if ptrcast(text) > 0 then paremit_env<int> (text, env)
    end // end-of-local
    // what other parsing do we have to do?
    // list of whatever(identifiers) separated by , and ; // for dynargs, tmpargs, ats-dynargs
    val () = strnptr_free (text)
    val () = fprintln!(out)
    val (fpf | node_next) = __next (node)
    val () = auxNode (out, doc, node_next, nspace)
    prval () = minus_addback (fpf, node_next | node)
  in
  end else if nodetype = XML_COMMENT_NODE then let
    val text = xmlNodeGetContent (node)
    val text = xmlStrptr2strptr (text)
    val () = indent (out, nspace)
    val () = fprintln!(out, "val () = htmlprint_combeg (out)")
    val () = indent (out, nspace)
    val () = fprint!(out, "val () = htmlprint_string (out, \"")
    val () = fprint_strptr_pats_esc (out, text)
    val () = fprintln!(out, "\")")
    val () = strptr_free (text)
    val () = indent (out, nspace)
    val () = fprintln!(out, "val () = htmlprint_comend (out)")
    val (fpf | node_next) = __next (node)
    val () = auxNode (out, doc, node_next, nspace)
    prval () = minus_addback (fpf, node_next | node)
  in
  end else let
    // otherwise, skip!
    val () = fprintln!(out, "unknown node type!")
    val () = fprintln!(out, $UNSAFE.castvwtp0{int}(nodetype))
    val (fpf | node_next) = __next (node)
    val () = auxNode (out, doc, node_next, nspace)
    prval () = minus_addback (fpf, node_next | node)
  in
    // nothing
  end
end else () // end of [if]
//
end // end of [auxNode]

and auxAttr {l0:agz;l1:agez}
(
  out: FILEref
, doc: !xmlDocPtr(l0)
, attr: !xmlAttrPtr(l1)
, nspace: int
) : void = let
  val p_attr = ptrcast (attr)
in
//
if p_attr > 0 then let
  val name = __name (attr)
  val name = xmlString2string (name)
//
  val () =
  case+ :(doc: xmlDocPtr(l0), attr: xmlAttrPtr(l1)) => 0 of
  | _ when name = ATS_DYNARGS_TOP => ()
  | _ => {
    // NOTE: some special attributes should not be parsed this way!
    val (fpf_children | children) = __children (attr)
    val value = xmlNodeListGetString (doc, children, 1)
    val value = xmlStrptr2strptr (value)
    val value = strptr2strnptr (value)
    val p_value = ptrcast (value)
    val () = indent (out, nspace)
    val () = fprintln! (out, "val () = htmlprint_attrib (out, \"", name, "\")")
    local
    implement{env}
    paremit$fwork (toktype, sbf, env) = let
      val () = indent (out, nspace)
    in
      case+ toktype of
      | TT_TEXT () => {
          val () = fprint! (out, "val () = htmlprint_string (out, \"")
          val () = fprint_strbuf_pats_esc (out, sbf)
          val () = fprintln! (out, "\")")
        } (* end of [TT_TEXT] *)
      | TT_VAR () => fprintln! (out, "val () = htmlprint_mac (out, ", sbf, ")")
      | TT_EXPR () => fprintln! (out, "val () = htmlprint_mac (out, ", sbf, ")")
    end // end of [paremit$fwork]
    implement{env}
    paremit$err {l}{n,i} (errtype, str, i, env, msg) = {
      val () = fprintln!(out, "error (", errtype, "): i: ", i, ":", msg)
    } (* end of [paremit$err] *)
    in // in-of-local
    var env = (g0ofg1)0
    val () = if ptrcast (value) > 0 then paremit_env<int> (value, env)
    end // end-of-local
    val () = strnptr_free (value)
    prval () = minus_addback (fpf_children, children | attr)
  }
//
  val (fpf | attr2) = __next (attr)
  val () = auxAttr (out, doc, attr2, nspace)
  prval () = minus_addback (fpf, attr2 | attr)
in
  // nothing
end else () // end of [if]
//
end // end of [auxAttr]
//
in
  auxNode (out, doc, node, 0)
end // end of [treeWalk]

(* ****** ****** *)

implement
main0 (argc, argv) = (
//
if argc >= 3 then let
//
val filename = argv[1]
val outfile = argv[2]
//
val encoding = stropt_none((*void*))
//
val doc = htmlParseFile (filename, encoding)
//
in
//
if ptrcast (doc) > 0 then {
//
val () = println! ("The file [", filename, "] has been parsed successfully!")
//
val out = fileref_open_exn (outfile, file_mode_w)
val (fpf | root) = xmlDocGetRootElement (doc)
val root_dynargs =
  (if ptrcast (root) > 0 then let
    val root_params = xmlGetProp (root, ATS_DYNARGS_TOP)
    val root_params = xmlStrptr2strptr (root_params)
  in
    root_params
  end else strptr_null ()): Strptr0
val () = emit_fun_impl (out, filename, root_dynargs)
val () = fprintln!(out, "{")
val () = fprintln! (out, "val () = htmlprint_prolog (out)")
val () = treeWalk (out, doc, root)
val () = fprintln!(out, "} (* end of code for [", filename, "] *)")
prval ((*void*)) = minus_addback (fpf, root | doc)
//
val () = xmlFreeDoc (doc)
//
val () = xmlCleanupParser ((*void*))
//
val () = fileref_close (out)
//
} else {
//
val () = prerrln!("parsing failed!")
val () = xmlFreeDoc (doc)
//
} (* end of [if] *)
//
end else println!("Usage: <infile> <outfile>")
//
) (* end of [main] *)

(* ****** ****** *)

(* end of [html2pats.dats] *)
