(*
//
// For [libatscc2erl]
//
*)

(* ****** ****** *)

#define ATS_STALOADFLAG 0

(* ****** ****** *)
//
fun
atscc2erl_main0_exn
  {n:pos}
(
  argc: int(n), argv: &(@[string][n])
) : void = "ext#libatscc2erl_atscc2erl_main0"
//
fun
atscc2erl_main0_opt
  {n:pos}
(
  argc: int(n), argv: &(@[string][n])
) : bool = "ext#libatscc2erl_atscc2erl_main0_opt"
//
(* ****** ****** *)
//
datatype
comarg =
//
| COMARGstrlit of string
//
| COMARGstrinp of string
//
| COMARGprefil of string
| COMARGpostfil of string
//
typedef comarglst0 = List0(comarg)
typedef comarglst1 = List1(comarg)
//
(* ****** ****** *)
//
fun
comarg_strlit
  (x: string): comarg
  = "ext#libatscc2erl_comarg_strlit"
fun
comarg_strinp
  (x: string): comarg
  = "ext#libatscc2erl_comarg_strinp"
//
fun
comarg_prefil
  (x: string): comarg
  = "ext#libatscc2erl_comarg_prefil"
fun
comarg_postfil
  (x: string): comarg
  = "ext#libatscc2erl_comarg_postfil"
//
(* ****** ****** *)
//
fun
comarglst_nil
(
// argumentless
) : comarglst0 = "ext#libatscc2erl_comarglst_nil"
fun
comarglst_cons
(
  x: comarg, xs: comarglst0
) : comarglst1 = "ext#libatscc2erl_comarglst_cons"
//
(* ****** ****** *)
//
fun
libatscc2erl_dynload
  ((*initialize*)): void = "ext#libatscc2erl_dynload"
//
(* ****** ****** *)

datatype
atscc2erlres =
ATSCC2ERLRES of
(
  int(*nerr*)
, string(*stdout*), string(*stderr*)
)

(* ****** ****** *)
//
fun
atscc2erl_main0_arglst
  {n:pos}
(
  args: list(comarg, n)
) : int(*nerr*) = "ext#libatscc2erl_atscc2erl_main0_arglst"
//
(* ****** ****** *)

(* end of [libatscc2erl_ext.sats] *)
