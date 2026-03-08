#!/bin/bash

# Prompt for the SSID
read -p "Enter the Wi-Fi SSID: " SSID

# Prompt for the Wi-Fi password
read -sp "Enter the Wi-Fi password: " PASSWORD
echo

# Connect to the Wi-Fi network
nmcli dev wifi connect "$SSID" password "$PASSWORD"

# Check the connection status
if [ $? -eq 0 ]; then
    echo "Connected to $SSID successfully."
else
    echo "Failed to connect to $SSID."
fi
