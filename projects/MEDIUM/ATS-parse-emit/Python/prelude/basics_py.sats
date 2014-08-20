(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "atspre2py_"
//
(* ****** ****** *)
//
typedef
cfun1 (a:t0p, b:t0p) = (a) -<cloref1> b
typedef
cfun2 (a1:t0p, a2:t0p, b:t0p) = (a1, a2) -<cloref1> b
//
stadef cfun = cfun1
stadef cfun = cfun2
//
(* ****** ****** *)
//
// HX-2014-08:
// invariant constructors!
//
abstype
pylist_t0ype_type (a:t@ype)
stadef pylist = pylist_t0ype_type
//
abstype
pyset_t0ype_type (a:t@ype)
stadef pyset = pyset_t0ype_type
//
(* ****** ****** *)

(* end of [basics_py.sats] *)
