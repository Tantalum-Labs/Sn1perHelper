#!/bin/bash

set -e

echo "[*] Installing Sn1per in /root/Sn1per..."

if [[ $EUID -ne 0 ]]; then
   echo "[!] This script must be run as root."
   exit 1
fi

echo "[*] Installing required packages..."
apt update
apt install -y git curl nmap php php-curl unzip python3-pip

cd /root
if [ -d "Sn1per" ]; then
    echo "[*] Sn1per already exists. Pulling latest changes..."
    cd Sn1per
    git pull
else
    echo "[*] Cloning Sn1per repository..."
    git clone https://github.com/1N3/Sn1per.git
    cd Sn1per
fi

echo "[*] Running install.sh..."
chmod +x install.sh
./install.sh

echo "[*] Updating Sn1per..."
./sn1per -u

echo "[+] Sn1per installation and update complete."
