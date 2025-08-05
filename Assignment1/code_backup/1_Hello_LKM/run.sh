make clean

make

sudo dmesg -C
sudo insmod helloworld.ko

echo -e "\n"
sudo dmesg
echo -e "\n"

sudo rmmod helloworld.ko

make clean