#!/bin/bash


echo '------------------------------------------------------------------'
printf "\n"
printf "  %b\n" "DATE: \t  $(date)"
printf "  %b\n" "UPTIME: \t  $(uptime -p)"
printf "  %b\n" "USER: \t  $(echo $USER)"
printf "  %b\n" "HOSTNAME: \t  $(hostname -f)"
printf "  %b\n" "DOMAIN: \t  $(hostname -d)"
printf "  %b\n" "LOCAL IP: \t  $(hostname -I)"
printf "  %b\n" "GATEWAY IP: \t $(ip route | grep -m 1 'default' | sed -e 's/default via//g' )"
printf "  %b\n" "EXTERNAL IP:    $(curl -s http://whatismyip.akamai.com/)"
printf "  %b\n" "KERNEL: \t  $(uname -svm)"
printf "  %b\n" "SHELL: \t  $(echo $SHELL)"
printf "  %b\n" "RESOLUTION: \t  $(xrandr | grep '*' | awk '{ print $1 }')"
printf "  %b\n" "PACKAGES: \t  $(dpkg --get-selections | wc -l)"
printf "  %b\n" "CPU: \t\t  $(lscpu | grep "Model name:" | tr -s "[:blank:]" )"
# printf "  %b\n" "GPU: \t\t  $(lspci -v | grep 'Display controller: ' | sed -e 's/[^: ].*: //g')"  # Intel version
printf "  %b\n" "GPU: \t\t  $(lspci -v | grep 'VGA' | sed -e 's/[^: ].*: //g')"  # AMD version
printf "  %b\n" "MEMORY TOT:     $(free -mh | grep "Mem" | cut -c 17-25)"
printf "  %b\n" "MEMORY USD:     $(free -mh | grep "Mem" | cut -c 28-35)"
printf "\n"
echo '------------------------------------------------------------------'

