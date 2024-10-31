#!/bin/bash

# Restart hyprpaper

# Check if the program is running
if pgrep -x hyprpaper > /dev/null; then
    # Program is running
    pkill -x hyprpaper
    sleep 2  # Wait a moment for the program to close
    hyprpaper &  # Restart the program
    NOTIFICATION="Hyprpaper has been restarted."
else
    # Program is not running
    hyprpaper &  # Start the program
    NOTIFICATION="Hyprpaper was not running! Started."
fi

# Send notification
notify-send "$NOTIFICATION"
