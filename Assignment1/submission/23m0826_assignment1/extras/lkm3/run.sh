#!/bin/bash
make clean
rm -f test log.log

make

gcc -o test test.c

echo "--------------Execute---------------------"

touch log.log
stdbuf -o0 ./test>log.log &

sleep 2
PID=$(cat log.log|grep "PID:"|awk -F ':' '{print $2}' )

# Get the virtual address from the output of ./test
VA=$(cat log.log | grep "VA:" | awk -F ':' '{print $2}')

echo "Loading module with target_pid=$PID virt_address=$VA"

# Load the kernel module with the PID and virtual address
sudo rmmod lkm3.ko
sudo dmesg -C
sudo insmod lkm3.ko target_pid=$PID virt_address=$VA
sudo rmmod lkm3.ko
sudo dmesg

echo "----------------Done-----------------------"
make clean
rm -f test log.log

