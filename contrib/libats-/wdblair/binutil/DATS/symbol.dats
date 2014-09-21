(**
  Symbols in Object Files.  
*)

#define ATS_DYNLOADFLAG 0

staload "contrib/libats-/wdblair/binutil/SATS/symbol.sats"

assume symbol = string

implement
symbol_make (str) = str
