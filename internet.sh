#!/bin/bash

# Get the current Wi-Fi status
WIFI_STATUS=$(networksetup -getairportpower en0 | awk '{print $4}')

if [ "$WIFI_STATUS" = "On" ]; then
    # Turn Wi-Fi off
    networksetup -setairportpower en0 off
    echo "Wi-Fi turned off."
else
    # Turn Wi-Fi on
    networksetup -setairportpower en0 on
    echo "Wi-Fi turned on."
fi
