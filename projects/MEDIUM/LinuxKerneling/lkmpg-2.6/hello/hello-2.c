/*  
** hello-2.c
** The simplest kernel module.
*/
/* Needed by all */
#include <linux/module.h>
/* Needed for KERN_INFO */
#include <linux/kernel.h>

int init_module(void)
{
  printk(KERN_INFO "Hello world 2.\n");

/* 
** A non-zero return means init_module failed;
** as a consequence, the module cannot be loaded. 
*/
  return 0;
}

void cleanup_module(void)
{
  printk(KERN_INFO "Goodbye world 2.\n");
}

/* end of [hello-2.c] */
