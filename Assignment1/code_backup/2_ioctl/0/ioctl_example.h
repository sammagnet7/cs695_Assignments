#ifndef IOCTL_H
#define IOCTL_H

#include <linux/ioctl.h>


#define DEVICE_NAME "ioctl_example"
#define IOCTL_GET_CONSTANT _IOR('k', 0, int)

#endif