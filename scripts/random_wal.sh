#!/bin/sh

img_dir=~/ricing-collection/Walls
wall_list=~/ricing-collection/scripts/.wall-list

initialize_wall_list() {
    rm "$wall_list"
#    find "$img_dir" -type f | shuf > "$wall_list"
     find "$img_dir" -maxdepth 6 -type f -exec identify -format "%w %h %i\n" {} + | awk '$1 > 1400 && $2 > 900 {print $3}' | shuf > "$wall_list"
}


if [[ $1 == "--init" ]]; then
    initialize_wall_list
else
    # Delete the first line of the .wall-list file
    sed -i 1d "$wall_list"
    # Get the new first line from the file
    # Loop until a suitable image is found
    while true; do

    rand_img=$(head -n 1 "$wall_list")
	# Check image dimensions 
        # Moved to init
#	width=$(identify -format "%w" "$rand_img")
#	height=$(identify -format "%h" "$rand_img")
#	echo "Checking img: $rand_img"
#	if ((width > 1300 && height > 830)); then
	    echo "Using img: $rand_img"
	    swww img "$rand_img" --transition-step 50 --transition-fps 20 --transition-duration 2 -t wipe

	    break
#	else
#	    echo "Image dimensions not suitable, trying again..."
#	    sed -i 1d "$wall_list"
#	fi
    done
    fi
