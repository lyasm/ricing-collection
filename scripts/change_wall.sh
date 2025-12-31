#!/bin/zsh

lutgen a -p rose-pine -S -n 10 -P -p 7 -l=8 $1 -o ./curr_img.png
swww img ./curr_img.png --transition-step 150 --transition-fps 244 --transition-duration 2 -t wipe 
