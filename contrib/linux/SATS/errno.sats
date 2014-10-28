(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/errno.cats"
//
%} // end of [%{#]

(* ****** ****** *)

typedef errno = intGt(0)

(* ****** ****** *)

macdef EPERM	= $extval(errno, "EPERM")
macdef ENOENT	= $extval(errno, "ENOENT")
macdef ESRCH	= $extval(errno, "ESRCH")
macdef EINTR	= $extval(errno, "EINTR")
macdef EIO	= $extval(errno, "EIO")
macdef ENXIO	= $extval(errno, "ENXIO")
macdef E2BIG	= $extval(errno, "E2BIG")
macdef ENOEXEC	= $extval(errno, "ENOEXEC")
macdef EBADF	= $extval(errno, "EBADF")
macdef ECHILD	= $extval(errno, "ECHILD")
macdef EAGAIN	= $extval(errno, "EAGAIN")
macdef ENOMEM	= $extval(errno, "ENOMEM")
macdef EACCES	= $extval(errno, "EACCES")
macdef EFAULT	= $extval(errno, "EFAULT")
macdef ENOTBLK	= $extval(errno, "ENOTBLK")
macdef EBUSY	= $extval(errno, "EBUSY")
macdef EEXIST	= $extval(errno, "EEXIST")
macdef EXDEV	= $extval(errno, "EXDEV")
macdef ENODEV	= $extval(errno, "ENODEV")
macdef ENOTDIR	= $extval(errno, "ENOTDIR")
macdef EISDIR	= $extval(errno, "EISDIR")
macdef EINVAL	= $extval(errno, "EINVAL")
macdef ENFILE	= $extval(errno, "ENFILE")
macdef EMFILE	= $extval(errno, "EMFILE")
macdef ENOTTY	= $extval(errno, "ENOTTY")
macdef ETXTBSY	= $extval(errno, "ETXTBSY")
macdef EFBIG	= $extval(errno, "EFBIG")
macdef ENOSPC	= $extval(errno, "ENOSPC")
macdef ESPIPE	= $extval(errno, "ESPIPE")
macdef EROFS	= $extval(errno, "EROFS")
macdef EMLINK	= $extval(errno, "EMLINK")
macdef EPIPE	= $extval(errno, "EPIPE")
macdef EDOM	= $extval(errno, "EDOM")
macdef ERANGE	= $extval(errno, "ERANGE")

(* ****** ****** *)

(* end of [errno.sats] *)
