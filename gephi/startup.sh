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

echo ">>> Running gephi..."
./bin/gephi --nosplash  >/var/log/gephi.log 2>&1 &

sleep 25

echo ">>> Starting x11vnc..."
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 -noxdamage -xkb -quiet >/dev/null 2>&1 &

sleep 5

echo ">>> Starting noVNC on port 8081..."
exec websockify --web=/usr/share/novnc/ --idle-timeout=0 0.0.0.0:8081 localhost:5900
