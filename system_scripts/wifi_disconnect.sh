#!/bin/bash

# List connecitons
nmcli dev

# Prompt for the connection name
read -p "Enter the Wi-Fi SSID you want to disconnect from: " SSID

# Disconnect from the Wi-Fi network
nmcli connection down "$SSID"

# Check the status
if [ $? -eq 0 ]; then
    echo "Disconnected from $SSID successfully."
else
    echo "Failed to disconnect from $SSID or it may not be connected."
fi
