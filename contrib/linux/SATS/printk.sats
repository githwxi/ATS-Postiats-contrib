(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/printk.cats"
//
%} // end of [%{#]

(* ****** ****** *)
//
(*
#defineKERN_EMERG    "<0>" // system is unusable
#define KERN_ALERT   "<1>" // action must be taken
#define KERN_CRIT    "<2>" // critical conditions
#define KERN_ERR     "<3>" // error conditions
#define KERN_WARNING "<4>" // warning conditions
#define KERN_NOTICE  "<5>" // normal but significant
#define KERN_INFO    "<6>" // logging information
#define KERN_DEBUG   "<7>" // debug-level messages
*)
//
fun KERN_EMERG_   : string -<fun> string = "mac#" // "<0>
fun KERN_ALERT_   : string -<fun> string = "mac#" // "<1>
fun KERN_CRIT_    : string -<fun> string = "mac#" // "<2>
fun KERN_ERR_     : string -<fun> string = "mac#" // "<3>
fun KERN_WARNING_ : string -<fun> string = "mac#" // "<4>
fun KERN_NOTICE_  : string -<fun> string = "mac#" // "<5>
fun KERN_INFO_    : string -<fun> string = "mac#" // "<6>
fun KERN_DEBUG_   : string -<fun> string = "mac#" // "<7>
//
(* ****** ****** *)

(* end of [printk.sats] *)
