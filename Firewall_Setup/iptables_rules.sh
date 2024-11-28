#!/bin/bash

# Réinitialiser les règles existantes
iptables -F
iptables -X

# Bloquer tout le trafic entrant par défaut
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Autoriser les connexions SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Autoriser les connexions déjà établies
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Sauvegarder les règles
iptables-save > /etc/iptables/rules.v4
echo "Pare-feu configuré avec succès !"
