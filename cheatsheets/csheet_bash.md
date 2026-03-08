Linux Cheatsheet
=====================================
== IMPORTANT NOTES =================
Entries here are Name;Usage;Example;install

Linux systems are strictly case sensitive.
sudo invokes superuser permissions.
man keyword_name displays help for an item.

. /file-name will run a bash script (.sh) this is an abbreviation for source file-name
| is the universal pipe to redirect output
> redirects output to a file
>> appends output to the end of a file
clear clears the terminal screen
[tab] autofills filenames etc
[q] or [esc] stops most tasks gracefully
[ctrl] + c terminates a process
[Ctrl] + z stop process into background
fg resume a stopped process
adding " &" frees the terminal when executing
; can seperate subsequent tasks
&& to run subsequent tasks on success only
[ctrl] + a jump to start of line
[ctrl] + e jump to end of line
[ctrl] + u cut test before cursor
[ctrl] + k cut test after cursor
[ctrl] + w cut previous word 
[ctrl] + y paste cut text
[alt] + . paste last argument
Some installs require non-free contrib adding to /etc/apt/sources.list

=====================================


=====================================
== system monitoring ==================

-- htop  --
list system processes and resources.
htop (q to quit)
sudo apt-get install htop

-- top --
Simpler version of htop, useful for batch exports using -b (can also use PS)
Top -b -n iterations > out_file.txt

-- kill --
stop a process
kill [process id from top / htop]

-- iotop --
monitor system io access
iotop

-- atop --
monitor services on local machine
atop

-- lsof --
Lists open files on the system, use with grep
lsof | grep filename
lsof -u username
lsof -p processid

-- free --
show available memory resources.
free -wh

-- detailed memory usage --
Cat /proc/meminfo

-- nmon --
a combined suite of monitoring tools
nmon
sudo apt-get install nmon

-- dstat --
Basic scrolling system monitor
dstat
sudo apt-get install dstat

-- iwatch --
Directory monitoring tool (60MB)
iwatch directory_path
sudo apt-get install iwatch

-- sar --
ongoing monitoring for servers
sar -u (for CPU)
sar -b (for io)
sar -r (for memory)
sar -S (for swap)
sar -u -f file_path/file_name (use log)
sudo apt-get install sysstat
Don't forget to turn on monitoring in /etc/default/sysstat

-- stress-ng --
System stress testing and benchmarking
stress-ng
sudo apt-get install stress-ng

-- radeontop --
Radeon performance monitoring
radeontop
sudo apt-get install radeontop

-- intel-top --
Intel GPU monitoring
intel_gpu_top
sudo apt-get install intel-gpu-tools

-- nvidia-smi --
top tool for nvidia gpus
nvidia-smi
sudo apt-get install nvidia-smi


=====================================
== System info ========================

-- lscpu --
CPU details
lscpu

-- cpuid --
List CPU details (lots)
cpuid
sudo apt-get install cpuid

-- inxi --
Basic system information
inxi
sudo apt-get install inxi

-- lspci --
List available hardware, resources men etc
lspci -vnn 

-- uname --
lists details of the machine and os
uname -a

-- neofetch --
lists details of the machine and os
neofetch
sudo apt-get install neofetch

-- glxinfo --
List details of graphics driver (note caps)
glxinfo | grep OpenGL

-- jobs --
List jobs running on the system
jobs 

-- nice / renice --
Nice priority value -20 to 19 (0 is default)
nice value executable-path
renice value process-id


=====================================
== package management ================

-- apt-get --
Installs and removes software
sudo apt-get update
sudo apt-get install [app_name]
sudo apt-get install -f file_path/file_name
sudo apt-get remove [app_name]
sudo apt-get autoclean
sudo apt-get autoremove

-- flatpak --
Container software store
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak search [application_name]
flatpak install flathub application_name
flatpak uninstall application_name
flatpak list
flatpak update
flatpak uninstall --unused
sudo apt-get install flatpak

-- synaptic --
Old school package manager
Synaptic
sudo apt-get install synaptic

-- which --
Check if package is installed
which app-name

