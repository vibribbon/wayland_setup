#!/bin/bash

# Display a confirm message and shutdown on yes.
yad --title=Confirm --button=gtk-yes:0 --button=gtk-no:1 --text='Shutdown system?' || exit 1; poweroff
