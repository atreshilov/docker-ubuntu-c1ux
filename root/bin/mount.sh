#!/bin/bash
set -e

echo "Mount /mnt/disk/my_sparse.img to /mnt/img and remove CN apps ..."

if [ ! -f /mnt/disk/my_sparse.img ]; then
	echo "ERROR: /mnt/disk/my_sparse.img (docker volume mapped to external ./_temp_/my_sparse.img) is not accessible"
	exit 1
fi

losetup -P /dev/loop0 /mnt/disk/my_sparse.img
mkdir -p /mnt/img
mount -o rw /dev/loop0 /mnt/img

#if [ ! -d /mnt/img/app ]; then
#	echo "ERROR: /mnt/img/app is not accessible"
#	exit 1
#fi

cd /mnt/img/app
rm -R LiteAPP carlife-release onstarservices-release users-release text-release apa-release calendar-release vpmpro-release infotainment appstore-release nav-release androidauto-release amapauto-debug || true

echo "DONE!"
