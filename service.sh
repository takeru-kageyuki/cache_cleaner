#!/system/bin/sh

# Declaring a function with the name "boot_completed"
boot_completed() {
    # Check if the device has finished booting
    while [ $(getprop sys.boot_completed) != 1 ]; do sleep 1; done
    
    # Declaring a local variable with the name "permission"
    local permission=/sdcard/.cache_cleaner
    # Create an empty file with the name ".cache_cleaner" in the "/sdcard" partition
    touch $permission
    # Check if the ".cache_cleaner" file is not in the "/sdcard" partition
    while [ ! -f $permission ]; do
        # Create an empty file with the name ".cache_cleaner" in the "/sdcard" partition
        touch $permission
        # Pause script execution for 1 second
        sleep 1
    done
    # Delete the ".cache_cleaner" file in the "/sdcard" partition
    rm $permission
    
    # Declaring a local variable with the name "update"
    local update=/cache/cache_cleaner
    # Check if the "cache_cleaner" directory is not in the "/cache" partition
    if [ ! -d $update ]; then
        # Loading the "util_functions.sh" in the "/data/adb/magisk" directory
        . /data/adb/magisk/util_functions.sh
        
        # Create an empty file with the name ".installed" in the "/cache/cache_cleaner" directory
        mktouch $update/.installed
        # Create an empty file with the name "logs.txt" in the "/sdcard/Taka/cache_cleaner" directory
        mktouch /sdcard/Taka/cache_cleaner/logs.txt
    fi
}

# Calling the "boot_completed" function
boot_completed

# Calling and running the "automatic.sh" in the background
nohup sh ${0%/*}/automatic.sh &

# Notes:
# For more information about Shell Script, you can google it.
# And respect my hard work, if you're using any parts of this script don't forget to give credit from me.
