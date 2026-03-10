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

APK_DIR=$(dirname "$APK_FILE")

if [ ! -d "$APK_DIR" ]; then
	echo "ERROR: Directory '$APK_DIR' does not exist"
	exit 1
fi

echo "Change to directory '$APK_DIR' ..."

cd $APK_DIR || {
    echo "ERROR: Cannot change to directory '$APK_DIR'"
    exit 1
}

echo "Copy apktool_2.12.1.jar and framework-res.apk to '$APK_DIR' ..."

cp /mnt/img/framework/framework-res.apk $APK_DIR
cp /root/etc/apktool_2.12.1.jar $APK_DIR

echo "Install framework-res.apk ..."
java -jar apktool_2.12.1.jar if framework-res.apk

echo "Remove app-src ..."
rm -R -f app-src || true

echo "Unpack $APK_FILE to app-src ..."
java -jar apktool_2.12.1.jar d -f $APK_FILE -o app-src

