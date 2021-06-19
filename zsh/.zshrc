# bash path compatibility
export PATH=$HOME/bin:/usr/local/bin:$PATH
# custom path compatibility
export PATH=$HOME/.local/bin:/opt/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lucas/.oh-my-zsh"

# Define zsh theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fletcherm"

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
