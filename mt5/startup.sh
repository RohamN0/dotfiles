#!/bin/bash

# Remove X11 old files
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1

echo ">>> Starting Xvfb..."
Xvfb :1 -screen 0 1920x1080x24 -ac +extension RANDR &
export DISPLAY=:1
sleep 2

# Setting keyboard layout
setxkbmap -display :1 us

echo ">>> Starting Fluxbox window manager..."
fluxbox &

if [ ! -d "$WINEPREFIX" ]; then
    echo ">>> Initializing Wine prefix..."
    wineboot --init >/dev/null 2>&1
    winecfg -v win10 >/dev/null 2>&1
fi

echo ">>> Configuring virtual desktop..."
winetricks -q desktop=1920x1080 > /dev/null 2>&1

MT5_PATH="$WINEPREFIX/drive_c/Program Files/MetaTrader 5/terminal64.exe"
if [ ! -f "$MT5_PATH" ]; then
    echo ">>> Installing MetaTrader 5..."
    wine /opt/mt5setup.exe /auto
    echo ">>> Waiting for installation to complete..."
    sleep 30
fi

echo ">>> Starting MetaTrader 5..."
wine "$MT5_PATH" &

sleep 5

echo ">>> Starting x11vnc..."
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 -noxdamage -xkb -quiet >/dev/null 2>&1 &

sleep 5

echo ">>> Starting noVNC on port 8080..."
exec websockify --web=/usr/share/novnc/ --idle-timeout=0 0.0.0.0:8080 localhost:5900
