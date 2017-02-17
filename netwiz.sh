#!/bin/bash

# import a library to validate the IP address inputs

# Delete temp files
rm /tmp/resolv.conf
rm /tmp/ifcfg-eth1

echo "Please enter the IP address you wish to use: "
read IPADDRESS
echo "Enter the netmask (in octet): "
read NETMASK
echo "Enter the nameserver: "
read NAMESERVER
echo "Enter the default gateway: "
read DEFAULTGW
echo ""
# use library for input validation

# Show the input again for verification 
echo "You enetered..."
echo "IP address: "$IPADDRESS" "
echo "Netmask: "$NETMASK""
echo "Name server: "$NAMESERVER""
echo "Default gateway: "$DEFAULTGW""
echo "Above information  will be applied to the network configuration."

# Make a temporary file to save the settings 
#(then transfer to real conf files later)
touch /tmp/resolv.conf
touch /tmp/ifcfg-eth1
 
# Settiing to the running configuration
ifconfig eth1 "$IPADDRESS"
ifconfig eth1 netmask "$NETMASK"
cat /etc/resolv.conf | grep -v nameserver > /tmp/resolv.conf
echo "nameserver $NAMESERVER" >> /tmp/resolv.conf
route add default gw "$DEFAULTGW"

# Setting up and adding above to the persistent configuration

echo "-NM_CONTROLLED="no"" >> /tmp/ifcfg-eth1  #turning off Network Manager
echo "DEVICE=eth1" >> /tmp/ifcfg-eth1
echo "ONBOOT=yes" >> /tmp/ifcfg-eth1
echo "BOOTPROTO=dhcp" >> /tmp/ifcfg-eth1
echo "IPADDR="$IPADDRESS"" >> /tmp/ifcfg-eth1
echo "NETMASK="$NETMASK"" >> /tmp/ifcfg-eth1
echo "TYPE=Ethernet" >> /tmp/ifcfg-eth1
echo "GATEWAY="$DEFAULTGW"" >> /tmp/ifcfg-eth1

# Move the temp config file to the network configuration
#mv /tmp/resov.conf /etc/resolv.conf
#mv /tmp/ifcfg-eth1 /etc/sysconfig/network-scripts/

# Just for my own reference:
# IP address, netmask, and default gateway are in the 
# /etc/sysconfig/network-scripts/ifcfg-eth#
# nameserver is in the /etc/resolv.conf



