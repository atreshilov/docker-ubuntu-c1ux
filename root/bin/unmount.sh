#!/bin/bash
set -e

echo "Unmount /mnt/disk/my_sparse.img from /mnt/img ..."

if [ ! -d /mnt/img ]; then
	echo "ERROR: /mnt/img is not accessible or already unmounted"
	exit 1
fi

cd /
umount /mnt/img
losetup -d /dev/loop0

echo "DONE!"
