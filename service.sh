#!/sbin/sh

# Clear cache of all apps on every boot
find /data/data/*/cache/* -delete &>/dev/null
find /sdcard/Android/data/*/cache/* -delete &>/dev/null
