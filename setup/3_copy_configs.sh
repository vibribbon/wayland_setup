#!/bin/bash

# copy config files

# run as user not root / su
cp -a ~/git/wayland_setup/config_files/home/ ~/
sudo cp ~/git/wayland_setup/config_files/etc/sudoers.d/shutdown.txt /etc/sudoers.d/
sudo cp ~/git/wayland_setup/config_files/etc/default/grub /etc/default/
