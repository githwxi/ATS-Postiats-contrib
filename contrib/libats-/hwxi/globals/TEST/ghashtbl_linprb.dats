(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"libats/SATS/hashtbl_linprb.sats"
//
(* ****** ****** *)
//
staload _ = "libats/DATS/hashfun.dats"
staload _ = "libats/DATS/hashtbl_linprb.dats"
//
(* ****** ****** *)

local
//
typedef key = string
typedef itm = int(*0/1*)
//
#define CAPACITY 1024
//
(*
implement hashtbl$recapacitize<> () = 0
*)
//
in (* in of [local] *)

#include "./../HATS/ghashtbl_linprb.hats"

end // end of [local]

(* ****** ****** *)

(* end of [ghashtbl_linprb.dats] *)
