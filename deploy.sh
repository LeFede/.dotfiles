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
        for file in "$source_dir/$dir/"*; do
            if [ -f "$file" ] && [ ! -e "${destinations[$dir]}/$(basename $file)" ]; then
                cp "$file" "${destinations[$dir]}/"
                echo "Copiado $file a ${destinations[$dir]}"
            fi
        done
    fi
done

# Copiar archivos individuales
for file in "${!destinations[@]}"; do
    if [ -f "$source_dir/$file" ]; then
        if [ "$file" == ".bashrc" ] || [ ! -e "${destinations[$file]}" ]; then
            cp "$source_dir/$file" "${destinations[$file]}"
            echo "Copiado $source_dir/$file a ${destinations[$file]}"
        fi
    fi
done

# Copiar archivos adicionales
additional_files=(".install.sh" "deploy.sh")
for file in "${additional_files[@]}"; do
    if [ -f "$source_dir/$file" ]; then
        cp "$source_dir/$file" "$HOME/$file"
        echo "Copiado $source_dir/$file a $HOME/$file"
    fi
done

echo "Proceso completado 👍️"
