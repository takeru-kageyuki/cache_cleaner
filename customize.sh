#!/system/bin/sh

# Declaring a variable to skip the default installation steps
SKIPUNZIP=1

# Declaring a function with the name "module_descriptions"
module_descriptions() {
    # Print text on Terminal screen (Magisk)
    ui_print "Cache Cleaner (Magisk Module)"
    # Print text on Terminal screen (Magisk)
    ui_print " • A module that allows your device to clear all"
    # Print text on Terminal screen (Magisk)
    ui_print " • Apps cache on every boot and can be done"
    # Print text on Terminal screen (Magisk)
    ui_print " • Manually by typing 'su -c cleaner' in Terminal."
    # Print blank line on Terminal screen (Magisk)
    ui_print ""
    # Pause script execution for 2 second
    sleep 2
    # Print text on Terminal screen (Magisk)
    ui_print "Telegram Channel:"
    # Print text on Terminal screen (Magisk)
    ui_print " • https://t.me/TakaEmpire_Channel"
    # Print blank line on Terminal screen (Magisk)
    ui_print ""
    # Pause script execution for 2 second
    sleep 2
    # Print text on Terminal screen (Magisk)
    ui_print "Notes:"
    # Print text on Terminal screen (Magisk)
    ui_print " • This module is works on main user only (UID 0/Owner),"
    # Print text on Terminal screen (Magisk)
    ui_print " • That means this module doesn't work in multiple users."
    # Print blank line on Terminal screen (Magisk)
    ui_print ""
    # Pause script execution for 2 second
    sleep 2
}

# Declaring a function with the name "install_module"
install_module() {
    # Calling/load the "module_descriptions" function
    module_descriptions
    # Print text on Terminal screen (Magisk)
    ui_print "Installing..."
    # Pause script execution for 1.5 second
    sleep 1.5
    # Print text on Terminal screen (Magisk)
    ui_print "- Extracting module files"
    # Extract the "cleaner" file
    unzip -o "$ZIPFILE" cleaner -d $MODPATH >&2
    # Extract the "module.prop" file
    unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
    # Extract the "service.sh" file
    unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
    # Pause script execution for 1.7 second
    sleep 1.7
    # Print text on Terminal screen (Magisk)
    ui_print "- Settings module"
    # Create a parent directory with the name "/system/bin"
    mkdir -p $MODPATH/system/bin
    # Move the "cleaner" file to the "/system/bin" directory
    mv $MODPATH/cleaner $MODPATH/system/bin/cleaner
    # Pause script execution for 1.7 second
    sleep 1.7
    # Print text on Terminal screen (Magisk)
    ui_print "- Settings permission"
    # Set default permissions to all directories and files
    set_perm_recursive $MODPATH 0 0 0755 0644
    # Set custom permissions to the "/system/bin" directory and "cleaner" file
    set_perm $MODPATH/system/bin/cleaner 0 0 0755 0755
    # Pause script execution for 1.7 second
    sleep 1.7
}

# Cancel installation if API level lower than 21 (Android 5.0)
if [ $API -lt 21 ]; then
    # Print text on Terminal screen (Magisk)
    ui_print "*********************************************************"
    # Print text on Terminal screen (Magisk)
    ui_print " Requires API 21+ (Android 5.0+) to install this module! "
    # Print text on Terminal screen and cancel module installation (Magisk)
    abort "*********************************************************"
# Cancel installation if Magisk version is lower than 23.0
elif [ $MAGISK_VER_CODE -lt 23000 ]; then
    # Print text on Terminal screen (Magisk)
    ui_print "*******************************"
    # Print text on Terminal screen (Magisk)
    ui_print " Please install Magisk v23.0+! "
    # Print text on Terminal screen and cancel module installation (Magisk)
    abort "*******************************"
# Cancel installation if install module in Custom Recovery
elif ! $BOOTMODE; then
    # Print text on Terminal screen (Magisk)
    ui_print "********************************"
    # Print text on Terminal screen (Magisk)
    ui_print " Install this module in Magisk! "
    # Print text on Terminal screen and cancel module installation (Magisk)
    abort "********************************"
else
    # Turned on debug mode
    set -x
    # Pause script execution for 3 second
    sleep 3
    # Calling/load the "install_module" function
    install_module
    abort
fi

# Notes:
# For more information about Magisk Module, you can read it here: https://topjohnwu.github.io/Magisk/guides.html
# And respect my hard work, if you're using any parts of this script don't forget to give credit.
