#!/bin/bash
set -e

if [ -d /mnt/img ]; then
	echo "ERROR: /mnt/img is still mounted"
	exit 1
fi

if [ ! -f /mnt/disk/my_sparse.img ]; then
	echo "ERROR: /mnt/disk/my_sparse.img (docker volume mapped to external ./_temp_/my_sparse.img) is not accessible"
	exit 1
fi

e2fsck -y -f /mnt/disk/my_sparse.img
resize2fs -M -f /mnt/disk/my_sparse.img

echo "DONE!"
