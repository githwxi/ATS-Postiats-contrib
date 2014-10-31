(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/types.cats"
//
%} // end of [%{#]

(* ****** ****** *)
//
abst@ype fd_set = $extype"fd_set"
abst@ype dev_t = $extype"dev_t"
abst@ype ino_t = $extype"ino_t"
abst@ype mode_t = $extype"mode_t"
abst@ype nlink_t = $extype"nlink_t"
abst@ype off_t = $extype"off_t"
abst@ype pid_t = $extype"pid_t"
abst@ype daddr_t = $extype"daddr_t"
abst@ype key_t = $extype"key_t"
abst@ype suseconds_t = $extype"suseconds_t"
abst@ype timer_t = $extype"timer_t"
abst@ype clockid_t = $extype"clockid_t"
abst@ype mqd_t = $extype"mqd_t"
//
abst@ype uid_t = $extype"uid_t"
abst@ype gid_t = $extype"gid_t"
abst@ype uid16_t = $extype"uid16_t"
abst@ype gid16_t = $extype"gid16_t"
//
abst@ype loff_t = $extype"loff_t"
//
(* ****** ****** *)

(* end of [types.sats] *)
