#!/bin/bash

VPN_NAME="sslvpn-aayush.shah-client-config"

# Check if VPN is currently active
IS_ACTIVE=$(nmcli con show --active | grep -i "$VPN_NAME")

if [ -n "$IS_ACTIVE" ]; then
  # VPN is active → disconnect
  nmcli con down id "$VPN_NAME"
  if [ $? -eq 0 ]; then
    notify-send "VPN Toggled" "Disconnected from VPN: $VPN_NAME"
    echo "Disconnected from VPN: $VPN_NAME"
  else
    notify-send "VPN Error" "Failed to disconnect from VPN: $VPN_NAME"
    echo "Failed to disconnect from VPN: $VPN_NAME"
    exit 1
  fi
else
  # VPN is not active → connect
  nmcli con up id "$VPN_NAME"
  if [ $? -eq 0 ]; then
    notify-send "VPN Toggled" "Connected to VPN: $VPN_NAME"
    echo "Connected to VPN: $VPN_NAME"
  else
    notify-send "VPN Error" "Failed to connect to VPN: $VPN_NAME"
    echo "Failed to connect to VPN: $VPN_NAME"
    exit 1
  fi
fi