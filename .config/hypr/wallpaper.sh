#!/bin/bash

# Define directories
SOURCE_DIR="/home/vexx/NAS/Pictures/Wallpapers"
DESTINATION="/home/vexx/.cache/wal/wall"

# Use zenity to select a wallpaper from the source directory
file=$(zenity --file-selection --title="Select a Wallpaper" --filename="$SOURCE_DIR/")

# Check if a file was selected
if [[ -z "$file" ]]; then
    echo "No file selected."
    exit 1
fi

echo "You selected: $file"

# Copy the selected file to the destination
cp "$file" "$DESTINATION"
if [[ $? -ne 0 ]]; then
    echo "Error copying file to $DESTINATION"
    exit 1
fi

hyprctl hyprpaper unload all

# Preload the image in hyprpaper
hyprctl hyprpaper preload "$DESTINATION"

# Set the image in hyprpaper and unload unused images
hyprctl hyprpaper wallpaper eDP-1, "$DESTINATION"
hyprctl hyprpaper unload unused

# Clear old color schemes
wal -c

# Set the color scheme using wal
wal -i "$DESTINATION"

# Call the theme update script
/home/vexx/.config/mako/./update-theme.sh

notify-send "Wallpaper Set" "Successfully set the wallpaper and updated the color scheme."
