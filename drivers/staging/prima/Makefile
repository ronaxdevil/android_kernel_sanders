default: all

KBUILD_OPTIONS := WLAN_ROOT=$(PWD)
KBUILD_OPTIONS += MODNAME=wlan

all::
	$(MAKE) -C $(KERNEL_SOURCE) $(KBUILD_OPTIONS) $(EXTRA_CFLAGS) ARCH=$(ARCH) \
		SUBDIRS=$(CURDIR) CC=${CC} modules

modules_install:
	$(MAKE) INSTALL_MOD_STRIP=1 -C $(KERNEL_SRC) M=$(shell pwd) modules_install

clean::
	rm -f *.o *.ko *.mod.c *.mod.o *~ .*.cmd Module.symvers
	rm -rf .tmp_versions

# Moto read MACs from boot params instead of NV file
CDEFINES += -DMOTO_UTAGS_MAC

# Fix build for GCC 4.7
EXTRA_CFLAGS += -Wno-unused-function

subdir-ccflags-y += \
	-Wno-array-bounds \
	-Wno-empty-body \
	-Wno-enum-conversion \
	-Wno-non-literal-null-conversion \
	-Wno-parentheses-equality \
	-Wno-pointer-bool-conversion \
	-Wno-typedef-redefinition
