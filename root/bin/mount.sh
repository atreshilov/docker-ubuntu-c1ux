#!/bin/bash
set -e
if [ ! -f /mnt/disk/my_sparse.img ]; then
	echo "ERROR: /mnt/disk/my_sparse.img (docker volume mapped to external ./_temp_/my_sparse.img) is not accessible"
	exit 1
fi
losetup -P /dev/loop0 /mnt/disk/my_sparse.img
mkdir -p /mnt/img
mount -o rw /dev/loop0 /mnt/img
cd /mnt/img/app
rm -R LiteAPP carlife-release onstarservices-release users-release text-release apa-release calendar-release vpmpro-release infotainment appstore-release nav-release androidauto-release amapauto-debug
