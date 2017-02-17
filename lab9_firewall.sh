#!/bin/bash

echo "Hello!"

# create LAB9CHAIN
iptables -N LAB9CHAIN
# append rules under LAB9CHAIN
iptables -A LAB9CHAIN -m state --state NEW,ESTABLISHED -p tcp --dport 22 -i eth0 -j ACCEPT
iptables -A LAB9CHAIN -m state --state NEW,ESTABLISHED -p tcp --dport 4505 -i eth0 -j ACCEPT
iptables -A LAB9CHAIN -m state --state NEW,ESTABLISHED -p tcp --dport 4506 -i eth0 -j ACCEPT
iptables -A LAB9CHAIN -m state --state RELATED -p udp --dport 53 -i eth0 -j ACCEPT
iptables -A LAB9CHAIN -m state --state NEW,ESTABLISHED -p tcp --dport 80 -i eth0 -j ACCEPT
iptables -A LAB9CHAIN -m state --state NEW,ESTABLISHED -p tcp --dport 137:139 -i eth0 -j ACCEPT
iptables -A LAB9CHAIN -m state --state NEW,ESTABLISHED -p tcp --dport 445 -i eth0 -j ACCEPT

setsebool polyinstantiation_enabled on



