#!/bin/bash
# Script to generate a sha256 hash of all files in a folder structure recurrently for comparison.
# output is into a timestamped csv file.


echo "Warning - This will generate an SHA256 hash for all files recurrently, this could take a while"
find ./ -type f 
read -p "press a key to continue or close the terminal"

mkdir ${HOME}/.cache/sha256_compare
ts=$(date +"%Y-%m-%d_%H-%M-%S")
echo "-- WORKING --"

find "$(pwd)" -type f -print | while read -r file; do
    sha256sum "$file" | sed -E 's/^([[:xdigit:]]+)[[:space:]]{2}(.*)$/\1,"\2"/'
done > "${HOME}/.cache/sha256_compare/sha_log_${ts}.csv"

echo "-- FINISHED --"
