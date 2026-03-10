#!/bin/bash
set -e
cd /
umount /mnt/img
losetup -d /dev/loop0
e2fsck -y -f /mnt/disk/my_sparse.img
resize2fs -M -f /mnt/disk/my_sparse.img
