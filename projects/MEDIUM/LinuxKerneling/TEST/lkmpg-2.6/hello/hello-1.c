/*
** hello-1.c
** The simplest kernel module.
*/
/* Needed by all */
#include <linux/module.h>
/* Needed for KERN_ALERT */
#include <linux/kernel.h>

static
int
init_module(void)
{
//
  printk(KERN_ALERT "Hello world 1.\n");
//
/* 
** A non-zero return means init_module failed;
** as a consequence, the module cannot be loaded. 
*/
  return 0;
}

static
void
cleanup_module(void)
{
  printk(KERN_ALERT "Goodbye world 1.\n");
}

/* end of [hello-1.c] */
