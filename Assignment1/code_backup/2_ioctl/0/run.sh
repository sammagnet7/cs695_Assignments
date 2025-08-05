#!/bin/bash

device_name="ioctl_example"

make unload
make clean

make
make load


# retrieve major number
major=$(cat /proc/devices | grep "$device_name")
major_number=($major)


echo "--------Replacing stale nodes----------"
sudo rm -f /dev/${device_name}
sudo mknod /dev/${device_name} c ${major_number[0]} 0


echo -e "\n============Execute=============\n"

./test

echo -e "\n==============Done===============\n"

make clean


