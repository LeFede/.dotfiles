#!/bin/bash

# Verifica si el usuario tiene privilegios de superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Dale capo pone sudo 😁"
  exit 1
fi

# Actualiza la lista de paquetes e instala paquetes esenciales
apt update
apt upgrade -y
apt install -y ripgrep clangd zip unzip python3-pip build-essential wget fuse curl xclip python3.11-venv \
               cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
               i3status i3lock dex nitrogen pavucontrol pulseaudio-utils network-manager-gnome brightnessctl \
               xdotool maim xclip python3 python3-pip pipx gh xclip xsel

# Instala Node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt install -y nodejs

# Configura el repositorio de GitHub CLI y lo instala
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update
apt install -y gh

# Instala Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Clona y construye Alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/alacritty.desktop /usr/share/applications

# Configura Git
git config --global user.email "lefedeok@gmail.com"
git config --global user.name "Federico Andres"

# Configura pipx y bumblebee-status
pipx install bumblebee-status

# Actualiza .bashrc
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc

echo "Buenisimo loco 👍️"
