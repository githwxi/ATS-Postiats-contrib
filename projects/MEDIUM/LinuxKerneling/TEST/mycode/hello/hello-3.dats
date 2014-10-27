(*
** Following lkmpg/hello-5.c
*)

(* ****** ****** *)
//
// HX-2014-10-22:
// nothing fancy here;
// just trying to get it working
//
(* ****** ****** *)
//
// HX-2014-10-21:
// no use for dynloading
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LINUX}/SATS/init.sats"
staload
"{$LINUX}/SATS/module.sats"
staload
"{$LINUX}/SATS/kernel.sats"
staload $PRINTK // HX: opening NS
//
(* ****** ****** *)

%{^
MODULE_LICENSE("Dual BSD/GPL") ;
%} // end of [%{^]

(* ****** ****** *)

%{^
//
static int myint = 623;
static char *mystring = "mystring";
static int myintarray[3] = { 0, 1, 2 };
//
module_param(myint, int, 0/*perm*/);
module_param (mystring, charp, 0/*perm*/);
module_param_array(myintarray, int, 0/*intp*/, 0/*perm*/);
//
%} // end of [%{^]

(* ****** ****** *)

static
fun hello_3_init(): int = "mac#"
static
fun hello_3_exit(): void = "mac#"

(* ****** ****** *)

implement
hello_3_init
(
) = 0 where
{
//
val () =
$extfcall
(
  void, "printk", KERN_INFO_"Hello(3) from ATS!\n"
) (* end of [val] *)
//
val () =
$extfcall
(
  void, "printk"
, KERN_INFO_"modparam myint = %d\n", $extval(int, "myint")
) (* end of [val] *)
val () =
$extfcall
(
  void, "printk"
, KERN_INFO_"modparam mystring = %s\n", $extval(string, "mystring")
) (* end of [val] *)
val () =
$extfcall
(
  void, "printk", KERN_INFO_"modparam [myintarray] is int[]\n"
) (* end of [val] *)
//
} (* end of [hello_3_init] *)

(* ****** ****** *)

implement
hello_3_exit
(
) = () where
{
//
val () =
$extfcall
(
  void, "printk", KERN_INFO_"Goodbye(3) from ATS!\n"
) (* end of [val] *)
//
} (* end of [hello_3_exit] *)

(* ****** ****** *)

%{$
//
module_init(hello_3_init);
module_exit(hello_3_exit);
//
%} // end of [%{$]

(* ****** ****** *)

%{$
//
MODULE_AUTHOR("HX-2014-10-22");
MODULE_DESCRIPTION("A simple module for learning");
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [hello-3.dats] *)
