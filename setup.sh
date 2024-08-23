#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi

echo "-----------------------"
echo "starting..."
sleep 2s

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

DWMDIR="$SCRIPT_DIR + /dwm/"
STDIR= "$SCRIPT_DIR + /st/"

echo "$DWMDIR + -DWM directory"
echo "$STDIR + -ST directory"

echo "-----------------------"
echo "installing dependencies..."
sleep 2s

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot firefox hdparm emacs
sudo timedatectl set-timezone Europe/Berlin

echo "-----------------------"
echo "compiling DWM in $DWMDIR..."
sleep 2s

cd "$DWMDIR"
sudo make clean install

echo "-----------------------"
echo "compiling ST in $STDIR..."
sleep 2s

cd "$STDIR"
sudo make clean install


