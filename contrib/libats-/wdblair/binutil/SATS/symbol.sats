(**
  An interface to manage symbols.
*)

#define ATS_STALOADFLAG 0
#define ATS_DYNLOADFLAG 0

%{#
#include "contrib/libats-/wdblair/binutil/CATS/library.cats"
%}

abstype symbol = ptr
typedef symbollst = List0 (symbol)

fun
symbol_make (string): symbol

fun
symbol_get_name (symbol): string

overload .name with symbol_get_name
