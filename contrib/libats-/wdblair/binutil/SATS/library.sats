(**
  An interface to manage shared object files.
  
  It uses libbfd along with dlopen, dlsym, and dlclose
  to provide a basic interface.
*)

#define ATS_STALOADFLAG 0
#define ATS_DYNLOADFLAG 0

staload "contrib/libats-/wdblair/prelude/SATS/error.sats"

%{#
#include "contrib/libats-/wdblair/binutil/CATS/library.cats"
%}

staload "contrib/libats-/wdblair/binutil/SATS/symbol.sats"

abstype library = ptr

fun
library_open_lazy (string): ErrorString (library)

fun
library_get_symbols (library): ErrorString (symbollst)

overload .symbols with library_get_symbols

fun
library_fetch_symbol {a:type} (
  lib: library, sym_name: string
): ErrorString (a)

overload .fetch with library_fetch_symbol

fun
library_close (library): void
