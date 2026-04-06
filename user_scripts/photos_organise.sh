#!/bin/bash
# Script to sort and organise photos
# 


echo "Warning - this script will move and organise photos from the current directory recursively - make a backup first!"
read -p "press a key to continue or close the terminal"

echo "-- WORKING --"

mkdir ~/photos_out
mkdir ~/photos_out/non_images
mkdir ~/photos_out/corrupted
mkdir ~/photos_out/small
mkdir ~/photos_out/gif_png
mkdir ~/photos_out/finished

dir=${1:-.}


# find all the non images and move them to the 'non_images' folder
find "$dir" -type f ! \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.dng" -o -name "*.gif" -o -name "*.png" \) -print | while read -r file; do
	mv -n -- "$file" "$HOME/photos_out/non_images/$(basename -- "$file")"
done >> ./_log.txt


# find all corrupted files
find "$dir" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.dng" \) -print | while read -r file; do
	if ! exiftool "$file" >/dev/null 2>&1; then
		mv -n -- "$file" "$HOME/photos_out/corrupted/$(basename -- "$file")"
	fi
done >> ./_log.txt


# find all the gifs / pngs and move them to the folder
find "$dir" -type f \( -name "*.gif" -o -name "*.png" \) -print | while read -r file; do
	mv -n -- "$file" "$HOME/photos_out/gif_png/$(basename -- "$file")"
done >> ./_log.txt



# find all the small files under 2MB and move them to the 'small' folder
find "$dir" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.dng" \) -print | while read -r file; do
	if [ "$(stat -c%s -- "$file")" -lt 2000000 ]; then
		mv -n -- "$file" "$HOME/photos_out/small/$(basename -- "$file")"
	fi
done >> ./_log.txt


# place valid files into appropriate folders
find "$dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.dng" \) -print | while IFS= 
read -r file; do	
	[ -f "$file" ] || continue	
	base="$(basename -- "$file")"	
	sub="${base:4:6}"	# 5th-10th chars (index 4, length 6)	
	sub2="${base:10:2}"	# chars 11-12 (index 10, length 2)
	[ -n "$sub" ] || sub="__short__"
	[ -n "$sub2" ] || sub2="__xx__"
	mkdir -p -- "$HOME/photos_out/$sub/$sub2"	
	mv -n -- "$file" "$HOME/photos_out/$sub/$sub2/"
done >> ./_log.txt



echo "-- FINISHED --"
