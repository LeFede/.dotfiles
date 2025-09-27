# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom function to truncate long directory names
truncate_pwd() {
  local pwd_parts=(${(s:/:)PWD})
  local result=""
  local max_len=8  # Maximum characters before truncating
  
  # Get last 2 directories
  local start=$((${#pwd_parts[@]} - 1))
  [[ $start -lt 1 ]] && start=1
  
  # Add .. if there are more than 2 directories
  if [[ ${#pwd_parts[@]} -gt 3 ]]; then
    result="../"
  fi
  
  # Process last 2 directories
  for ((i=$start; i<=${#pwd_parts[@]}; i++)); do
    local part=${pwd_parts[$i]}
    if [[ ${#part} -gt $max_len ]]; then
      part="${part:0:$((max_len-2))}.."
    fi
    [[ -n $part ]] && result="$result$part/"
  done
  
  # Remove trailing slash
  echo ${result%/}
}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases from bashrc
alias vim="~/.local/bin/nvim.appimage"
alias cc="rm -rf /home/fede/.local/state/nvim/ && killall -u fede"
alias rb='systemctl reboot'
alias sd='systemctl poweroff'
alias sp='systemctl suspend'
alias bs='vim ~/.bashrc'
alias lo='pkill -Kill -u fede'
alias bashrc="vim ~/.bashrc"
alias zshrc="vim ~/.zshrc"
alias src="source ~/.zshrc"
alias r="rofi -show run && exit"
alias bt="blueman-manager"
alias wifi="nmtui"
alias rinfo="java -jar $HOME/facu/rinfo/Rinfo-2.8-linux.jar"
alias cr="clear && cargo run --quiet"
alias ct="clear && cargo test --quiet"
alias ctv="clear && cargo test --verbose"
alias cf="cargo fmt"
alias fonts="vim ~/.config/fontconfig/fonts.conf"
alias emoji="vim ~/.config/emoji"
alias z="zig build-exe src/main.zig && rm main.o && ./main"
alias mr="make run"
alias mt="make test"
alias snippets="cd ~/.local/share/nvim/lazy/friendly-snippets/snippets/"
alias gitlines="git ls-files src | xargs wc -l | awk 'END {print $1}'"
alias gp="git push"
alias ga="git add ."
alias gc="git commit -m"
alias gcl="git clone"
alias gch="git checkout -b"
alias pd="pnpm dev"
alias pb="pnpm build"
alias dev="sudo CONTAINER_FILE=Containerfile.dev docker compose -f compose.yml up"
alias dup="sudo CONTAINER_FILE=Containerfile docker compose -f compose.yml up"
alias rebuild="sudo CONTAINER_FILE=Containerfile docker compose -f compose.yml build"
alias dprod="sudo docker compose up"
alias dps="sudo docker ps"
alias drm="sudo docker container rm"
alias dim="sudo docker image rm"
alias dimages="sudo docker images"
alias ddown="sudo docker compose down"
alias ron="redshift -O 3500K"
alias roff="redshift -x"
alias doff="docker system prune"
alias laptopoff="xrandr --output eDP --off"
alias laptopon="xrandr --auto"
alias laptopext="xrandr --output eDP --auto --output HDMI-A-0 --auto --right-of eDP"
alias cpwd='pwd | xclip -selection clipboard'
alias t="tmux a"

# Functions from bashrc
o() {
  if [ "$#" -eq 0 ]; then
    :
  else 
    cd $1
  fi
  # Clear nvim swap files - use find to avoid zsh glob issues
  find $HOME/.local/state/nvim/swap -type f -delete 2>/dev/null || true
  ~/.local/bin/nvim.appimage .
}

pic() {
  silicon --from-clipboard -l $1 -c -f 'JetBrainsMono Nerd Font Mono=30'
}

# Audio switching functions
auris() {
    local hyperx_id=$(wpctl status | grep "HyperX Cloud III Wireless Analog Stereo" | awk '{print $2}' | tr -d '.')
    if [ -n "$hyperx_id" ]; then
        wpctl set-default $hyperx_id
        echo "Audio switched to HyperX Cloud III Wireless (ID: $hyperx_id)"
    else
        echo "HyperX Cloud III Wireless not found"
    fi
}

focusrite() {
    local focusrite_id=$(wpctl status | grep "Focusrite Scarlett 2i2 Analog Stereo" | awk '{print $2}' | tr -d '.')
    if [ -n "$focusrite_id" ]; then
        wpctl set-default $focusrite_id
        echo "Audio switched to Focusrite Scarlett 2i2 (ID: $focusrite_id)"
    else
        echo "Focusrite Scarlett 2i2 not found"
    fi
}

# Environment variables
export EDITOR="$HOME/.local/bin/nvim.appimage"
export VISUAL="$HOME/.local/bin/nvim.appimage"
export PATH=$PATH:~/.zig
export PATH=$PATH:$HOME/.cargo/bin
export JAVA_HOME="/media/fede/LeDisco/Android/android-studio/jbr"
export ANDROID_HOME="/media/fede/LeDisco/Android/Sdk"
export NDK_HOME="$ANDROID_HOME/ndk/25.0.8775105"
export PATH="$PATH:$HOME/.local/bin"
export PNPM_HOME="/home/fede/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export FLYCTL_INSTALL="/home/fede/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
