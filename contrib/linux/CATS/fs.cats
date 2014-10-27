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

typedef
struct file file_struct;

/* ****** ****** */

typedef
struct dentry dentry_struct;

/* ****** ****** */

typedef
struct inode inode_struct;

/* ****** ****** */
//
#define atslxkrnl_imajor(inx) imajor(inx)
#define atslxkrnl_iminor(inx) iminor(inx)
//
/* ****** ****** */
//
#define \
atslxkrnl_alloc_chrdev_region alloc_chrdev_region
//
#define \
atslxkrnl_register_chrdev_region register_chrdev_region
//
#define \
atslxkrnl_unregister_chrdev_region unregister_chrdev_region
//
/* ****** ****** */

#endif // end of [LINUX_CATS_FS]

/* ****** ****** */

/* end of [fs.cats] */
