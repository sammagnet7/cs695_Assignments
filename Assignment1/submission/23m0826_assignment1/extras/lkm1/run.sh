make clean
rm -f test 

gcc -o test test.c
make

./test &
PID=$!

sudo dmesg -C
sudo insmod lkm1.ko

echo -e "\n"
sudo dmesg
echo -e "\n"
ps -r
echo -e "\n"

sudo rmmod lkm1.ko

kill -9 $PID

make clean
rm -f test 