-- whereis --
Locate an app on the file system.
whereis app-name

-- deb-get --
A useful package manager for non standard or proprietary packages outside of the Debian universe.
deb-get list
deb-get install package-name
Also supports update, upgrade, remove.
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

-- install backports --
Use to install newer software from the testing release
sudo apt-get install package-name -t bullseye-backports

Pull latest kernel and graphics drivers
sudo apt-get install firmware-amd-graphics linux-image-amd64 -t bullseye-backports


=====================================
== maintenance =======================

-- tlp --
Optimise laptop battery life
tlp
sudo apt-get install tlp

-- rsync --
Synchronise directories and files
rsync -avP --delete /source /destination
rsync -avP --delete -e ssh user@url:/source /destination
--delete removes non matching files from the destination
sudo apt-get install rsync

-- rclone --
Sync to cloud storage
rclone config
curl https://rclone.org/install.sh | sudo bash

-- chroot --
Create a separate list
 jailed environment for mount recovery / bootloader config / testing
chroot location /bin/bash

-- reset --
Fix a messed up terminal.
reset


=====================================
== filesystem navigation ================

-- pwd --
prints the current working directory in full
pwd

-- cd --
change current directory, .. is back
cd directory_name
cd ..
cd ~ (straight to home)
cd - (last directory)


=====================================
== filesystem management ==============

-- ls --
list files and folders. 
(-a include hidden, t sort by modified, S sort by size)
ls -a 
ls -lah

-- tree --
display a tree structure of the filesystem.
tree or tree -a
sudo apt-get install tree

-- cp --
copies a file
cp dir_and_file_to_copy dir_and_new_filename

-- mv --
move a file, useful as a rename
mv sourcefile new_location_and_filename

-- rm --
removes files / directories, recursive!
rm -rvi directory1 
r is recursive, v for removed files output, I for confirm.

-- touch --
creats a new file at the given location
touch /home/user/new_file.txt

-- mkdir --
makes directories or dirs & sub dies.
mkdir dirname1
mkdir -pv dir/parentdir/childdir

-- find --
find files and directories on the system by
multiple methods.
find /home/ -name *.txt

-- diff --
compare files, < for left file > for right.
diff file1 file2 > output.txt

-- icdiff --
Another diff utility.
sudo apt-get install icdiff

-- cmp --
compare binaries or text files, 1 line output
cmp path/file1 path/file2.

-- chown --
changes ownership of a file
sudo chown username filename

-- chmod --
changes file permissions r w x = 4 2 1 
Owner, group, other
sudo chmod 744 filename

-- ranger --
interactive cli file manager / reader.
ranger
sudo apt-get install ranger

-- nnn --
Simple file manager
nnn
sudo apt-get install nnn

-- mc --
Dual pane file manager
mc
sudo apt-get install mc

-- mount --
mounts a device onto the filesystem (folder
 must exist)
mount /deb/sdb1 /home/user/m_usb
mount -t vfat /deb/sdb1 /media/dir

-- umount --
unmounts a device onto the filesystem
umount /dev/sdb1

-- ncdu --
visual file & folder size reporting
ncdu 
sudo apt-get install ncdu

-- df --
lists mountpoint drive space usage
df -Bm

-- 7z --
extract / compress files. * will add all
extract (default same directory)
Permissions are not stored!
7z e compressed_file -o/home/user/
7z x compressed_file
add (mx=0 is store 9 is ultra)
7z a outputfile files_to_compress -mx=9 
  -p[password] -mhe=on -mem=AES256
other
7z l compressed_file_to_list
7z d compressed_file file_to_delete_from_zip
7z u compressed_file file_to_add_to_zip
7z t file_to_test

-- tar --
Combine files with permissions (when sudo)
tar -cvf my_file.tar file_name
tar -xvzf myfile.tar
sudo tar -xvf my_file.tar

-- sha256sum --
Create a sha hash
Echo -n "hello" | sha256sum

