#include
"share/atspre_define.hats"
#include 
"share/atspre_staload.hats"

staload "contrib/libats-/wdblair/prelude/SATS/error.sats"

staload "../SATS/symbol.sats"
staload "../SATS/library.sats"

(* ******* ****** *)

typedef hello_func = () -> void

(* ******* ****** *)

implement main0 () = let
  val opt = library_open_lazy ("./libhello.so")
in
  case+ opt of
    | Error (msg) => 
      println! ("Problem loading library:", msg)
    | Ok (lib) => let
      val syms = lib.symbols
      val hiopt = lib.fetch {hello_func} ("hello")
    in
      case+ hiopt of
        | Error (msg) =>
          println! ("Could not fetch hello function:", msg)
        | Ok (hi) => hi()

    end 
     
end


