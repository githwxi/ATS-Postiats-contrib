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

%{^
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
%} // end of [%{^]

(* ****** ****** *)

%{^
MODULE_LICENSE("Dual BSD/GPL") ;
%} // end of [%{^]

(* ****** ****** *)

%{^
//
#ifdef ATSPMVstring
#undef ATSPMVstring
#endif // ATSPMVstring
//
#define ATSPMVstring(x) x
//
#define KERN_INFO_(x) (KERN_INFO x)
#define KERN_ALERT_(x) (KERN_ALERT x)
%} // end of [%{^]

(* ****** ****** *)

typedef interr = int

(* ****** ****** *)

static
fun init_module(): interr = "mac#"
static
fun cleanup_module(): void = "mac#"

(* ****** ****** *)

extern
fun KERN_INFO_(x: string): string = "mac#"
extern
fun KERN_ALERT_(x: string): string = "mac#"

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
  void, "printk", KERN_ALERT_"Hello world 1.\n"
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
  void, "printk", KERN_ALERT_"Goodbye world 1.\n"
) (* end of [val] *)
} (* end of [cleanup_module] *)

(* ****** ****** *)

(* end of [hello-1.dats] *)