-- git --
Synchronising a working environment
git clone https://github.com/git-username/project-name
From the git working folder:
git status 
Sync up to git
git add . & git commit -m "message" & git push 
Sync down from git
git pull
sudo apt-get install git


=====================================
== file reading / editing =================

-- less --
open a file for scrollable reading (q quit) 
less file1

-- fold --
reads file at specified width preserve words 
fold -w 50 -s filename > output.txt

-- cat --
Concatenates files and displays them.
cat file1 file2 > output.txt

-- wc --
Counts words and lines in files.
Output lines/words/characters/filename
wc file1.txt file2.txt

-- aspell --
Spellcheck files or pipes
aspell -c file1

-- nano --
cli text editor 
nano /home/user/file.txt

-- micro --
Slimline text editor, nano alternative.
micro
sudo apt-get install micro

-- vim --
Heavyweight text editor with ide features
vim file-name
sudo apt-get install vim

-- xwpe --
Classic style text editor with programming features
xwpe
xwe
sudo apt-get install xwpe

-- mupdf-tools --
PDF toolkit can convert to text or extract images.
mutools convert -o output-file input-file
sudo apt-get install mupdf-tools

-- pandoc --
Converts document formats (150MB+)
pandoc
sudo apt-get install pandoc

-- chafa --
CLI image viewer as thumbnail
chafa file1.jpg file2.png

-- feh --
A quick clickable image gallery (requires x)
feh -t --thumb-height 150 --thumb-width 200 directory_path
sudo apt-get install feh


=====================================
== file and string manipulation ===========

-- echo -- 
outputs a string to screen or pipe etc
echo hello world > output.txt
echo hello world >> output.txt

-- tput --
Changes text colour in the terminal, 0 resets
tput setaf 3 && echo hi
tput setab 3 && echo hi

-- printr --
Prints text to the terminal
printr /s/n "hello"

-- head --
Open the start of a text file and autorefresh
head -f filename
Ctrl c to stop
| head 5

-- tail --
Open the end of a text file and autorefresh
tail -f filename
Ctrl c to stop
| tail 5

-- grep --
search for text within a file(s).
grep find-me *
| grep "findme" 

-- ack --
Search within files
ack -w --text search_string
ack -c  search_string (returns counts)
sudo apt-get install ack-grep

-- sed -- 
string substitution (s/string_from/string_to)
^ start; $ end; [] char range; g global  
cat file1|sed 's/a/A/g' > output.txt
use [^string].*string to identify text up to a point

-- tr --
Character substitution / removal.
Chars1.character1 replaced by chars2.character1 etc.  -s will replace repeat characters with a single character.  No chars2 will delete instances.
tr -s 'chars1' 'chars2'

-- cut --
cut a section of a string
cut -c <character from>-<character to>

-- nl --
counts objects in the terminal, pipe to
ls | ln

-- column --
pipe output into columns to organise output
| column -t

-- truncate --
Empty a file without deleting
truncate -s 0 filename

-- look --
Lookup a string in the dictionary and return any truncated words.
look text-string

-- ispell --
Interactive spell checker
echo helo | ispell
ispell


=====================================
== partition management ===============

-- lsblk --
lists all partitions and their heirarchy
lsblk

-- cfdisk / fdisk --
partition manager / listing
sudo cfdisk
sudo fdisk -l

-- dd --
writes / creates images to media - CAUTION!
sudo dd if=filename.img of=/dev/sdb bs=4096 status=progress
sudo dd if=/dev/sdb of=filename.img bs=4096 status=progress
overwriting media
sudo dd if=/dev/zero of=/deb/sdb bs=4096
sudo dd if=/dev/random of=/deb/sdb bs=4096

-- findmnt --
List all mount points
findmnt

-- cryptsetup --
Opens drives encrypted with luks
sudo cryptsetup luksOpen /dev/sda d_name
Then mount from /dev/mapper/d_name


=====================================
== network ===========================

-- ip address --
show a machines ip address(s)
ip address

-- ping --
reports access and latency to a target
ping 8.8.8.8

-- traceroute --
lists hops to reach a target network machine
traceroute 8.8.8.8
sudo apt-get install traceroute

