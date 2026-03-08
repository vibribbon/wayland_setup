# add current user to sudo
apt-get install sudo -y
sudo usermod -a -G sudo $USER
