(*
** libatscc-common
*)
(* ****** ****** *)
//
typedef
fun0 (b:vt0p) = () -<fun1> b
typedef
fun1 (a:t0p, b:vt0p) = (a) -<fun1> b
typedef
fun2 (a1:t0p, a2:t0p, b:vt0p) = (a1, a2) -<fun1> b
typedef
fun3 (a1:t0p, a2:t0p, a3: t0p, b:vt0p) = (a1, a2, a3) -<fun1> b
//
(* ****** ****** *)
//
typedef
cfun0 (b:vt0p) = () -<cloref1> b
typedef
cfun1 (a:t0p, b:vt0p) = (a) -<cloref1> b
typedef
cfun2 (a1:t0p, a2:t0p, b:vt0p) = (a1, a2) -<cloref1> b
typedef
cfun3 (a1:t0p, a2:t0p, a3: t0p, b:vt0p) = (a1, a2, a3) -<cloref1> b
//
stadef cfun = cfun0
stadef cfun = cfun1
stadef cfun = cfun2
stadef cfun = cfun3
//
(* ****** ****** *)
//
fun
cloref2fun0
  {b:vt0p}(cfun0(b)): fun0(b) = "mac#%"
//
fun
cloref2fun1
  {a:t0p;b:vt0p}(cfun1(a, b)): fun1(a, b) = "mac#%"
//
fun
cloref2fun2
  {a1,a2:t0p;b:vt0p}
  (cfun2(a1, a2, b)): fun2(a1, a2, b) = "mac#%"
fun
cloref2fun3
  {a1,a2,a3:t0p;b:vt0p}
  (cfun3(a1, a2, a3, b)): fun3(a1, a2, a3, b) = "mac#%"
//
(* ****** ****** *)

(* end of [basics.sats] *)
