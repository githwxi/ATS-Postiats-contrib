(*
** Following lkmpg/hello-1.c
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
"{$LINUX}/SATS/linux/init.sats"
staload
"{$LINUX}/SATS/linux/module.sats"
staload
"{$LINUX}/SATS/linux/kernel.sats"
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
fun init_module(): interr = "mac#"
static
fun cleanup_module(): void = "mac#"

(* ****** ****** *)

implement
init_module
(
) = 0 where
{
//
val () =
$extfcall
(
  void, "printk", KERN_ALERT_"Hello(1) from ATS!\n"
) (* end of [val] *)
//
} (* end of [init_module] *)

(* ****** ****** *)

implement
cleanup_module
(
) = () where
{
val () =
$extfcall
(
  void, "printk", KERN_ALERT_"Goodbye(1) from ATS!\n"
) (* end of [val] *)
} (* end of [cleanup_module] *)

(* ****** ****** *)

(* end of [hello-1.dats] *)
