KDIR = /lib/modules/`uname -r`/build

MODULE_NAME=helloworld

# kbuild part of makefile
obj-m += $(MODULE_NAME).o

kbuild:
	make -C $(KDIR) M=`pwd`

clean:
	make -C $(KDIR) M=`pwd` clean