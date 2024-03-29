mkdir -p /home/fede/.local/bin
chmod +x /home/fede/.local/bin
mkdir -p /home/fede/.config
chmod +x /home/fede/.config

# Paso 3: Copiar .dotfiles/.config/nvim a ~/.config/
cp -r /home/fede/.dotfiles/.config/nvim /home/fede/.config/

# Paso 4: Copiar .dotfiles/.config/.snippets a ~/.config/
cp -r /home/fede/.dotfiles/.config/.snippets /home/fede/.config/

# Paso 5: Copiar .dotfiles/.local/bin/nvim a ~/.local/bin/
cp -r /home/fede/.dotfiles/.local/bin/nvim.appimage /home/fede/.local/bin/

# Paso 6: Borrar ~/.bashrc y copiar .config/.bashrc a ~/
rm -f /home/fede/.bashrc
cp /home/fede/.dotfiles/.bashrc /home/fede/

