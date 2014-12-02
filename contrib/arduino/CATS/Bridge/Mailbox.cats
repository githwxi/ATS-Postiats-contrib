/*
** Mailbox library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_BRIDGE_MAILBOX
#define ARDUINO_CATS_BRIDGE_MAILBOX

/* ****** ****** */

#include <string.h>

/* ****** ****** */

#include <Mailbox.h>

/* ****** ****** */
//
typedef
MailboxClass *MailboxClass_ptr;
//
/* ****** ****** */

#define Mailbox_ptr (&Mailbox)

/* ****** ****** */
//
#define \
Mailbox_begin(p0) \
  (static_cast<MailboxClass*>(p0))->begin()
//
#define \
Mailbox_end(p0) (static_cast<MailboxClass*>(p0))->end()
//
/* ****** ****** */
//
#define \
Mailbox_readMessage_buffer(p0, buf, bsz) \
  (static_cast<MailboxClass*>(p0))->readMessage(buf, bsz)
//
/* ****** ****** */
//
/*
ATSinline()
Mailbox_writeMessage_string
(
  atstype_ptr p0, atstype_string msg
)
{
  return Mailbox_writeMessage_buffer(p0, msg, strlen((char*)msg));
}
*/
//
#define \
Mailbox_writeMessage_string(p0, msg) \
  (static_cast<MailboxClass*>(p0))->writeMessage(msg)
//
#define \
Mailbox_writeMessage_buffer(p0, buf, bsz) \
  (static_cast<MailboxClass*>(p0))->writeMessage(buf, bsz)
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_BRIDGE_MAILBOX)

/* ****** ****** */

/* end of [Mailbox.cats] */
