(*
** Mailbox library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/Bridge/Mailbox.cats"
%} // end of [%{#]

(* ****** ****** *)
//
(*
class MailboxClass
*)
abst@ype
MailboxClass =
$extype"MailboxClass"
abstype
MailboxClass_ptr =
$extype"MailboxClass_ptr"
//
(* ****** ****** *)
//
fun
Mailbox_end
  (MailboxClass_ptr): void = "mac#"
fun
Mailbox_begin
  (MailboxClass_ptr): void = "mac#"
//
overload ._end with Mailbox_end
overload ._begin with Mailbox_begin
//
(* ****** ****** *)

fun
Mailbox_readMessage_buffer
  {n1,n2:int | n1 >= n2; n2 >= 0}
(
  MailboxClass_ptr
, buf: &(@[byte?][n1]) >> @[byte][n1], bsz: int(n2)
) : natLte(n2) = "mac#" // end-of-function
//
overload .readMessage with Mailbox_readMessage_buffer
//
(* ****** ****** *)
//
fun
Mailbox_writeMessage_string
  {n1,n2:int | n1 >= n2; n2 >= 0}
  (MailboxClass_ptr, msg: string): void = "mac#"
fun
Mailbox_writeMessage_buffer
  {n1,n2:int | n1 >= n2; n2 >= 0}
  (MailboxClass_ptr, buf: &(@[byte][n1]), bsz: int(n2)): void = "mac#"
//
overload .writeMessage with Mailbox_writeMessage_string
overload .writeMessage with Mailbox_writeMessage_buffer
//
(* ****** ****** *)
//
fun
Mailbox_messageAvailable
  (MailboxClass_ptr): uint = "mac#"
//
overload .messageAvailable with Mailbox_messageAvailable
//
(* ****** ****** *)

(* end of [Mailbox.sats] *)
