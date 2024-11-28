#!/bin/bash

# Installation du serveur DHCP
sudo apt update && sudo apt install isc-dhcp-server -y

# Configuration du fichier /etc/dhcp/dhcpd.conf
echo "
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.100 192.168.1.200;
    option domain-name-servers 8.8.8.8, 8.8.4.4;
    option routers 192.168.1.1;
    default-lease-time 600;
    max-lease-time 7200;
}
" | sudo tee /etc/dhcp/dhcpd.conf

# Redémarrer le service DHCP
sudo systemctl restart isc-dhcp-server
echo "Serveur DHCP configuré avec succès !"
