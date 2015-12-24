# Ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# User configuration

export PATH="/opt/ros/indigo/bin:/usr/local/cuda-7.0/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

############################# zgen Config Section ##############################

source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"
    zgen oh-my-zsh

    # Load all necessary plugins
    # Start by oh-my-zsh plugins
    zgen oh-my-zsh plugins/git

    zgen oh-my-zsh plugins/command-not-found

    zgen oh-my-zsh plugins/colored-man-pages

    zgen oh-my-zsh plugins/pip


    # Add plugins not included in oh-my-zsh
    zgen load zsh-users/zsh-syntax-highlighting

    # Alpharized Theme
    # zgen load NicoSantangelo/Alpharized alpharized.zsh-theme
    # Load Lambda Mod prompt
    zgen load halfo/lambda-mod-zsh-theme lambda-mod.zsh-theme

    # save all to init script
    zgen save
fi

# Change color of commands
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'

export TERM="xterm-256color"

if [ -f /opt/ros/indigo/setup.zsh ]; then
  source /opt/ros/indigo/setup.zsh
fi

if [ -f ~/Programming/pandora_ws/devel/setup.zsh ]; then
  source ~/Programming/pandora_ws/devel/setup.zsh
fi

# Use Clang as the default C and C++ compiler
export CXX=clang++-3.6
export CC=clang-3.6

[ -z "$TMUX" ] && export TERM=xterm-256color && exec tmux
