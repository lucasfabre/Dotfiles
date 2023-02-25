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
    eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/bubbles.omp.json)"
else
    ZSH_THEME="fletcherm"
fi

if command -v 'zoxide' &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker sudo)

source $ZSH/oh-my-zsh.sh

# User configuration
# REMARK: many of the user configuration is loaded from the custom directory
export EDITOR=nvim

