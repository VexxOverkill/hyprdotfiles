#!/bin/bash

#!/bin/bash

# List of mount points or devices to unmount
mount_points=(
    "/home/vexx/NAS/Pictures"
    "/home/vexx/NAS/Documents"
    "/home/vexx/NAS/Video"
    "/home/vexx/NAS/Music"
)

for mount_point in "${mount_points[@]}"; do
    if mountpoint -q "$mount_point"; then
        echo "Unmounting $mount_point..."
        umount "$mount_point"
        if [ $? -eq 0 ]; then
            echo "$mount_point unmounted successfully."
        else
            echo "Failed to unmount $mount_point."
        fi
    else
        echo "$mount_point is not mounted."
    fi
done

systemctl poweroff
