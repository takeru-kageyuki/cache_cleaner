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
    
    # Delete the "cache_cleaner" directory in the "/sdcard" partition
    rm -rf /sdcard/Taka/cache_cleaner
    # Delete the "cache_cleaner" directory in the "/cache" partition
    rm -rf /cache/cache_cleaner
}

# Calling and running the "boot_completed" function in the background
boot_completed &

# Notes:
# For more information about Shell Script, you can google it.
# And respect my hard work, if you're using any parts of this script don't forget to give credit from me.
