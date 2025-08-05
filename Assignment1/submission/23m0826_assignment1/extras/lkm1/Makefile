KDIR = /lib/modules/`uname -r`/build
MODULE_NAME=lkm1

# kbuild part of makefile
obj-m += $(MODULE_NAME).o

kbuild:
	make -C $(KDIR) M=`pwd`

clean:
	make -C $(KDIR) M=`pwd` clean
	@rm -rf .tmp*