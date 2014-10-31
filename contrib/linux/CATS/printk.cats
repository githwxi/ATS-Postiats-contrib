/* ****** ****** */
//
// For linux-kernel programming
//
/* ****** ****** */

#ifndef LINUX_CATS_PRINTK
#define LINUX_CATS_PRINTK

/* ****** ****** */

#include <linux/printk.h>

/* ****** ****** */
//
#define KERN_EMERG_(x) (KERN_EMERG x)
#define KERN_ALERT_(x) (KERN_ALERT x)
#define KERN_CRIT_(x) (KERN_CRIT x)
#define KERN_ERR_(x) (KERN_ERR x)
#define KERN_WARNING_(x) (KERN_WARNING x)
#define KERN_NOTICE_(x) (KERN_NOTICE x)
#define KERN_INFO_(x) (KERN_INFO x)
#define KERN_DEBUG_(x) (KERN_DEBUG x)
//
/* ****** ****** */

#endif // end of [LINUX_CATS_PRINTK]

/* ****** ****** */

/* end of [printk.cats] */
