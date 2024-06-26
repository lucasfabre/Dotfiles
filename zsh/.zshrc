# bash path compatibility
export PATH=$HOME/bin:/usr/local/bin:$PATH
# cargo install path
export PATH=$HOME/.cargo/bin:$PATH
# custom path compatibility
export PATH=$HOME/.local/bin:/opt/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lucas/.oh-my-zsh"

# Define zsh theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if command -v 'oh-my-posh' &> /dev/null; then
    OH_MY_POSH_THEME="https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/bubbles.omp.json"
    OH_MY_POSH_THEME_FILENAME=$(basename $OH_MY_POSH_THEME)
    # Check if the theme is installed
    if [ ! -f "$HOME/.config/oh-my-posh/themes/$OH_MY_POSH_THEME_FILENAME" ]; then
        echo "Installing oh-my-posh theme..."
        mkdir -p $HOME/.config/oh-my-posh/themes
        wget $OH_MY_POSH_THEME -O $HOME/.config/oh-my-posh/themes/$OH_MY_POSH_THEME_FILENAME
        echo "Done!"
    fi
    eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/$OH_MY_POSH_THEME_FILENAME)"
else
    ZSH_THEME="fletcherm"
fi

if command -v 'zoxide' &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
if command -v 'thefuck' &> /dev/null; then
    eval $(thefuck --alias)
fi

if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

# Load nix profile env if available
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
    source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker sudo thefuck fzf zoxide vscode)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=nvim

# Add simple command utils
# - fkill: kill all process matching a given name
funcion fkill() {
    ps -A | grep $1 | tr -s ' ' | cut -d ' ' -f 2 | xargs kill -9
}

# Add better aliasses if the comando exists
# - bat: better cat
if command -v 'bat' &> /dev/null; then
    alias cat='bat'
fi
# - exa: A modern, replacement for ls
if command -v 'exa' &> /dev/null; then
    alias ls='exa --icons --group-directories-first --git --color=always'
fi
# - eza: A fork of exa, because exa is unmaintained
if command -v 'eza' &> /dev/null; then
    alias ls='eza --icons --group-directories-first --git --color=always'
fi
# - dust: A better du
if command -v 'dust' &> /dev/null; then
    alias du='dust'
fi

# Simple aliases that I like
alias open="xdg-open"
