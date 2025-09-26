#! /bin/sh

sudo pkill wpa_supplicant
sudo rm -rf /run/wpa_supplicant
sudo sv down dhcpcd

sleep 2

sudo ip link set wlp3s0 down
sudo ip link set wlp3so up

sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf

if sudo iw wlps30 link | grep -q "Conneced to"; then
    echo "Connected"
    sudo dhcpcd wlp3s0
else
    echo "Didn't connect"
fi
