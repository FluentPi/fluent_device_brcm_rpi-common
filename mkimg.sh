#/bin/bash

ROMNAME=FluentOS-2.0-IC
DATE=`date +%Y%m%d`
IMGNAME=$ROMNAME-$DATE-rpi.img
IMGSIZE=4

if [ `id -u` != 0 ]; then
	echo "Must be root to run script!"
	exit
fi

if [ -f $IMGNAME ]; then
	echo "File $IMGNAME already exists!"
else
	echo "Creating image file $IMGNAME..."
	dd if=/dev/zero of=$IMGNAME bs=512k count=8142
	sync
	echo "Creating partitions..."
	kpartx -a $IMGNAME
	sync
	(
	echo o
	echo n
	echo p
	echo 1
	echo
	echo +128
	echo n
	echo p
	echo 2
	echo
	echo +1024
	echo n
	echo p
	echo 3
	echo
	echo +256
	echo n
	echo p
	echo 4
	echo
	echo
	echo t
	echo 1
	echo c
	echo a
	echo 1
	echo w
	) | fdisk /dev/loop0
	sync
	kpartx -d $IMGNAME
	sync
	kpartx -a $IMGNAME
	sync
	sleep 5
	dd if=fat-boot/boot.fat of=/dev/mapper/loop0p1
	mkfs.ext4 /dev/mapper/loop0p4
	resize2fs /dev/mapper/loop0p4 687868
	echo "Copying system..."
	dd if=../../../out/target/product/rpi/system.img of=/dev/mapper/loop0p2 bs=1M
	echo "Copying vendor..."
	dd if=../../../out/target/product/rpi/vendor.img of=/dev/mapper/loop0p3 bs=1M
	echo "Copying boot..."
	mkdir -p sdcard/boot
	sync
	mount /dev/mapper/loop0p1 sdcard/boot
	sync
	cp boot/* sdcard/boot
	cp ../../../vendor/brcm/rpi/proprietary/boot/* sdcard/boot
	cp ../../../out/target/product/rpi/obj/KERNEL_OBJ/arch/arm/boot/zImage sdcard/boot
	cp -R ../../../out/target/product/rpi/obj/KERNEL_OBJ/arch/arm/boot/dts/* sdcard/boot
	cp ../../../out/target/product/rpi/ramdisk.img sdcard/boot
	sync
	umount /dev/mapper/loop0p1
	rm -rf sdcard
	kpartx -d $IMGNAME
	sync
	echo "Done, created $IMGNAME!"
fi
