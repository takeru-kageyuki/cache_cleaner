#!/system/bin/sh

# Declaring a function with the name "boot_completed"
boot_completed() {
    # Check if the device is booted
    while [ $(getprop sys.boot_completed) != 1 ]; do sleep 1; done
    
    # Declaring a local variable with the name "file"
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
}

# Calling/load the "boot_completed" function
boot_completed &

# Declaring a function with the name "cleaner"
cleaner() {
    # Find the apps cache in the "/data/data" directory and delete it
    find /data/data/*/cache/* -delete &>/dev/null
    # Find the apps code_cache in the "/data/data" directory and delete it
    find /data/data/*/code_cache/* -delete &>/dev/null
    # Find the apps cache in the "/data/user_de/{UID}" directory and delete it
    find /data/user_de/*/*/cache/* -delete &>/dev/null
    # Find the apps code_cache in the "/data/user_de/{UID}" directory and delete it
    find /data/user_de/*/*/code_cache/* -delete &>/dev/null
    # Find the apps cache in the "/sdcard/Android/data" directory and delete it
    find /sdcard/Android/data/*/cache/* -delete &>/dev/null
}

# Test Feature!
auto_clean() {
    while true; do
        cleaner
        sleep 6h
    done
}

# Calling/load the "auto_clean" function
nohup sh auto_clean &

# Notes:
# For more information about Shell Script, you can google it.
# And respect my hard work, if you're using any parts of this script don't forget to give credit.
