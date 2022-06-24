#!/sbin/sh

SKIPUNZIP=1

module_description() {
    ui_print "Cache Cleaner (Magisk Module)"
    ui_print " • A module that allows your device"
    ui_print " • To clear cache of all apps on every boot."
    ui_print ""
    sleep 2
    ui_print " • And can be done manually by"
    ui_print " • Typing 'su -c cleaner' in Terminal."
    ui_print ""
    sleep 2
    ui_print "GitHub Repository:"
    ui_print " • https://github.com/takeru-kageyuki/cache_cleaner"
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
    unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
    sleep 1.7
    ui_print "- Settings module"
    if [ -d /system/xbin ]; then
        mkdir -p $MODPATH/system/xbin
        mv $MODPATH/cleaner $MODPATH/system/xbin/cleaner
    else
        mkdir -p $MODPATH/system/bin
        mv $MODPATH/cleaner $MODPATH/system/bin/cleaner
    fi
    sleep 1.7
    ui_print "- Settings permission"
    set_perm_recursive $MODPATH 0 0 0755 0644
    if [ -d /system/xbin ]; then
        set_perm $MODPATH/system/xbin/cleaner 0 0 0755 0755
    else
        set_perm $MODPATH/system/bin/cleaner 0 0 0755 0755
    fi
    sleep 1.7
}


if [ $MAGISK_VER_CODE -lt 23000 ]; then
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
