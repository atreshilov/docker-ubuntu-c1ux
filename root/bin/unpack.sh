#!/bin/bash
set -e

APK_FILE=$1

if [ -z "$APK_FILE" ]; then
	echo "Usage: $0 <apk_file>"
	exit 1
fi

if [ ! -f "$APK_FILE" ]; then
	echo "ERROR: File '$APK_FILE' does not exist"
	exit 1
fi

echo "Install framework-res.apk ..."
java -jar /root/etc/apktool_2.12.1.jar if /mnt/img/framework/framework-res.apk

echo "Remove app-src ..."
rm -R -f app-src || true

echo "Unpack $APK_FILE to app-src ..."
java -jar /root/etc/apktool_2.12.1.jar d -f $APK_FILE -o app-src
