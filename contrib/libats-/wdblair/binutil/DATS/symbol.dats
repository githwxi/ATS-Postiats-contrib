(**
  Symbols in Object Files.  
*)

staload "contrib/libats-/wdblair/binutil/SATS/symbol.sats"

assume symbol = string

implement
symbol_make (str) = str
