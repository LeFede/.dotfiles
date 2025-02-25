#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Sudo missing"
	exit
fi

USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
CONFIG_FOLDER=".config/"
FONTS_FOLDER=".fonts/"
BIN_FOLDER=".local/bin/"
BASHRC=".bashrc"

# mkdir -p "$USER_HOME/.local/bin/tal"
rsync -av $CONFIG_FOLDER "$USER_HOME"
rsync -av $FONTS_FOLDER "$USER_HOME"
rsync -av $BIN_FOLDER "$USER_HOME"
cp $BASHRC "$USER_HOME"
cp -r ".git." "$USER_HOME"
cp -r ".gitignore" "$USER_HOME"

# chown -R "$SUDO_USER:$SUDO_USER" "$USER_HOME"
# chown -R "$SUDO_USER:$SUDO_USER" ./tal

# Actualiza la lista de paquetes e instala paquetes esenciales
apt update
apt upgrade -y
apt install -y ripgrep clangd zip unzip python3-pip build-essential wget fuse curl xclip python3.11-venv \
               cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
               i3status i3lock dex nitrogen pavucontrol pulseaudio-utils network-manager-gnome brightnessctl \
               xdotool maim xclip python3 python3-pip pipx gh xclip xsel neofetch

# Instala Node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt install -y nodejs

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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

vim -c MasonInstallAll
vim -c TSInstall all

amixer set Master 100%

# Create a directory to store APT repository keys if it doesn't exist:
sudo install -y -d -m 0755 /etc/apt/keyrings

# Import the Mozilla APT repository signing key:
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

# The fingerprint should be 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print "\n"$0"\n"}'

# Next, add the Mozilla APT repository to your sources list:
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# Update your package list and install the Firefox Nightly .deb package:
sudo apt-get update && sudo apt-get install -y firefox-nightly

sudo npm i -g pnpm
npm install -g @astrojs/language-server

# Actualiza .bashrc
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc

# Silicon (screenshots)
sudo apt install expat
sudo apt install libxml2-dev
sudo apt install pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev libfontconfig1-dev g++
cargo install silicon

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# NO SE PORQUE HAY QUE HACERLO APARTE
# BUMBLEBEE
pipx install bumblebee-status
# Bun
curl -fsSL https://bun.sh/install | bash

# Steam libs
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgl1:i386 libdrm2:i386
sudo apt install libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 steam-libs-amd64:amd64 steam-libs-i386:i386 xdg-desktop-portal xdg-desktop-portal-gtk

sudo apt install libfuse2

sudo apt install alacritty

echo "Buenisimo loco 👍️"
