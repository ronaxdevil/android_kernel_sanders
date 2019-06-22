# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=// MAYHEM-KERNEL by @Ronax //
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=sanders
device.name2=sanders_retail
device.name3=Moto G5S Plus
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

backup_file init.rc;

# insert init.spectrum.rc in init.rc
# insert init.mayhem.rc in init.rc
insert_line init.rc "import /init.spectrum.rc" after "import /init.trace.rc" "import /init.spectrum.rc";
insert_line init.rc "import /init.mayhem.rc" after "import /init.usb.configfs.rc" "import /init.mayhem.rc";

# end ramdisk changes

write_boot;
## end install

