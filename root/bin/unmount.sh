#!/bin/bash
set -e
cd /
umount /mnt/img
losetup -d /dev/loop0
