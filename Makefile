obj-m:=mini_block.o


KDIR  := /lib/modules/$(shell uname -r)/build
PWD   := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

test:
	sudo dmesg -c && sudo rmmod mini_block && sudo insmod mini_block.ko && sudo dmesg -c

.PHONY: test
