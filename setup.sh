#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

DWMDIR="$SCRIPT_DIR + /dwm/"
STDIR= "$SCRIPT_DIR + /st/"
echo "$DWMDIR + -DWM directory"
echo "$STDIR + -ST directory"



echo "===================== THIS SCRIPT WILL LOG YOU OUT WHEN COMPLETE! ====================="
sleep 2s
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot firefox hdparm emacs
sudo timedatectl set-timezone Europe/Berlin



# Change to the directory
cd "$DIR"

# Check if the script is running with sudo privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi

# Run the command
echo "Running sudo make clean install in $DIR..."
sudo make clean install
