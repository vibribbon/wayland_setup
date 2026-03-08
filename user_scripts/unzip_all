#!/bin/bash
# Script to unzip all major compressed files in the current folder into their own folder matching the filename.
# 


echo "Warning - The following .zip / .7z / .rar files in the current folder will be extracted with overwrite!"
find ./ -type f \( -name "*.zip" -o -name "*.rar" -o -name "*.7z" \)
read -p "press a key to continue or close the terminal"

echo "-- UNZIPPING --"
mkdir ${HOME}/.cache/unzip

find . -type f \( -name "*.zip" -o -name "*.rar" -o -name "*.7z" \) -print | while read -r file; do
    dir_name="$(basename "$file" .zip)"
    dir_name="${dir_name%.*}"  # To remove .rar or .7z if present
    dir_name="${dir_name%.*}"
    mkdir -p "$dir_name"
    7z x "$file" -o"$dir_name" -y
done >> ${HOME}/.cache/unzip/unzipped_log.txt

echo "-- FINISHED --"
