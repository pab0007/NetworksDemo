#!/bin/bash

# Installer OpenVPN
sudo apt update && sudo apt install openvpn -y

# Télécharger EasyRSA pour gérer les certificats
git clone https://github.com/OpenVPN/easy-rsa.git /etc/openvpn/easy-rsa
cd /etc/openvpn/easy-rsa
./easyrsa init-pki
./easyrsa build-ca nopass

# Génération des certificats serveur
./easyrsa gen-req server nopass
./easyrsa sign-req server server

# Copier les certificats dans les bons répertoires
cp pki/private/server.key /etc/openvpn/
cp pki/issued/server.crt /etc/openvpn/
cp pki/ca.crt /etc/openvpn/
echo "VPN configuré !"
