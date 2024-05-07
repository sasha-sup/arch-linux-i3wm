#!/bin/bash

openvpn_config_check(){
    if ps aux | grep openvpn | grep -q .ovpn; then
        config_name=$(ps aux | grep openvpn | grep .ovpn | awk '{print $NF}' | uniq | awk -F'/' '{print $NF}')
        echo "🌐 $config_name" > /tmp/openvpn_config
    else
        echo "🌐📴" > /tmp/openvpn_config
    fi
}


while true; do
    openvpn_config_check
    sleep 60
done
