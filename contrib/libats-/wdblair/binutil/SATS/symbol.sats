(**
  An interface to manage symbols.
*)

%{#
#include "contrib/libats-/wdblair/binutils/CATS/library.cats"
%}

abstype symbol = ptr
typedef symbollst = List0 (symbol)

fun
symbol_make (string): symbol

fun
symbol_get_name (symbol): string

overload .name with symbol_get_name
