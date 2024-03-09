#!/bin/bash

# Verifica si el usuario tiene privilegios de superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Dale capo pone sudo"
  exit
fi

# Actualiza la lista de paquetes
apt update

sudo apt-get install -y nitrogen
sudo apt-get install -y maim xclip 
sudo apt-get install -y expat libxml2-dev pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev 



echo "Buenisimo loco 👍️"
