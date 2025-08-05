#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>

MODULE_DESCRIPTION("My first Kernel module");
MODULE_AUTHOR("Soumik Dutta");
MODULE_LICENSE("GPL");

static int dummy_init(void)
{
    printk("Hello World\n");
    return 0;
}

static void dummy_exit(void)
{
    printk("Module Unloaded\n");
}

module_init(dummy_init);
module_exit(dummy_exit);