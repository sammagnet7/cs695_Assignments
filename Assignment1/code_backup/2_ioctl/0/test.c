#include <stdio.h>
#include <fcntl.h>      /* open */ 
#include <unistd.h>     /* exit */
#include <sys/ioctl.h>

#include "ioctl_example.h"

int main() {
    char device_path[256];
    sprintf(device_path,"/dev/%s",DEVICE_NAME);
    int fd = open(device_path, O_RDONLY);
    if (fd < 0) {
        perror("Failed to open the device file");
        return -1;
    }

    int value;
    if (ioctl(fd, IOCTL_GET_CONSTANT, &value) < 0) {
        perror("IOCTL call failed");
        close(fd);
        return -1;
    }

    printf("Value from IOCTL: %d\n", value);

    close(fd);
    return 0;
}
