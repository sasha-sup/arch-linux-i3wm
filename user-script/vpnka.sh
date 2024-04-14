#!/bin/bash

is_vpn_running() {
    pgrep -x "openvpn" > /dev/null
}

if is_vpn_running; then
    sudo killall openvpn
else
    sudo openvpn /home/sasha/Documents/my-vpn/sasha.ovpn &
fi
