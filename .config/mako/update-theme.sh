#!/bin/sh

# Load colors from wal
. ~/.cache/wal/colors.sh

conffile="/home/vexx/.config/mako/config"

# Associative array, color name -> color code.
declare -A colors
colors=(
    ["background-color"]="$color8"   # Use color0 for background
    ["text-color"]="$color1"          # Use color7 for text
    ["border-color"]="$color4"         # Use color4 for border
)

# Update the Mako config file
for color_name in "${!colors[@]}"; do
    sed -i "0,/^$color_name=/s/^$color_name=.*/$color_name=${colors[$color_name]}/" "$conffile"
done

# Optionally print updated colors for verification
echo "Updated colors:"
for color_name in "${!colors[@]}"; do
    echo "$color_name = ${colors[$color_name]}"
done

# Reload Mako
if ! makoctl reload; then
    echo "Failed to reload Mako."
fi
