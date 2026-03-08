#!/bin/bash

# A script to try and help cleanup the file system and identify security issues.
# stream to a file, add the executable header, and remove the # for lines you want to remove.

# Search for root files in your home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- ROOT FILES IN /HOME FOLDER ------------------------------------'
find /home -type f -user root | sed 's/^/# rm /'


# Search for root folders in your home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- ROOT FOLDERS IN /HOME FOLDER ----------------------------------'
find /home -type d -user root | sed 's/^/# rmdir /'


# Search for empty files in the home folder
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- EMPTY FILES IN /HOME FOLDER -----------------------------------'
find /home -type f -empty 2>/dev/null | sed 's/^/# rm /'


# Search for empty folders in the home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- EMPTY FOLDERS IN /HOME FOLDER ---------------------------------'
find /home -type d -empty 2>/dev/null | sed 's/^/# rmdir /'


# Search for executable files in the home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- GROUP / OTHER EXECUTABLE FILES IN /HOME FOLDER ----------------'
find /home -type f -perm -g+x,o+x | sed 's/^/# rm /'


# Search for public files in the home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- PUBLIC 777 FILES IN / FOLDER ----------------------------------'
find / -type f -perm 777 | sed 's/^/# rm /'


# Search for public files in the home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- (OTHER) READABLE FILES IN /HOME FOLDER ------------------------'
find /home -type f -perm -o+r | sed 's/^/# rm /'


# Locate big files on the system. (hSs = human, sort desc, show size.  + batches the find so they can be sorted together)
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- LARGE FILES (>50M) IN / FOLDER --------------------------------'
sudo find / -size +50M 2>/dev/null -exec ls -1hSs {} + | grep -E -v '^   0' | sed 's/^/# /'


# Locate big files in the /home system.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- LARGE FILES (>20M) IN /HOME FOLDER ----------------------------'
sudo find /home -size +20M 2>/dev/null -exec ls -1hSs {} + | grep -E -v '^   0' | sed 's/^/# /'


# Search for duplicate files in the home folder.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- DUPLICATE FILES IN /HOME FOLDER -------------------------------'
# %f returns filename, uniq -dc returns duplicates (d) and the count(c)
find /home -type f -printf "%f\n" | sort | uniq -dc | sort -r | sed 's/^/# /'


# Examine manually installed apps for potential removal.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- MANUALLY INSTALLED APPS (VIA APT) -----------------------------'
sudo grep -oP "Unpacking \K[^: ]+" /var/log/installer/syslog \
  | sort -u | comm -13 /dev/stdin <(apt-mark showmanual | sort) | sed 's/^/# sudo apt-get purge /'


# List running services.
echo ''
echo '# ------------------------------------------------------------------'
echo '# -- STATUS OF ALL AVAILABLE SERVICES  -----------------------------'
sudo service --status-all | sed 's/^/# /'

echo '# ------------------------------------------------------------------'
# end
