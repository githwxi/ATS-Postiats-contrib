(*
** Implementing sorts
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./constraint.sats"

(* ****** ****** *)

implement
s2rt_is_int (srt) = 
  case+ srt of
    | S2RTint () => true
    | _ =>> false

implement
s2rt_is_addr (srt) = 
  case+ srt of
    | S2RTaddr () => true
    | _ =>> false

implement
s2rt_is_bool (srt) = 
  case+ srt of
    | S2RTbool () => true
    | _ =>> false

implement
s2rt_is_rat (srt) = 
  case+ srt of
    | S2RTrat () => true
    | _ =>> false
    
implement
s2rt_is_bitvec (srt) =
  case+ srt of
    | S2RTbitvec (_) => true
    | _ =>> false

implement
s2rt_is_array (srt) =
  case+ srt of
    | S2RTarray () => true
    | _ =>> false

implement
s2rt_is_fun (srt) =
  case+ srt of
    | S2RTfun (_, _) => true
    | _ =>> false

implement
s2rt_is_t0ype (srt) =
  case+ srt of
    | S2RTt0ype () => true
    | _ =>> false
    
(* ****** ****** *)

implement
s2rt_bitvec_get_width (srt) =
  case+ srt of
    | S2RTbitvec (width) => width
    | _ =>> ~1
    
(* ****** ****** *)

implement
s2rt_fun_get_num_args (s2rt) = let
  val- S2RTfun (args, _) = s2rt
in
  length (args)
end

implement
s2rt_fun_get_args (s2rt) = let
  val- S2RTfun (args, _) = s2rt
in
  args
end

implement
s2rt_fun_get_ret (s2rt) = let
  val- S2RTfun (_, ret) = s2rt
in
  ret
end

(* ****** ****** *)

implement
fprint_s2rt
  (out, s2t0) = let
in
//
case+ s2t0 of
//
| S2RTint () => fprint (out, "S2RTint()")
| S2RTaddr () => fprint (out, "S2RTaddr()")
| S2RTbool () => fprint (out, "S2RTbool()")
| S2RTcls () => fprint (out, "S2RTcls()")
| S2RTrat () => fprint (out, "S2RTrat()")
| S2RTbitvec (width) => fprint! (out, "S2RTbitvec(", width, ")")
| S2RTarray () => fprint (out, "S2RTarray()")
| S2RTt0ype () => fprint (out, "S2RTt0ype()")
//
| S2RTfun (args, ret) => fprint (out, "S2RTfun()")
| S2RTtup () => fprint (out, "S2RTtup()")
| S2RTerr () => fprint (out, "S2RTerr()")
//
| S2RTignored () => fprint (out, "S2RTignored()")
//
end // end of [fprint_s2rt]

(* ****** ****** *)

(* end of [constraint_s2rt.dats] *)
