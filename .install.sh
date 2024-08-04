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
# sudo apt-get install -y maim 

# DEV
sudo apt-get install -y ripgrep clangd zip unzip python3-pip build-essential wget fuse curl xclip python3.11-venv

curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

# github
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

# wget "https://discord.com/api/download?platform=linux&format=deb" - O discord.deb
# sudo apt install -y ./discord.deb

# audio
# sudo apt-get install -y expat libxml2-dev pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev 


sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source $HOME/.cargo/env


. "$HOME/.cargo/env"

git clone https://github.com/alacritty/alacritty.git
cd alacritty

cargo build --release

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/alacritty.desktop /usr/share/applications


sudo apt update
sudo apt install i3status i3lock dex nitrogen pavucontrol pulseaudio-utils \
                 network-manager-gnome brightnessctl xdotool maim xclip python3 python3-pip pipx

echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc

pipx install bumblebee-status


git config --global user.email "lefedeok@gmail.com"
git config --global user.name "Federico Andres"

sleep 1
source /home/fede/.bashrc
sleep 1
o

echo "Buenisimo loco 👍️"
