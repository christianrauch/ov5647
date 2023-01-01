obj-m += ov5647.o

KDIR ?= /lib/modules/$(shell uname -r)/build

.PHONY: module install clean

module: $(obj-m)

$(obj-m):
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install: $(obj-m)
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
	depmod -A

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
