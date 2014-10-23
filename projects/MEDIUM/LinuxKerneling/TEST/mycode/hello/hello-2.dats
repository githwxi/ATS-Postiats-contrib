(*
** Following lkmpg/hello-2.c
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
%{^
#include <linux/init.h>
#include <linux/module.h>
%} // end of [%{^]
//
staload
"{$LINUX}/SATS/kernel.sats"
staload $PRINTK // HX: opening NS
//
(* ****** ****** *)

%{^
MODULE_LICENSE("Dual BSD/GPL") ;
%} // end of [%{^]

(* ****** ****** *)

typedef interr = int

(* ****** ****** *)

static
fun hello_2_init(): interr = "mac#"
static
fun hello_2_exit(): void = "mac#"

(* ****** ****** *)

implement
hello_2_init
(
) = 0 where
{
//
val () =
$extfcall
(
  void, "printk", KERN_ALERT_"Hello(2) from ATS!\n"
) (* end of [val] *)
//
} (* end of [hello_2_init] *)

(* ****** ****** *)

implement
hello_2_exit
(
) = () where
{
val () =
$extfcall
(
  void, "printk", KERN_ALERT_"Goodbye(2) from ATS!\n"
) (* end of [val] *)
} (* end of [hello_2_exit] *)

(* ****** ****** *)

%{$
//
module_init(hello_2_init);
module_exit(hello_2_exit);
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [hello-2.dats] *)
