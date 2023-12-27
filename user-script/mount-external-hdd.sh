#!/bin/bash

DEVICE="/dev/sda1"
MOUNT_POINT="/mnt"

if grep -qs "$DEVICE $MOUNT_POINT" /proc/mounts; then
    echo "Unmounting $DEVICE..."
    sudo umount "$MOUNT_POINT"
    echo "Unmounted successfully."
else
    echo "Mounting $DEVICE to $MOUNT_POINT..."
    sudo mount "$DEVICE" "$MOUNT_POINT"
    echo "Mounted successfully."
fi
