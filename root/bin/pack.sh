#!/bin/bash
set -e

APK_FILE=$1

if [ -z "$APK_FILE" ]; then
	echo "Usage: $0 <apk_file>"
	exit 1
fi

if [ ! -d "./app-src" ]; then
	echo "ERROR: Directory './app-src' does not exist"
	exit 1
fi

echo "Install framework-res.apk ..."
java -jar /root/etc/apktool_2.12.1.jar if /mnt/img/framework/framework-res.apk

APP_NAME=$(basename "$APK_FILE" .apk)

echo "Assemble $APP_NAME from ./app-src to unsigned.apk ..."
java -jar /root/etc/apktool_2.12.1.jar b --use-aapt1 app-src -o unsigned.apk

echo "Sign unsigned.apk and output $APK_FILE..."
apksigner sign --key /root/etc/platform.pk8 --cert /root/etc/platform.x509.pem --v1-signing-enabled true \
	--v2-signing-enabled true --v3-signing-enabled true --out $APK_FILE unsigned.apk

echo "Cleanup ..."
rm unsigned.apk $APK_FILE.idsig || true
rm -R ./app-src || true
