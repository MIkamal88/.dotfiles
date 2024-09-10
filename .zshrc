# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Themes, See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rkj-repos" # set by `omz`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/home/m_kamal/.local/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

export LS_COLORS='fi=00:mi=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias rm='rm -rf' # an alias written in the blood of a root directory
alias cp='cp -r'
alias mkdir='mkdir -pv'
alias ..='cd ..'
alias wget='wget -c'
alias ls='ls -aF --color=auto'
alias df='df -Tha --total'
alias free='free -lt'
alias vim='nvim'
alias py='python3'
alias open='thunar'
alias venvr='source .venv/bin/activate'
