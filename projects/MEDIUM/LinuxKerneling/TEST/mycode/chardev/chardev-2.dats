(*
** A simple char device
*)

(* ****** ****** *)
//
// HX-2014-10-24:
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
#include
"{$KERNELATS}/prelude/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LINUX}/basics.sats"
//
(* ****** ****** *)
//
staload
"{$LINUX}/SATS/errno.sats"
staload
"{$LINUX}/SATS/types.sats"
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
staload "{$LINUX}/SATS/fs.sats"
//
staload "{$LINUX}/SATS/asm/uaccess.sats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

%{^
MODULE_LICENSE("Dual BSD/GPL") ;
%} // end of [%{^]

(* ****** ****** *)

static
fun init_module(): interr = "mac#"
static
fun cleanup_module(): void = "mac#"

(* ****** ****** *)

%{^
static int Major = 0;
static int Device_open = 0;
static int Device_open_count = 0;
%} // end of [%{^]

macdef
Major = $extval(int, "Major")
macdef
Device_open = $extval(int, "Device_open")
macdef
Device_open_count = $extval(int, "Device_open_count")

(* ****** ****** *)

%{^
#define BUFLEN 80 // Max length of the message from the device
#define DEVICE_NAME "chardev-2" /* Dev name as it appears in /proc/devices */
//
typedef
char *charptr ;
char Message[BUFLEN];
charptr Message0_ptr = &Message[0];
charptr Message1_ptr = &Message[0];
//
%} // end of [%{^]

typedef charptr = $extype"charptr"

macdef
BUFLEN = $extval(size_t, "BUFLEN")
macdef
DEVICE_NAME = $extval(string, "DEVICE_NAME")
macdef
Message0_ptr = $extval(charptr, "Message0_ptr")
macdef
Message1_ptr = $extval(charptr, "Message1_ptr")

(* ****** ****** *)

%{^
//
static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);
//
%} // end of [%{^]

(* ****** ****** *)

%{^

struct
file_operations
fops = {
  .open = device_open,
  .read = device_read,
  .write = device_write,
  .release = device_release
} ;

static void *fops_ptr = &(fops);

%} // end of [%{^]

macdef
fops_ptr = $extval(fops_ptr1, "fops_ptr")

(* ****** ****** *)

implement
init_module
(
) = let
//
extvar
"Major" =
register_chrdev(0u, DEVICE_NAME, fops_ptr)
//
val Major = g1ofg0(Major)
//
in
//
if
(Major > 0)
then let
//
val () =
$extfcall
(
  void, "printk"
, KERN_INFO_"chardev-2: assigned major number = %d\n", Major
) (* end of [val] *)
//
in
  0(*SUCCESS*)
end // end of [then]
else let
//
val () =
$extfcall
(
  void, "printk"
, KERN_ALERT_"chardev-2: registering failed with %d\n", Major
) (* end of [val] *)
//
in
  Major
end // end of [else]
//
end (* end of [init_module] *)

(* ****** ****** *)

implement
cleanup_module
(
// argumentless
) = () where
{
//
val
Major =
(
if Major > 0
  then g0i2u(Major) else 0u
// end of [if]
) : uint // end of [val]
//
val () = unregister_chrdev(Major, DEVICE_NAME)
//
val () =
$extfcall
(
  void, "printk"
, KERN_ALERT_"chardev-2: it has been opened for %d times\n"
, Device_open_count
) (* end of [val] *)
//
} (* end of [cleanup_module] *)

(* ****** ****** *)
//
static
fun device_open_ (inode_ptr1, file_ptr1): interr = "mac#"
static
fun device_release_ (inode_ptr1, file_ptr1): interr = "mac#"
//
(* ****** ****** *)

implement
device_open_
  (inx, filp) = let
in
//
if
(Device_open = 0)
then let
//
extvar
"Device_open" = Device_open + 1
extvar
"Device_open_count" = Device_open_count + 1
//
extvar
"Message1_ptr" = Message0_ptr
//
in
  0(*SUCCESS*)
end // end of [then]
else ~(EBUSY) // end of [else]
//
end // end of [device_open_]
                  
(* ****** ****** *)

implement
device_release_
  (inx, filp) = let
//
extvar
"Device_open" = Device_open - 1
//
in
  0(*SUCCESS*)
end // end of [device_release_]

(* ****** ****** *)

%{$
//
static
inline
int
device_open
(
struct inode *p0, struct file *p1
) { return device_open_(p0, p1) ; }
//
static
inline
int
device_release
(
struct inode *p0, struct file *p1
) { return device_release_(p0, p1) ; }
//
%} // end of [%{$]

(* ****** ****** *)
//
static
fun
device_read_{n:int}
(
  file_ptr1, buf: &ubytes(n), size_t(n), ofs: &loff_t
) : ssize_t = "mac#" // end-of-function
static
fun
device_write_{n:int}
(
  file_ptr1, buf: &ubytes(n), size_t(n), ofs: &loff_t
) : ssize_t = "mac#" // end-of-function
//
(* ****** ****** *)

implement
device_read_
  (filp, buf, n, ofs) = let
//
val n2 =
string_nlength<>
  ($UN.cast{string}(Message1_ptr), n)
//
val
n2_ =
$extfcall
(
  size_t
, "copy_to_user", addr@buf, Message1_ptr, n2
) (* end of [val] *)
//
val nread = n2 - n2_
//
extvar
"Message1_ptr" =
add_ptr_bsz ($UN.cast{ptr}(Message1_ptr), nread)
//
in
  $UN.cast{ssize_t}(nread)
end // end of [device_read_]

(* ****** ****** *)

implement
device_write_
  (filp, buf, n, ofs) = let
//
val n2 = min(n, BUFLEN)
//
val
n2_ =
$extfcall
(
  size_t
, "copy_from_user", addr@buf, Message0_ptr, n2
) (* end of [val] *)
//
extvar "Message1_ptr" = Message0_ptr
//
in
  $UN.cast{ssize_t}(if n2_ = 0 then 0 else ~(EFAULT))
end // end of [device_write_]

(* ****** ****** *)

%{$
//
static
inline
ssize_t
device_read
(
struct file *p0, char *buf, size_t n, loff_t *ofs
) { return device_read_(p0, buf, n, ofs) ; }
//
static
inline
ssize_t
device_write
(
struct file *p0, const char *buf, size_t n, loff_t *ofs
) { return device_write_(p0, (void*)buf, n, ofs) ; }
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [chardev-2.dats] *)
