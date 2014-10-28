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
"{$LINUX}/SATS/errno.sats"
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
#define DEVICE_NAME "chardev-1" /* Dev name as it appears in /proc/devices */
//
typedef
char *charptr ;
char Message[BUFLEN];
charptr Message0_ptr = &Message[0];
charptr Message1_ptr = Message0_ptr;
//
%} // end of [%{^]

typedef charptr = $extype"charptr"

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
  .read = device_read,
  .write = device_write,
  .open = device_open,
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
  void
, "printk", KERN_INFO_"The assigned major number is: %d\n", Major
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
  void
, "printk", KERN_ALERT_"Registering chardev failed with %d\n", Major
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
val () =
$extfcall
(
  void
, "sprintf"
, Message0_ptr, "Hello(%d) from the chardev\n", Device_open_count
) : void // end of [val]
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
"Device_open_count" = Device_open_count - 1
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

(* end of [chardev-1.dats] *)
