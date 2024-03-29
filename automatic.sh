#!/system/bin/sh

# Declaring a function with the name "cleaner"
cleaner() {
    # Search and clear the apps cache in the "/data/data" directory
    find /data/data/*/cache/* -delete &>/dev/null
    # Search and clear the apps code_cache in the "/data/data" directory
    find /data/data/*/code_cache/* -delete &>/dev/null
    # Search and clear the apps cache in the "/data/user_de/{UID}" directory
    find /data/user_de/*/*/cache/* -delete &>/dev/null
    # Search and clear the apps code_cache in the "/data/user_de/{UID}" directory
    find /data/user_de/*/*/code_cache/* -delete &>/dev/null
    # Search and clear the apps cache in the "/sdcard/Android/data" directory
    find /sdcard/Android/data/*/cache/* -delete &>/dev/null
}

# Declaring a function with the name "automatic"
automatic() {
    # Declaring a local variable with the name "size1"
    local size1=$(du -cs /data/data/*/cache | grep total | cut -f 1)
    # Declaring a local variable with the name "size2"
    local size2=$(du -cs /data/data/*/code_cache | grep total | cut -f 1)
    # Declaring a local variable with the name "size3"
    local size3=$(du -cs /data/user_de/*/*/cache | grep total | cut -f 1)
    # Declaring a local variable with the name "size4"
    local size4=$(du -cs /data/user_de/*/*/code_cache | grep total | cut -f 1)
    # Declaring a local variable with the name "size5"
    local size5=$(du -cs /sdcard/Android/data/*/cache | grep total | cut -f 1)
    # Declaring a local variable with the name "total"
    local total=$(( size1 + size2 + size3 + size4 + size5 ))
    
    # Declaring a local variable with the name "interval"
    local interval=3600
    # Check if the "disable" file is not in the "/sdcard/Taka/cache_cleaner" directory
    while [ ! -f /sdcard/Taka/cache_cleaner/disable ]; do
        # Check if the total cache size is greater than 1GB
        if [ $total -gt 1024000 ]; then
            # Declaring a local variable with the name "logs1"
            local logs1="[$(date +%H:%M:%S)] Cleaning apps cache..."
            # Write the logs to the ".txt" file in the "/sdcard/Taka/cache_cleaner" directory
            echo $logs1 >> /sdcard/Taka/cache_cleaner/logs.txt
            
            # Calling the "cleaner" function
            cleaner
            
            # Declaring a local variable with the name "logs2"
            local logs2="[$(date +%H:%M:%S)] Done! The apps cache has been cleaned!\n"
            # Write the logs to the ".txt" file in the "/sdcard/Taka/cache_cleaner" directory
            echo -e $logs2 >> /sdcard/Taka/cache_cleaner/logs.txt
        fi
        
        # Check if the "disable" file is in the "/sdcard/Taka/cache_cleaner" directory and stop the auto cleaning
        [ -f /sdcard/Taka/cache_cleaner/disable ] && break
        
        # Declaring a local variable with the name "now"
        local now=$(date +%s)
        # Pause script execution for ±1 hour
        sleep $(( interval - now % interval ))
    done
}

# Calling the "boot_completed" function
automatic

# Notes:
# For more information about Shell Script, you can google it.
# And respect my hard work, if you're using any parts of this script don't forget to give credit from me.
