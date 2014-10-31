/*  
** hello-2.c
** The simplest kernel module.
*/
/* Needed by all */
#include <linux/module.h>
/* Needed for KERN_INFO */
#include <linux/kernel.h>

int hello_2_init(void)
{
  printk(KERN_INFO "Hello world 2.\n");

/* 
** A non-zero return means init_module failed;
** as a consequence, the module cannot be loaded. 
*/
  return 0;
}

void hello_2_exit(void)
{
  printk(KERN_INFO "Goodbye world 2.\n");
}

/* ****** ****** */

module_init(hello_2_init);
module_exit(hello_2_exit);

/* ****** ****** */

/* end of [hello-2.c] */
