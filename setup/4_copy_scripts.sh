#!/bin/bash

dir="~/git/wayland_setup/user_scripts/"

# Set all scripts in the current folder to executable.
find "$dir" -type f -print0 | xargs -0 chmod 755

# Copy all scripts in the current folder to /usr/local/bin/.
sudo mv ~/git/wayland_setup/user_scripts/. /usr/local/bin/
