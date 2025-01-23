# ~/.bashrc: executed by bash(1) for non-login shells.
# 
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias vim="~/.local/bin/nvim.appimage"
alias cc="rm -rf /home/fede/.local/state/nvim/ && killall -u fede"

# System
alias rb='systemctl reboot'
alias sd='systemctl poweroff'
alias sp='systemctl suspend'
alias bs='vim ~/.bashrc'
alias lo='pkill -Kill -u fede'
#xset dpms 0 0 60 # monitor
#xset s 60 #lock

o() {
  if [ "$#" -eq 0 ]; then
    # 
    :
  else 
    cd $1
  fi

  rm -rf $HOME/.local/state/nvim/swap/*
	~/.local/bin/nvim.appimage .
}

alias bashrc="vim ~/.bashrc"
alias src="source ~/.bashrc"

# Rofi ~
alias r="rofi -show run && exit"

# Blueman ~ 
alias bt="blueman-manager"
#gsettings set org.blueman.plugins.powermanager auto-power-on false

# Wifi 
alias wifi="nmtui"

# R-info
alias rinfo="java -jar $HOME/facu/rinfo/Rinfo-2.8-linux.jar"

# Rust
. "$HOME/.cargo/env"
alias cr="clear && cargo run --quiet"
alias ct="clear && cargo test --quiet"
alias ctv="clear && cargo test --verbose"
alias cf="cargo fmt"

# Other
alias fonts="vim ~/.config/fontconfig/fonts.conf"
alias emoji="vim ~/.config/emoji"
# alias pic="silicon --from-clipboard -l $1 -c -f 'JetBrainsMono Nerd Font Mono=30'"
pic() {
  silicon --from-clipboard -l $1 -c -f 'JetBrainsMono Nerd Font Mono=30'
}

# Feature 	Shortcut
# Full Screen 	PrtScrn
# Selection 	Shift + PrtScrn
# Active Window 	Super + PrtScrn
# Clipboard Full Screen 	Ctrl + PrtScrn
# Clipboard Selection 	Ctrl + Shift + PrtScrn
# Clipboard Active Window 	Ctrl + Super + PrtScrn
#

preparedot() {
  mv ~/.config/nvim/.gitignore ~/.config/nvim/.gitignore2
  mv ~/.config/nvim/.git ~/.config/nvim/.git2
  mv ~/.config/nvim/.github ~/.config/nvim/.github2
  mv ~/.config/alacritty/catppuccin/.git ~/.config/alacritty/catppuccin/.git2

  # do
  git add .
  

  mv ~/.config/nvim/.gitignore2 ~/.config/nvim/.gitignore
  mv ~/.config/nvim/.git2 ~/.config/nvim/.git
  mv ~/.config/nvim/.github2 ~/.config/nvim/.github
  mv ~/.config/alacritty/catppuccin/.git2 ~/.config/alacritty/catppuccin/.git
}

movedot() {
  mv ~/.config/nvim/.gitignore ~/.config/nvim/.gitignore2
  mv ~/.config/nvim/.git ~/.config/nvim/.git2
  mv ~/.config/nvim/.github ~/.config/nvim/.github2
  mv ~/.config/alacritty/catppuccin/.git ~/.config/alacritty/catppuccin/.git2
}

restoredot() {
  mv ~/.config/nvim/.gitignore2 ~/.config/nvim/.gitignore
  mv ~/.config/nvim/.git2 ~/.config/nvim/.git
  mv ~/.config/nvim/.github2 ~/.config/nvim/.github
  mv ~/.config/alacritty/catppuccin/.git2 ~/.config/alacritty/catppuccin/.git
}

# Monitor 
# xrandr --output HDMI-2 --auto --right-of eDP-1

# Audio
# alsamixer

# ZIG para windows
# zig build-exe src/main.zig -target x86_64-windows-gnu
export PATH=$PATH:~/.zig
alias z="zig build-exe src/main.zig && rm main.o && ./main"

alias mr="make run"
alias mt="make test"

alias snippets="cd ~/.local/share/nvim/lazy/friendly-snippets/snippets/"



clip2 () {
  if [ "$#" -eq 0 ]; then
    # 
    :
  else 
    echo $1 | xclip -selection clipboard
  fi
}

clip () {
  if [ "$#" -eq 0 ]; then
    # 
    :
  else 
    cat $1 | xclip -selection clipboard
  fi
}


export JAVA_HOME="/media/fede/LeDisco/Android/android-studio/jbr"
export ANDROID_HOME="/media/fede/LeDisco/Android/Sdk"
export NDK_HOME="$ANDROID_HOME/ndk/25.0.8775105"

# pc name && model
# sudo dmidecode -t System | grep Product


pas () {

  if [ "$#" -eq 0 ]; then
    # 
    :
  else 
    fpc $1.pas && clear &&./$1 && rm -rf $1.o $1
  fi
}

export PATH="$PATH:$HOME/.local/bin"


alias gitlines="git ls-files src | xargs wc -l | awk 'END {print $1}'"

alias gp="git push"
alias ga="git add ."
alias gc="git commit -m"
alias gcl="git clone"
alias gch="git checkout -b"
alias pd="pnpm dev"
alias pb="pnpm build"

# Ejecutar comando de vim sin log ni confirmacion
vim -es -c "source replace_vars.vim" -c "qa"
# Ej:
# args src/**/*.css public/**/*.css
# argdo %s/before/after/g | update
vim_replace() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: vim_replace <search> <replace>"
        return 1
    fi

    local search=$1
    local replace=$2

    vim -es -c "args src/**/*.* public/**/*.*" \
        -c "argdo %s/${search}/${replace}/g | update" \
        -c "qa"
}

# monitor 
# xrandr
# xrandr --output HDMI-0 --primary
# xrandr --output HDMI-0 --primary --output DVI-D-0 --right-of HDMI-0

# pnpm
export PNPM_HOME="/home/fede/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# docker
# docker run mongo -> descarga imagen, crea contenedor y ejecuta
# docker pull mongo -> descarga imagen
# -d -> detach 
# -e {var} -> entorno 
# docker logs monguito --follow
# --network mired 
# docker image rm mongo -> elimina imagen
# -p27017:27017 -> conecta el puerto A local a B del cont.
# --name monguito -> nombre del container
# docker rm monguito -> eliminar por nombre
# docker ps -a -> lista todos los containers
# docker network ls
# docker compose down
# docker network create {name}
# docker build -t {name}:{tag} {path}
# docker compose -f docker-compose-dev.yml up
# Dockerfile
# alias ddev="sudo docker compose -f compose-dev.yml up"
alias dev="sudo CONTAINER_FILE=Containerfile.dev docker compose -f compose.yml up"
alias dup="sudo CONTAINER_FILE=Containerfile docker compose -f compose.yml up"
alias rebuild="sudo CONTAINER_FILE=Containerfile docker compose -f compose.yml build"

alias dprod="sudo docker compose up"
alias dps="sudo docker ps"
alias drm="sudo docker container rm"
alias dim="sudo docker image rm"
alias dimages="sudo docker images"
alias ddown="sudo docker compose down"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
