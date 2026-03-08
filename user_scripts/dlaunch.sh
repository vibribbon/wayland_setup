#!/bin/bash

# A really basic launcher!

# If there is a single parameter then add it as a bookmark, otherwise run the menu.
# Hold shift and enter to force what you type in the bar instead.
touch ~/dlaunch.txt
touch ~/dlaunch_no_term.txt
dl=$(cat ~/dlaunch.txt | dmenu -i -l 40 -sb '#495F41' -sf '#00FDDC' -p "Command (S-RTN override):")

# If the command is in the dlaunch_no_term list then do not open a terminal.
if grep -q $dl ~/dlaunch_no_term.txt; then
    $dl
else
	# edit 'foot' to be your terminal of choice.
    foot -H -e $dl
fi

# add to the new item to the menu if it does not exist.
if grep -q $dl ~/dlaunch.txt; then
    :
else
    echo $dl >> ~/dlaunch.txt
fi
