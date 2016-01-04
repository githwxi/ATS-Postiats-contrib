(*
** For trying out some OOP ideas
*)

(* ****** ****** *)

staload "./OOPLATS.sats"

(* ****** ****** *)
//
implement
{}(*tmp*)
toval_int (x) = VALint(x)
implement
{}(*tmp*)
toval_double (x) = VALfloat(x)
implement
{}(*tmp*)
toval_string (x) = VALstring(x)
//
(* ****** ****** *)
//
implement
print_value(x) = fprint (stdout_ref, x)
implement
print_object(x) = fprint (stdout_ref, x)
//
(* ****** ****** *)

(* end of [OOPLATS_basics.dats] *)
