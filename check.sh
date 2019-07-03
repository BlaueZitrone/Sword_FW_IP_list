#! /bin/bash

ip=$(echo $1 | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}");
if [[ $ip == $1 ]]; then
    network=$(echo $1 | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}");
    echo "##########";
    echo "IP checking:";
    echo "...TEST...";
    sed "s/,/\n/g" $HOME/Sword_FW_IP_list/xib_firewall/firewall_test.txt | grep -w --color=auto "${ip}";
    echo "...PROD...";
    sed "s/,/\n/g" $HOME/Sword_FW_IP_list/xib_firewall/firewall_prod.txt | grep -w --color=auto "${ip}";
    echo "##########";
    echo "network checking:";
    echo "...TEST...";
    sed "s/,/\n/g" $HOME/Sword_FW_IP_list/xib_firewall/firewall_test.txt | grep -w --color=auto "${network}";
    echo "...PROD...";
    sed "s/,/\n/g" $HOME/Sword_FW_IP_list/xib_firewall/firewall_prod.txt | grep -w --color=auto "${network}";
    echo "##########";
else
    echo "Please enter proper IP address."
fi
