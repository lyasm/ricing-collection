#!/bin/zsh


image_dir=~/ricing-collection/Walls/

# Loop until a suitable image is found
while true; do
    # Choose a random image from the subdirectories
    rand_img=$(find "$image_dir" -type f | shuf -n 1)

    # Check image dimensions
    width=$(identify -format "%w" "$rand_img")
    height=$(identify -format "%h" "$rand_img")
    echo "Checking image: $rand_img"

    if ((width > 1700 && height > 1000)); then
	echo "Using image: $rand_img"
	swww img "$rand_img" --transition-step 10 --transition-fps 50 -t grow

	# Hyprctl hyprpaper preload "$random_image"
	# hyprctl hyprpaper wallpaper "DP-1,$random_image"
	# hyprctl hyprpaper wallpaper "eDP-1,$random_image"
	# hyprctl hyprpaper unload all

        break
    else
        echo "Image dimensions not suitable, trying again..."
    fi
done
