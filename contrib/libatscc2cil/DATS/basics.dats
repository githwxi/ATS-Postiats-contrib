(*
** For writing ATS code
** that translates into CIL
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2cilpre_"
#define
ATS_STATIC_PREFIX "_ats2cilpre_list_"
//
(* ****** ****** *)
//
staload "./../basics_il.sats"
//

#define  void [mscorlib]System.Console::WriteLine()
#define atspre_print_string void [mscorlib]System.Console::WriteLine(string)
#define atspre_print_int void [mscorlib]System.Console::WriteLine(int32)
#define ATSCKpat_int ceq
#define ATSCKpat_bool ceq
#define ATSCKpat_string bool [mscorlib]System.String::Equals(string,string)
//
(* ****** ****** *)
//
implement
  ATSCKiseqz(x) = x == 0
implement
  ATSCKisneqz(x) = x != 0
//
(* ****** ****** *)
//
implement
ATSCKpat_int(tmp, given) = tmp == given
//
implement
ATSCKpat_bool(tmp, given) = tmp == given
//
