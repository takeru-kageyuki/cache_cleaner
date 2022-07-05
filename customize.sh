#!/system/bin/sh

SKIPUNZIP=1

module_description() {
    ui_print "Cache Cleaner (Magisk Module)"
    ui_print " • A module that allows your device"
    ui_print " • To clear all apps cache by"
    ui_print " • Typing 'su -c cleaner' in Terminal."
    ui_print ""
    sleep 2
    ui_print "GitHub Repository:"
    ui_print " • https://github.com/takeru-kageyuki/cache_cleaner"
    ui_print ""
    sleep 2
    ui_print "Group Support:"
    ui_print " • https://t.me/TakaEmpire_Discussion"
    ui_print ""
    sleep 2
}

install_module() {
    module_description
    ui_print "Installing..."
    sleep 1.5
    ui_print "- Extracting module files"
    unzip -o "$ZIPFILE" cleaner -d $MODPATH >&2
    unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
    sleep 1.7
    ui_print "- Settings module"
    mkdir -p $MODPATH/system/bin
    mv $MODPATH/cleaner $MODPATH/system/bin/cleaner
    sleep 1.7
    ui_print "- Settings permission"
    set_perm_recursive $MODPATH 0 0 0755 0644
    set_perm $MODPATH/system/bin/cleaner 0 0 0755 0755
    sleep 1.7
}

if [ $API -lt 21 ]; then
    ui_print "*******************************************************"
    ui_print " Requires API 21+ (Android 5+) to install this module! "
    abort "*******************************************************"
elif [ $MAGISK_VER_CODE -lt 23000 ]; then
    ui_print "*******************************"
    ui_print " Please install Magisk v23.0+! "
    abort "*******************************"
elif ! $BOOTMODE; then
    ui_print "********************************"
    ui_print " Install this module in Magisk! "
    abort "********************************"
else
    set -x
    sleep 3
    install_module
fi
