#!/bin/bash

SSID="realme 12+ 5G"

# Disconnect the Wi-Fi network
nmcli con down id "$SSID"
if [ $? -ne 0 ]; then
  notify-send "WIFI ERROR" "Failed to disconnect from $SSID"
  exit 1
fi

# Ensure Wi-Fi adapter is reset
nmcli radio wifi off
sleep 2
nmcli radio wifi on
sleep 2

# Reconnect the Wi-Fi network
nmcli con up id "$SSID"
if [ $? -ne 0 ]; then
  echo "Failed to reconnect to $SSID"
  exit 1
fi

notify-send "WIFI RECONNECTED" "Successfully reconnected to $SSID"
