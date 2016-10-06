# Ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=1

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# User configuration

export PATH="/opt/ros/indigo/bin:/usr/local/cuda-7.5/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games":$PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

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
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

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

    zgen load rimraf/k

    zgen load djui/alias-tips

    # Plugin for auto updating zgen
    zgen load unixorn/autoupdate-zgen
    # Add plugins not included in oh-my-zsh
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # Alpharized Theme
    # zgen load NicoSantangelo/Alpharized alpharized.zsh-theme
    # Load Lambda Mod prompt
    zgen load halfo/lambda-mod-zsh-theme lambda-mod.zsh-theme
    # zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

# Change color of commands
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'

# Bind keys for History Search plugin
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green,bold,bg=black'

export TERM="xterm-256color"

local LAMBDA="%(?,%{$fg_bold[green]%}λ,%{$fg_bold[red]%}λ)"

if [ -f /opt/ros/indigo/setup.zsh ]; then
  source /opt/ros/indigo/setup.zsh
fi

if [ -f ~/Programming/pandora_ws/devel/setup.zsh ]; then
  source ~/Programming/pandora_ws/devel/setup.zsh
fi

# Use Clang as the default C and C++ compiler
export CXX=clang++-3.6
export CC=clang-3.6


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/lib/nvidia-352:/usr/local/lib:/usr/lib/:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=$HOME/cuda/lib64:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=$HOME/opencv3/lib:$LD_LIBRARY_PATH
export PATH=/home/vchoutas/anaconda3/bin:$PATH

[ -z "$TMUX" ] && export TERM=xterm-256color && exec tmux

BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

. /home/vchoutas/torch/install/bin/torch-activate
