/* ****** ****** */
//
// For linux-kernel programming
//
/* ****** ****** */

#ifndef LINUX_CATS_FS
#define LINUX_CATS_FS

/* ****** ****** */

#include <linux/fs.h>

/* ****** ****** */
//
#define \
atslxkrnl_register_chrdev_region register_chrdev_region
//
#define atslxkrnl_alloc_chrdev_region alloc_chrdev_region
//
#define \
atslxkrnl_unregister_chrdev_region unregister_chrdev_region
//
/* ****** ****** */

#endif // end of [LINUX_CATS_FS]

/* ****** ****** */

/* end of [fs.cats] */
