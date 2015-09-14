(* ****** ****** *)
//
// For testing libatscc2js
//
(* ****** ****** *)
//

#define ATS_DYNLOADFLAG 0
//

(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"  
  
(* ****** ****** *)

staload "./../SATS/Erlang/file.sats"

(* ****** ****** *)

%{^
%%
-module(test03_dats).
%%
-export([main0_erl/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-include("./../libatscc2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)

extern
fun
main0_erl
(
// argumentless
) : void = "mac#"
//
implement
main0_erl () =
{
//
val-
Some(fname) = ats2get_cwd_opt()
//
val fname2 = filename2string(fname)
//
val ((*void*)) = println! ("file:get_cwd() = ", fname2)
//
val-
Some
fnames =
ats2list_dir_opt
  ($UN.cast{name_all}(fname))
//
val fnames2 = $UN.cast{ERLval}(fnames)
val ((*void*)) = println! ("file:list_dir(", fname, ") = ", fnames2)
//
val-
Some
fnames =
ats2list_dir_all_opt
  ($UN.cast{name_all}(fname))
//
val fnames2 = $UN.cast{ERLval}(fnames)
val ((*void*)) = println! ("file:list_dir_all(", fname, ") = ", fnames2)
//
val binary = ats2read_file_opt($UN.cast{name_all}("test03.dats"))
val ((*void*)) = println! ("read_file(\"test03.dats\") = ", $UN.cast{ERLval}(binary))
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [test03.dats] *)
