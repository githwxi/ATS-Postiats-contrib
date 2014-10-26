/* ****** ****** */
//
// For linux-kernel programming
//
/* ****** ****** */

#ifndef LINUX_CATS_KDEV_T
#define LINUX_CATS_KDEV_T

/* ****** ****** */

#include <linux/kdev_t.h>

/* ****** ****** */

#define
atslxkrnl_MAJOR(x) MAJOR(x)
#define
atslxkrnl_MINOR(x) MINOR(x)

/* ****** ****** */

#define
atslxkrnl_MKDEV(ma, mi) MKDEV(ma, mi)

/* ****** ****** */

#endif // end of [LINUX_CATS_KDEV_T]

/* ****** ****** */

/* end of [kdev_t.cats] */
