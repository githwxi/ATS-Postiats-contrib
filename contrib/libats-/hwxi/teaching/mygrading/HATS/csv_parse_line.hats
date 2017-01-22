(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the 17th of July, 2016
//
(* ****** ****** *)
//
#ifdef
MYGRADING_HATS
#then
#else
//
extern
fun
csv_parse_line_nerr
(
  line: string, nerr: &int >> _
) : List0_vt(Strptr1)
//
#endif // #ifdef
//
(* ****** ****** *)

local
//
staload
UN = "prelude/SATS/unsafe.sats"
//
staload
SBF = "libats/SATS/stringbuf.sats"
vtypedef stringbuf = $SBF.stringbuf
//
staload
_(*SBF*) = "libats/DATS/stringbuf.dats"
//
extern
fun{}
getpos(): int
//
extern
fun{}
is_end(): bool
//
extern
fun{}
char_get(): int
extern
fun{}
char_get1(): int
extern
fun{}
char_incby1(): void
extern
fun{}
char_getinc(): int
//
in (* in-of-local *)
//
implement
csv_parse_line_nerr
  (line, nerr) = let
//
local
var _i: int = 0
in
val p_i = addr@_i
end // local
//
macdef
get_i() = $UN.ptr0_get<int>(p_i)
macdef
inc_i() = $UN.ptr0_addby<int>(p_i, 1)
macdef
set_i(i0) = $UN.ptr0_set<int>(p_i, ,(i0))
//
val line = g1ofg0(line)
val len0 = sz2i(length(line))

(* ****** ****** *)

implement
getpos<>() = get_i()
//
implement
is_end<>() = get_i() >= len0
//
implement
char_get<>() = let
  val i = get_i()
  val i = ckastloc_gintGte(i, 0)
//
in
  if i < len0 then char2u2int0(line[i]) else ~1
end // end of [char_get]
implement
char_get1<>() = let
  val i = get_i()
  val i1 = ckastloc_gintGte(i+1, 0)
//
in
  if i1 < len0 then char2u2int0(line[i1]) else ~1
end // end of [char_get]
implement
char_getinc<>() = let
  val i = get_i()
  val i = ckastloc_gintGte(i, 0)
//
in
  if i < len0 then (inc_i(); char2u2int0(line[i])) else ~1
end // end of [char_getinc]

(* ****** ****** *)
//
macdef
COMMA = char2u2int0(',')
macdef
DQUOTE = char2u2int0('"')
//
(* ****** ****** *)

fun
parse_char
(
  c0: int
, nerr: &int >> _
) : bool = let
//
val c1 = char_getinc()
//
in
//
if c1 >= 0
  then (
    if c0 != c1
      then (nerr := nerr+1; parse_char(c0, nerr)) else true
    // end of [if]
  ) (* end of [then] *)
  else (false)
//
end // end of [parse_char]

local
//
fun
parse_item_loop1
(
  sbf: !stringbuf, nerr: &int >> _
) : Strptr1 = let
//
val c1 =
  g1ofg0(char_get())
//
in
//
if
c1 >= 0
then (
//
if (
c1 != COMMA
) then (
    inc_i();
    (if c1 > 0 then
      ignoret($SBF.stringbuf_insert_char(sbf, $UN.cast{charNZ}(c1)))
    ) ; parse_item_loop1(sbf, nerr)
  ) (* end of [then] *)
  else (
    $SBF.stringbuf_takeout_all(sbf)
  ) (* end of [else] *)
) (* end of [then] *)
else ($SBF.stringbuf_takeout_all(sbf))
//
end // end of [parse_item_loop1]
//
fun
parse_item_loop2
(
  sbf: !stringbuf, nerr: &int >> _
) : Strptr1 = let
//
val c1 =
  g1ofg0(char_get())
//
in
//
if
c1 >= 0
then
(
//
if (
c1 != DQUOTE
) then (
    inc_i();
    (if c1 > 0 then let
      val c1 = $UN.cast{charNZ}(c1)
    in
      ignoret($SBF.stringbuf_insert_char(sbf, c1))
    end); parse_item_loop2(sbf, nerr)
  ) (* end of [then] *)
  else let
    val c2 = char_get1()
  in
    if (
      c2 != DQUOTE
    ) then let
        val () = inc_i()
      in
        $SBF.stringbuf_takeout_all(sbf)
      end // end of [then]
      else let
        val () = inc_i()
        val () = inc_i()
        val () = ignoret($SBF.stringbuf_insert_char(sbf, '"'))
      in
        parse_item_loop2(sbf, nerr)
      end // end of [else]
  end // end of [then]
) (* end of [then] *)
else let
  val () = nerr := nerr + 1
in
  $SBF.stringbuf_takeout_all(sbf)
end // end of [else]
//
end // end of [parse_item_loop2]
//
in

fun
parse_item
(
  sbf: !stringbuf, nerr: &int >> _
) : Strptr1 = let
//
val c0 = char_get()
//
in
//
if (
c0 != DQUOTE
) then (
    parse_item_loop1(sbf, nerr)
  ) else let
    val () = inc_i()
  in
    parse_item_loop2(sbf, nerr)
  end // end of [else]
//
end // end of [parse_item]

end // end of [local]

vtypedef
res_vt = List0_vt(Strptr1)

fun
parse_itemlst
(
  sbf: !stringbuf, nerr: &int >> _
) : res_vt = let
//
fun
auxlst
(
  sbf: !stringbuf, nerr: &int >> _, res: res_vt
) : res_vt = let
//
val c0 = char_get()
//
in
//
if
c0 >= 0
then let
//
  val x0 = parse_item(sbf, nerr)
  val res = list_vt_cons(x0, res)
  val cont = parse_char(COMMA, nerr)
//
in
  if cont
    then auxlst(sbf, nerr, res) else res
  // end of [if]
end // end of [then]
else let
//
  val x0 = string_nil()
  prval() = lemma_strnptr_param(x0)
//
in
  list_vt_cons(strnptr2strptr(x0), res)
end (* end of [else] *)
//
end // end of [auxlst]
//
in
//
if char_get() >= 0
  then list_vt_reverse(auxlst(sbf, nerr, list_vt_nil))
  else list_vt_nil((*void*))
//
end // end of [parse_itemlst]

in
//
res where
{
//
val
sbf =
$SBF.stringbuf_make_nil(1024)
//
val
res = parse_itemlst(sbf, nerr)
//
val ((*freed*)) = $SBF.stringbuf_free(sbf)
//
} (* end of [where] *)
//
end // end of [csv_parse_line_nerr]

end // end of [local]

(* ****** ****** *)

(* end of [csv_parse_line.hats] *)
