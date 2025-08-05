#!/bin/bash
make clean
rm -f test

make
gcc -o test test.c

sudo ./test

make clean
rm -f test

