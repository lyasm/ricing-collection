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
    echo "Using img: $rand_img"
#    lutgen a -p oxocarbon-dark $rand_img -o /home/paul/ricing-collection/scripts/curr_img.png
#    lutgen a -p oxocarbon-dark -s 10 -P  $rand_img -o
    lutgen a -p rose-pine -S -n 10 -P -p 7 -l=8  $rand_img -o /home/paul/ricing-collection/scripts/curr_img.png
    swww img  /home/paul/ricing-collection/scripts/curr_img.png --transition-step 50 --transition-fps 244 --transition-duration 2 -t wipe
    wal -i /home/paul/ricing-collection/scripts/curr_img.png

	    break
    done
    fi
