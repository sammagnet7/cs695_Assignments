#include <linux/module.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>

#include "ioctl_example.h"

static int major_number;
static struct cdev my_cdev;

static int dummy_open(struct inode *inode, struct file *file) {
    pr_info("Device opened\n");
    return 0;
}

static int dummy_release(struct inode *inode, struct file *file) {
    pr_info("Device closed\n");
    return 0;
}

static long dummy_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    int dummy_const = 37;

    switch (cmd) {
        case IOCTL_GET_CONSTANT:
            if (copy_to_user((int *)arg, &dummy_const, sizeof(int))) {
                pr_err("Failed to copy data to user\n");
                return EFAULT;
            }
            break;
        default:
            return ENOTTY; // Not a valid ioctl command
    }

    return 0;
}

static struct file_operations my_fops = {
    .open = dummy_open,
    .release = dummy_release,
    .unlocked_ioctl = dummy_ioctl,
};

static int __init dummy_init(void) {
    dev_t dev = 0;

    if (alloc_chrdev_region(&dev, 0, 1, DEVICE_NAME) < 0) {
        pr_err("Failed to allocate character device region\n");
        return -1;
    }

    major_number = MAJOR(dev);

    cdev_init(&my_cdev, &my_fops);

    if (cdev_add(&my_cdev, dev, 1) < 0) {
        pr_err("Failed to add character device\n");
        unregister_chrdev_region(dev, 1);
        return -1;
    }

    pr_info("Character device registered, major number: %d\n", major_number);
    return 0;
}

static void __exit dummy_exit(void) {
    cdev_del(&my_cdev);
    unregister_chrdev_region(MKDEV(major_number, 0), 1);
    pr_info("Character device unregistered\n");
}

module_init(dummy_init);
module_exit(dummy_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Soumik Dutta");
MODULE_DESCRIPTION("ioctl example with return value from Kernel module");
