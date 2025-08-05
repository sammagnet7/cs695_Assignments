#!/bin/bash
make clean

make


echo "--------------Execute---------------------"

sudo rmmod lkm2.ko
sudo dmesg -C
sudo insmod lkm2.ko target_pid=1
sudo rmmod lkm2.ko

echo -e "\n"
sudo dmesg
echo -e "\n"

echo "----------------Done-----------------------"
make clean