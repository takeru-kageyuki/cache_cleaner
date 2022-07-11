#!/system/bin/sh

# Declaring a function with the name "boot_completed"
boot_completed() {
    # Check if the device is booted
    while [ "$(getprop sys.boot_completed)" != "1" ]; do sleep 1; done
    
    # Declaring a local variable with the name "file"
    local file="/sdcard/.cache_cleaner"
    # Create an empty file with the name ".cache_cleaner" in the "/sdcard" partition
    touch $file
    # Check if the ".cache_cleaner" file is not in the "/sdcard" partition
    while [ ! -f $file ]; do
        # Create an empty file with the name ".cache_cleaner" in the "/sdcard" partition
        touch $file
        # Pause script execution for 1 second
        sleep 1
    done
    # Delete the ".cache_cleaner" file in the "/sdcard" partition
    rm $file
}

# Calling/load the "boot_completed" function
boot_completed

# Find the apps cache in the "/data/data" directory and delete it
find /data/data/*/cache/* -delete &>/dev/null
# Find the apps code_cache in the "/data/data" directory and delete it
find /data/data/*/code_cache/* -delete &>/dev/null
# Find the apps cache in the "/data/user_de/0" directory and delete it
find /data/user_de/0/*/cache/* -delete &>/dev/null
# Find the apps code_cache in the "/data/user_de/0" directory and delete it
find /data/user_de/0/*/code_cache/* -delete &>/dev/null
# Find the apps cache in the "/sdcard/Android/data" directory and delete it
find /sdcard/Android/data/*/cache/* -delete &>/dev/null

# Notes:
# For more information about Shell Script, you can google it.
# And respect my hard work, if you're using any parts of this script don't forget to give credit.
