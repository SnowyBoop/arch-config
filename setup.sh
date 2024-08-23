#!/bin/bash

# Check if the script is running with sudo privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi

echo "===================== THIS SCRIPT WILL LOG YOU OUT WHEN COMPLETE! ====================="
sleep 2s
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot firefox hdparm emacs
sudo timedatectl set-timezone Europe/Berlin