-- whois --
Details regarding a websites hosting
whois 8.8.8.8
sudo apt-get install whois

-- host --
ip address and details of a hosted website
host 8.8.8.8
host google.com
Use -a for more detail
sudo apt-get install host

-- ss --
list active sockets on the system
ss -at (tcp or -au for udp)

-- nmap --
a port mapping utility
nmap 8.8.8.8
sudo apt-get install nmap

-- speedtest --
test internet upload / download bandwidth
speedtest-cli
sudo aot-get install speedtest-cli

-- vnstat --
report data usage up and down day / month
vnstat or vnstat -l
sudo apt-get install vnstat

-- nethogs --
list live network bandwidth usage by app
nethogs
sudo apt-get install nethogs

-- bmon --
a simple cli network flow monitor
bmon
sudo apt-get install bmon

-- iftop --
monitor live network traffic on the host
iftop
sudo apt-get install iftop

-- iptraf --
ip traffic toolkit for networking
iptraf
sudo apt-get install iptraf-ng

-- ssh --
get a terminal for a remote machine
ssh username@ip_address
sudo apt-get install ssh

-- scp --
copy a file to / from a remote machine
scp username@ip_address:file_path destination
scp a@ip:/home/*.txt /home/user/downloads

-- wget --
downloads remote files to current folder
wget -O latest_file.txt website_address
wget -i file_of_links.txt
mirror website
wget -m -k -p website_address
sudo apt-get install wget

-- aria2 --
download tool inc torrent
aria2c url
aria2c -I file_of_links.text
sudo apt-get install aria2

-- curl --
download various web resources
curl url
sudo apt-get install curl

-- network manager nmcli --
a network conneciton manager (30M)
nmcli dev status
nmcli
nmcli d wifi connect my-ssid password my-password
sudo apt-get install network-manager

-- wpasupplicant --
Network connection tool for wifi
WPA supplicant
sudo apt-get install wpasupplicant

-- ufw --
linux firewall, less involved
sudo ufw enable
sudo ufw status verbose 
sudo ufw status numbered (or app list)
sudo ufw allow ssh (or 22/tcp)
sudo ufw delete [rule_number]
sudo apt-get install ufw

-- iptables --
linux firewall, fairly involved
sudo iptables -L -v
sudo apt-get install iptables

-- w3m --
CLI web browser with images
w3m www.google.com

-- elinks / links --
CLI web browser with images
elinks
sudo apt-get install elinks

-- elinks / links --
CLI web browser with images
elinks
sudo apt-get install httpie


=====================================
== user session ========================

-- exit --
logs out the current user / closes terminal
exit

-- reboot --
restarts the machine (no warnings)
sudo reboot now

-- shutdown --
turns off the machine (no warnings)
sudo shutdown now

-- lpr --
Print a file
lpr -p printer_name path_&_file

-- print --
Print a file
print path_&_filename

-- systemctl --
Systemd commands to control system units (processes)
sudo systemctl
sudo systemctl list-unit-files --type=service
sudo systemctl status package-name
sudo systemctl start package-name
sudo systemctl restart package-name
sudo systemctl stop package-name
sudo systemctl enable --now package-name
sudo systemctl disable package-name


=====================================
== users ==============================

-- w --
lists logged in users with times etc
w

-- useradd --
add a new user to the system
sudo useradd -m -s /bin/bash username

-- userdel --
deletes a user and all data / home directory
sudo userdel -r username

-- passwd --
Change user passwords
passwd
sudo passwd username
sudo passwd root

-- chsh --
Change a users default shell (if you forget)
chsh -s /bin/bash username

-- groups --
list a users groups
groups username

-- groupadd --
add a new group to the system
sudo groupadd groupname

-- groupdel --
add a new group to the system
sudo groupdel groupname

-- usermod --
puts user into the groups listed only
usermod -a -G user_group1,group2 username

-- history --
list all of your terminal commands issued
history

-- timetrap --
track time spent using apps
sudo apt-get install timetrap


=====================================
== production =========================

-- r --
Stats spreadsheet, useful with rstudio editor
r sctipt_dir_name
sudo apt-get install r-base


=====================================
== audio / video =======================
-- moc --
A terminal music player
mocp
sudo apt-get install moc

-- alsamixer --
a cli volume control / mixer
alsamixer
sudo apt-get install alsa-utils

-- youtube-dl --
Download video(s) from streaming sites
youtube-dl url1 url2 or list.txt
youtube-dl -o filepath/outfile url1
youtube-dl -F url (list formats)
youtube-dl -f [quality number -F] or best
youtube-dl -x --audio-format mp3 url1
sudo apt-get install youtube-dl

-- flac --
Encode to and from flac
flac --best --verify -T "ALBUM=album_name" *.wav
flac -d in file.flac

-- ffmpeg --
An Audio / video encoder
ffmpeg -i filename -hide_banner
Convert
ffmpeg -i vid_in.wav -qscale 0 vid_out.mp4
ffmpeg -I aud.flac aud.mp3
Extract audio
ffmpeg -i vid.mp4 -vn -ab 160k audio.mp3
sudo apt-get install ffmpeg


=====================================
== communication =====================

-- mutt --
An email client configured per user account
mutt  (read email)
mutt -s subject -c cc's -a attachment address
sudo apt-get install mutt

-- alpine --
Lightweight email client
alpine
sudo apt-get install alpine

-- newsboat --
An RSS reader
newsboat
sudo apt-get install newsboat

-- weechat --
Old school irc chat client
weechat
sudo apt-get install weechat

-- irssi --
Old school irc chat client
irssi
sudo apt-get install irssi


=====================================
== date and time =======================

-- date --
reports the current date and time.
date

-- tty-clock --
Reports time and date
tty-clock
sudo apt-get install tty-clock

-- buici-clock --
A stylised circular clock
Buici-clock
sudo apt-get install buici-clock

-- xclock --
Basic x clock in xorg -d for digital
Xclock

-- cal --
displays a mini calendar.
ncal -3
sudo apt-get install ncal

-- calcurse --
Full calendar app
calcurse
sudo apt-get install calcurse


=====================================
== novelties ===========================

-- weather --
returns the weather (needs wide terminal)
curl wttr.in/london
requires curl

-- ANSI weather --
Simple weather forecast
ansiweather  -f 3 -s true -l london
ansiweather  -s true -d true -l london
sudo apt-get install ansiweather

-- gifsicle --
Create and manipulate gifs
gifsicle --delay=10 --loop *.gif > anim.gif
gifsicle anim.gif '#0' > first frame.gif
sudo apt-get install gifsicle

-- ttygif --
Make gifs of TTY commands
sudo apt-get install ttygif

-- mapscii --
CLI maps viewer
telnet mapscii.me

-- glxgears --
A benchmarking tool that renders gears
glxgears
sudo apt-get install mesa-utils

-- xdotool --
A tool to mimic keyboard and mouse input
xdotool type "hello"
xdotool mouse 3
sudo apt-get install xdotool

-- tldr --
A 1-page man common use examples
tldr executable
sudo apt-get install tldr


=====================================
== terminals ==========================

--xfce4-terminal --
Mid weight terminal with keyword colour highlighting and copy paste
sudo apt-get install xfce4-terminal

-- xterm --
simple lightweight terminal
xterm

-- terminator --
Heavy weight terminal with mux etc
sudo apt-get install tetminator

-- st --
Lightweight terminal
No deb candidate

-- guake --
Pull down terminal
sudo apt-get install guake

-- tmux --
Multiplex (split) your terminal
sudo apt-get install tmux


=====================================
== games =============================

sudo apt-get install nudoku
sudo apt-get install 2048-cli
sudo apt-get install greed
sudo apt-get install pacman4console
sudo apt-get install ninvaders
sudo apt-get install zagband
sudo apt-get install bastet
sudo apt-get install nethack-console
sudo apt-get install nsnake
sudo apt-get install gnuchess
sudo apt-get install backgammon
sudo apt-get install cribbage


=====================================
=====================================
END
