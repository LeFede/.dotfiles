#!/bin/bash


# Verifica si el usuario tiene privilegios de superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Dale capo pone sudo 😁"
  exit
fi

# Actualiza la lista de paquetes
apt update
apt upgrade


# Paso 1: Verificar y crear la carpeta .local/share/bin si no existe
if [ ! -d "$HOME/.local" ]; then
    mkdir -p "$HOME/.local"
fi
if [ ! -d "$HOME/.local/share" ]; then
    mkdir -p "$HOME/.local/share"
fi
if [ ! -d "$HOME/.local/share/bin" ]; then
    mkdir -p "$HOME/.local/share/bin"
fi

# Paso 2: Verificar y crear la carpeta .config si no existe
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Paso 3: Copiar .dotfiles/.config/nvim a ~/.config/
cp -r .dotfiles/.config/nvim "$HOME/.config/"

# Paso 4: Copiar .dotfiles/.config/.snippets a ~/.config/
cp -r .dotfiles/.config/.snippets "$HOME/.config/"

# Paso 5: Copiar .dotfiles/.local/share/bin/nvim a ~/.local/share/bin/
cp -r .dotfiles/.local/share/bin/nvim "$HOME/.local/share/bin/"

# Paso 6: Borrar ~/.bashrc y copiar .config/.bashrc a ~/
rm -f "$HOME/.bashrc"
cp ~/.dotfiles/.bashrc "$HOME/"

# Fondos
# sudo apt-get install -y nitrogen
# ??
# sudo apt-get install -y maim xclip 

# DEV
sudo apt-get install -y ripgrep clangd zip unzip python3-pip build-essential wget fuse curl

curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

# github
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# wget "https://discord.com/api/download?platform=linux&format=deb" - O discord.deb
# sudo apt install -y ./discord.deb

# audio
# sudo apt-get install -y expat libxml2-dev pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev 

source .bashrc
o

echo "Buenisimo loco 👍️"
