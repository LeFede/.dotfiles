#!/bin/bash

# Verifica si el usuario tiene privilegios de superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Dale capo pone sudo 😁"
  exit
fi

# Actualiza la lista de paquetes
apt update
apt upgrade

# Fondos
# sudo apt-get install -y nitrogen
# ??
# sudo apt-get install -y maim xclip 

# DEV
# sudo apt-get install -y ripgrep clangd git zip unzip python3-pip build-essential wget fuse curl

# wget "https://discord.com/api/download?platform=linux&format=deb" - O discord.deb
# sudo apt install -y ./discord.deb

# curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
# sudo apt install -y nodejs

# audio
# sudo apt-get install -y expat libxml2-dev pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev 


echo "Buenisimo loco 👍️"
