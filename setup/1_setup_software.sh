#!/bin/bash


# ----------------------------------------------------------------------
## NOTES
# Software setup
# Modular file - comment/uncomment as required for your setup then run
# the script ONCE as SU.  
# All file sizes are estimates based on a clean install, shared libaries
# will reduce the total size as more apps are installed. 
# note - this is the wayland version of this script.
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## Confirm going ahead with update - prevents accidents!
echo 'Starting setup for the following user'
my_username=$(who | head -n 1 | cut -d ' ' -f 1)
echo $my_username
read -p "Enter y to continue: " response_yn
if [[ $response_yn == "y" || $response_yn == "Y" ]]
then
	echo 'Starting Install'
else
	exit 0
fi
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## REPOS
# Setup Apt repos to include non-free and contrib
# Add ' non-free contrib' to the lines starting 'deb http'
sed -i '/^deb http/ s/$/ non-free contrib/' /etc/apt/sources.list

# comment out the source lines (they are optional).
sed -i 's/\(^deb-src http\)/# \1/g' /etc/apt/sources.list
apt-get update	# refresh repos

# Install flatpak - packages with (flatpack) require this
apt-get install -y flatpak		# repo & package manager (cli)
# Add flathub repo to flatpak.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install GIT framework for repo access.
# apt-get install -y git		# code sync & backup (cli) [MB]
# ----------------------------------------------------------------------

## OS COMPONENTS
# these are neede for a GUI!
apt-get install -y labwc			# window manager ('windows')

apt-get install -y swayidle			# screen timeout
apt-get install -y swaylock			# screen locker
apt-get install -y wlopm			# power controller
apt-get install -y wlr-randr		# monitor config
apt-get install -y wdisplays		# display manager
apt-get install -y swaybg			# wayland backgrounds
apt-get install -y wob				# slider bars
apt-get install -y yambar			# minimal taskbar
# apt-get install -y lemonbar		# minimal taskbar
# apt-get install -y xfce4-panel	# taskbar
apt-get install -y gammastep		# wayland gamma / nightmode
# apt-get install -y fuzzel			# launcher
# apt-get install -y tofi			# launcher
# apt-get install -y nwg-bar		# launcher (default power)
apt-get install -y dmenu			# custom menu
apt-get install -y yad				# popup dialog box creator
apt-get install -y nwg-look			# theme chooser
apt-get install -y grim				# screenshot
apt-get install -y mako				# wayland notifications
apt-get install -y wlrctl			# wayland virtual window controls
# apt-get install -y nwg-hello		# simple wayland login greeter
# apt-get install -y network-manager		# graphical network manager

# apt-get install -y libgtk-3-dev	# gtk3 framework

# ----------------------------------------------------------------------
## INSTALL CORE APPS

## ADMIN
apt-get install -y sudo				# admin permissions

## TERMINALS
apt-get install -y foot				# simple terminal (cli)
# apt-get install -y tmux			# terminal multiplexor (cli) [MB]
# apt-get install -y alacritty		# terminal (cli) [10MB]
# apt-get install -y xfce4-terminal	# terminal (cli) [10MB]

## TEXT EDITORS
apt-get install -y nano			# simple text editor (cli)
apt-get install -y geany		# text editor
apt-get install -y geany-plugin-treebrowser geany-plugin-spellcheck	geany-plugin-overview	# geany plugins
# apt-get install -y kate		# text editor (cli) [300MB]
# apt-get install -y vim		# text editor (cli) [43MB]
# apt-get install -y notepadqq	# text editor [300MB]
# apt-get install -y ne			# tiny text editor (cli) [10MB]
# apt-get install -y codium		# big text editor [500MB]
# apt-get install -y micro		# nano alternative (cli)

## CODING
apt-get install -y python3 python3-pip # install python
# apt-get install -y build-essential ccache # install c/c++ compiler

## FILE SYSTEM
apt-get install -y p7zip-full		# compression manager (cli)
apt-get install -y p7zip-rar		# rar extension for 7zip (cli)
# apt-get install -y xarchiver		# compression manager
apt-get install -y engrampa			# compression manager
apt-get install -y ranger			# file manager (cli) [70MB]
apt-get install -y pcmanfm 			# file manager
# apt-get install -y thunar			# file manager [40MB]
apt-get install -y gnome-disk-utility	# partition manager [10MB]
apt-get install -y ncdu				# disk usage (cli)
apt-get install -y rsync			# backup and sync (cli)
apt-get install -y clamav clamtk	# virus scanner & interface [100MB]
# apt-get install -y extundelete	# undelete tool for ext (cli) [<1MB]
# apt-get install -y nwipe			# file wiper for flash drives / magnetic media (cli) {<1MB]

## NETWORK
apt-get install -y ufw				# firewall (cli) [5MB]
apt-get install -y gufw				# ufw optional front end [460MB]
apt-get install -y curl				# download manager (cli)
# apt-get install -y wget				# older download manager (cli)
# apt-get install -y transmission	# download manager
apt-get install -y ssh				# remote terminal control (cli)
# apt-get install -y w3m			# web browser (cli) [3MB]
apt-get install -y firefox-esr		# web browser
# apt-get install -y chromium		# web browser
# apt-get install -y newsboat		# rss tool (cli)
# apt-get install -y mutt			# email client (cli)
# apt-get install -y filezilla		# ftp client

