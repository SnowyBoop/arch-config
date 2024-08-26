#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi

echo "-----------------------"
echo "starting..."
sleep 1s

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

DWMDIR="$SCRIPT_DIR"
STDIR="$SCRIPT_DIR"
DWMDIR+="/dwm/"
STDIR+="/st/"

echo "$DWMDIR + -DWM directory"
echo "$STDIR + -ST directory"

echo "-----------------------"
echo "installing dependencies..."
sleep 1s

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot firefox hdparm emacs
sudo pacman -S base-devel libx11 libxft libxinerama 
sudo timedatectl set-timezone Europe/Berlin

echo "-----------------------"
echo "compiling DWM in $DWMDIR..."
sleep 1s

cd "$DWMDIR"
sudo make clean install

echo "-----------------------"
echo "compiling ST in $STDIR..."
sleep 1s

cd "$STDIR"
sudo make clean install

echo "-----------------------"
echo "done :D -> run startx to start x server"

