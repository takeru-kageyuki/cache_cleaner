#!/system/bin/sh

# Declaring a variable to skip the default installation steps
SKIPUNZIP=1

# Declaring a function with the name "module_descriptions"
module_descriptions() {
    # Print text on the Terminal screen (Magisk)
    ui_print "Cache Cleaner (Magisk Module)"
    # Print text on the Terminal screen (Magisk)
    ui_print " • A simple module that allows your device to clean all apps cache"
    # Print text on the Terminal screen (Magisk)
    ui_print " • Automatically if the total cache size is more than 1GB"
    # Print text on the Terminal screen (Magisk)
    ui_print " • And can be done manually by typing 'su -c cleaner' in the Terminal."
    # Print a blank line on the Terminal screen (Magisk)
    ui_print ""
    # Pause script execution for 2 seconds
    sleep 2
    # Print text on the Terminal screen (Magisk)
    ui_print "Telegram Group:"
    # Print text on the Terminal screen (Magisk)
    ui_print " • https://t.me/TakaEmpire_Discussion"
    # Print a blank line on the Terminal screen (Magisk)
    ui_print ""
    # Pause script execution for 2 seconds
    sleep 2
    # Print text on the Terminal screen (Magisk)
    ui_print "Notes:"
    # Print text on the Terminal screen (Magisk)
    ui_print " • This module only clears the applications cache"
    # Print text on the Terminal screen (Magisk)
    ui_print " • In the 'cache' and 'code_cache' directories."
    # Print a blank line on the Terminal screen (Magisk)
    ui_print ""
    # Pause script execution for 2 seconds
    sleep 2
}

# Declaring a function with the name "install_module"
install_module() {
    # Calling the "module_descriptions" function
    module_descriptions
    # Print text on the Terminal screen (Magisk)
    ui_print "Installing..."
    # Pause script execution for 1.7 seconds
    sleep 1.7
    # Print text on the Terminal screen (Magisk)
    ui_print "- Extracting module files"
    # Extract the "cleaner" file to the module directory
    unzip -o "$ZIPFILE" "cleaner" -d $MODPATH >&2
    # Extract the "module.prop" file to the module directory
    unzip -o "$ZIPFILE" "module.prop" -d $MODPATH >&2
    # Extract the "service.sh" file to the module directory
    unzip -o "$ZIPFILE" "service.sh" -d $MODPATH >&2
    # Extract the "uninstall.sh" file to the module directory
    unzip -o "$ZIPFILE" "uninstall.sh" -d $MODPATH >&2
    # Pause script execution for 1.5 seconds
    sleep 1.5
    # Print text on the Terminal screen (Magisk)
    ui_print "- Settings module"
    # Create a parent directory with the name "/system/bin"
    mkdir -p $MODPATH/system/bin
    # Move the "cleaner" file to the "/system/bin" directory
    mv $MODPATH/cleaner $MODPATH/system/bin/cleaner
    # Pause script execution for 1.5 seconds
    sleep 1.5
    # Print text on the Terminal screen (Magisk)
    ui_print "- Settings permission"
    # Set default permissions to all directories and files in the module directory
    set_perm_recursive $MODPATH 0 0 0755 0644
    # Set custom permission to the "cleaner" file in the "/system/bin" directory
    set_perm $MODPATH/system/bin/cleaner 0 0 0755
    # Pause script execution for 1.5 seconds
    sleep 1.5
}

# Cancel the installation if the API level is lower than 21 (Android 5.0)
if [ $API -lt 21 ]; then
    # Print text on the Terminal screen (Magisk)
    ui_print "*********************************************************"
    # Print text on the Terminal screen (Magisk)
    ui_print " Requires API 21+ (Android 5.0+) to install this module! "
    # Print text on the Terminal screen and cancel the module installation (Magisk)
    abort "*********************************************************"
# Cancel the installation if the Magisk version is lower than 23.0
elif [ $MAGISK_VER_CODE -lt 23000 ]; then
    # Print text on the Terminal screen (Magisk)
    ui_print "*******************************"
    # Print text on the Terminal screen (Magisk)
    ui_print " Please install Magisk v23.0+! "
    # Print text on the Terminal screen and cancel the module installation (Magisk)
    abort "*******************************"
# Cancel the installation if installing the module is not through the Magisk app
elif ! $BOOTMODE; then
    # Print text on the Terminal screen (Magisk)
    ui_print "********************************"
    # Print text on the Terminal screen (Magisk)
    ui_print " Install this module in Magisk! "
    # Print text on the Terminal screen and cancel the module installation (Magisk)
    abort "********************************"
else
    # Enable debug mode
    set -x
    # Pause script execution for 3 seconds
    sleep 3
    # Calling the "install_module" function
    install_module
fi

# Notes:
# For more information about Magisk Module, you can read it here: https://topjohnwu.github.io/Magisk/guides.html
# And respect my hard work, if you're using any parts of this script don't forget to give credit from me.
