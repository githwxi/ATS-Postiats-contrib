(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
datatype
symbol =
SYMBOL of (string(*name*), int(*stamp*))
//
(* ****** ****** *)

assume symbol_type = symbol

(* ****** ****** *)

local

staload SYMCNT =
{
//
#include "share/atspre_define.hats"
//
staload
_(*anon*) = "prelude/DATS/integer.dats"
//
#include "{$LIBATSHWXI}/globals/HATS/gcount.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

staload SYMBOL =
{
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef key = string
typedef itm = symbol
//
#define CAPACITY 4096
//
staload
"libats/SATS/hashtbl_linprb.sats"
//
implement hashtbl$recapacitize<> () = 1
//
#include "{$LIBATSHWXI}/globals/HATS/ghashtbl_linprb.hats"
//
} (* end of [staload] *)

in (* in-of-local *)

implement
symbol_make (name) = let
//
val cp = $SYMBOL.search_ref (name)
//
in
//
if isneqz(cp)
  then $UNSAFE.cptr_get<symbol> (cp)
  else let
    val n = $SYMCNT.getinc () in SYMBOL (name, n)
  end // end of [else]
//
end // end of [symbol_make]

end // end of [local]

(* ****** ****** *)

implement
fprint_symbol
  (out, x) = let
  val+SYMBOL (name, n) = x in fprint! (out, name, "(", n, ")")
end // end of [fprint_symbol]

(* ****** ****** *)

(* end of [atsparemit_symbol.dats] *)
