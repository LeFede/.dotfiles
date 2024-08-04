#!/bin/bash
# chmod +x deploy.sh

# Directorio actual (asumiendo que estás dentro de ~/.dotfiles)
source_dir="$HOME/.dotfiles"

# Directorios de destino
declare -A destinations=(
    [".config"]="$HOME/.config"
    [".fonts"]="$HOME/.fonts"
    [".bashrc"]="$HOME/.bashrc"
    # Añadir más archivos y directorios según sea necesario
)

# Copiar directorios
for dir in "${!destinations[@]}"; do
    if [ -d "$source_dir/$dir" ]; then
        mkdir -p "${destinations[$dir]}"
        cp -r "$source_dir/$dir/"* "${destinations[$dir]}/"
        echo "Copiados contenidos de $source_dir/$dir a ${destinations[$dir]}"
    fi
done

# Copiar archivos individuales
for file in "${!destinations[@]}"; do
    if [ -f "$source_dir/$file" ]; then
        cp "$source_dir/$file" "${destinations[$file]}"
        echo "Copiado $source_dir/$file a ${destinations[$file]}"
    fi
done

echo "Proceso completado 👍️"