## MONITORING & DIAGNOSTIC
apt-get install -y htop			# task manager (cli) [<1MB]
apt-get install -y nvtop		# gfx monitor (cli) [<1MB]
apt-get install -y lact			# gfx monitor
apt-get install -y powertop 	# power usage (cli)
apt-get install -y iftop		# IP traffic monitor (cli)
apt-get install -y nethogs		# bandwith usage (cli)
# apt-get install -y nmap		# port mapper (cli)
# apt-get install -y traceroute	# internet traceroute (cli)
# apt-get install -y whois		# whois identification (cli)
# apt-get install -y finger		# network machine details (cli)
# apt-get install -y conky		# system monitor [MB]
# apt-get install -y cpu-x 		# CPU informaiton like cpu-z

## ACCESSORIES
apt-get install -y ncal			# basic calendar (cli) [<1MB]
apt-get install -y gsimplecal	# basic calendar [<1MB]
# apt-get install -y calcurse	# diary & todo (cli) [2MB]
apt-get install -y icdiff		# colour text file compare (cli) [<1MB]
apt-get install -y bc			# basic calculator (cli) [<1MB]
# apt-get install -y mate-calc	# basic calculator [<1MB]
# apt-get install -y eza		# ls replacement (cli) [2MB]
# apt-get install -y pandoc		# document converter (cli) [200MB]
# apt-get install -y wordnet	# dictionary & thesaurus (cli) [36MB]
# apt-get install -y xfburn		# basic dvd/cd creator [10MB]
apt-get install -y bleachbit	# system cleanup
apt-get install -y tty-clock	# clock and date (cli) [<1MB]
apt-get install -y fsearch	# file search [<1MB]
# apt-get install -y caca-utils	# images to ascii (cli) [MB]
# apt-get install -y gcolor3	# colour picker [MB]

## MUSIC
apt-get install -y moc			# music player (cli) [5MB]
# apt-get install -y clementine	# music player [90MB]
# apt-get install -y ffmpeg		# audo & video converter (cli) [125MB]
apt-get install -y audacity		# non-linear audio editor [140MB]
# apt-get install -y lmms		# full audio recording station daw [50MB]

## GRAPHICS & IMAGES
# apt-get install -y feh		# frameless image viewer [80MB]
# apt-get install -y qiv			# image viewer [<1MB]
apt-get install -y swayimg	# image viewer [10MB]
# apt-get install -y mirage 	# image viewer [20MB]
# apt-get install -y viewnior 	# image viewer [20MB]
# apt-get install -y pinta		# image [MB]
# apt-get install -y sxiv		# lightweight image viewer [70MB]
# apt-get install -y nomacs 	# image viewer and organiser [130MB]
# apt-get install -y darktable	# image / raw viewer & organiser [180MB]
apt-get install -y gimp			# photo editor [310MB]
apt-get install -y inkscape		# drawing package [300MB]
# apt-get install -y krita		# painting package [710MB]
# apt-get install -y mupdf		# pdf viewer [80MB]
apt-get install -y zathura		# pdf viewer [80MB]
# apt-get install -y sioyek		# pdf viewer [160MB]

## VIDEO & ANIMATION
apt-get install -y shotcut	# non-linear video editor [550MB]
apt-get install -y handbrake	# video (re)encoder [130MB]
apt-get install -y mpv		# minimalist media player [10MB}
# apt-get install -y vlc		# media player [220MB}
# apt-get install -y blender	# rendering and 3d printing [680MB]
apt-get install -y yt-dlp		# youtube downloader
# apt-get install -y obs-studio	# Screen recording studio

## OFFICE
apt-get install -y libreoffice-writer	# document writing
# apt-get install -y abiword			# document writing alternative to libreoffice writer [50MB]
apt-get install -y libreoffice-impress	# slideshow design
apt-get install -y libreoffice-calc		# spreadsheet creation
# apt-get install -y r-base				# r development
# sudo flatpak install rstudio			# r frontend ide (flatpak)
apt-get install -y scribus				# desktop publishing creator
# apt-get install -y dia				# flowchart / diagram creator
# apt-get install -y calibre			# ebook mangement
# apt-get install -y orca				# a screenreader [80MB]

# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## SERVERS
apt-get install -y cups 	# printer server
# apt-get install -y mariadb-server
# apt-get install -y apache2 #www server
# apt-get install -y php libapache2-mod-php pch-cli php-mysql php-zip php-curl php-xml #php and addons
# curl -fsSL https://ollama.com/install.sh | sh		# ollama ai server framework
# apt-get install -y samba cifs-utils	# Setup file sharing server
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## DRIVERS
# install pipewire audio [20MB]
apt-get install -y pipewire pipewire-pulse pipewire-audio-client-libraries libspa-0.2-bluetooth libspa-0.2-jack gstreamer1.0-pipewire
# apt-get install mesa-utils mesa-vulkan-drivers libvulkan1 libvulkan-dev firmware-amd-graphics
# apt-get install -y firmware-linux firmware-linux-nonfree	# optional non-free firmware
# dpkg --add-architecture i386	# install i386 architecture
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## GAMING
# apt-get install -y steam						# steam gaming frontend
# sudo flatpak install lutris					# wine gaming stores & emulation (flatpak)
# sudo flatpak install net.davidotek.pupgui2	# Manage glorious eggroll installs
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## SPECIAL PURPOSE
# apt-get install -y fastboot # android toolkit (cli)
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
## OPTIONAL ALTERNATIVES
# apt-get install -y mc	# alt file manager (cli) [9MB]
# apt-get install -y gparted	# alt partition manager [9MB]
# lightworks - not available via repo
# meowsql # sql client 
# fresh editor - (appimage) https://github.com/sinelaw/fresh/releases
# ----------------------------------------------------------------------

