# Tmux init
# export TERM=screen-256color
# [ -z "$TMUX" ] && exec tmux
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload colors && colors

# Customize to your needs...

#############################################################
# Use Z-Plug to manage plugins
export ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
if [[ ! -d "${ZPLUG_HOME}" ]]; then
  git clone https://github.com/zplug/zplug "${ZPLUG_HOME}"
  source "${ZPLUG_HOME}/init.zsh" && zplug update --self
fi

source "${ZPLUG_HOME}/init.zsh"

# The ZSH Plugin Manager
# Source: https://github.com/zplug/zplug
zplug "zplug/zplug", hook-build:'zplug --self-manage'
# Better Directory Listing
# Source: https://github.com/supercrabtree/k
zplug "supercrabtree/k"
# Better cd
# Source: https://github.com/peterhurford/up.zsh
zplug "peterhurford/up.zsh"
# Fish-like history search
zplug "zsh-users/zsh-history-substring-search", defer:3
# Suggests command based on command history
zplug "zsh-users/zsh-autosuggestions", defer:3
# Syntax highlighting for commands
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# Pip and Virtualenv utilities
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "djui/alias-tips"
# Prompt themes
# zplug "vasilish/lagune", as:theme
# zplug "themes/agnoster", as:theme, from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH

zplug load

# Bind keys for History Search plugin
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#############################################################


# Add aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# ROS path setup
if [ -f /opt/ros/indigo/setup.zsh ]; then
  source /opt/ros/indigo/setup.zsh
fi

# Add extra folders to the PATH variable.
export PATH="/opt/ros/indigo/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games":$PATH
export PATH=$HOME/.local/bin:$PATH
# Cuda Libraries
export CUDA_HOME="/opt/cuda"
export PATH="$CUDA_HOME/bin":$PATH
export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib/":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="$CUDA_HOME/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="$CUDA_HOME/extras/CUPTI/lib64":$LD_LIBRARY_PATH
# CuDNN Files
export CUDNN_HOME="/opt/cudnn"
export LD_LIBRARY_PATH="$CUDNN_HOME/lib64":$LD_LIBRARY_PATH
# NNPACK
export LD_LIBRARY_PATH=$HOME/NNPACK/lib/:$LD_LIBRARY_PATH

export INTEL_HOME="/opt/intel"
export MKL_HOME="$INTEL_HOME/mkl"
export LD_LIBRARY_PATH="$MKL_HOME/lib/intel64":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="$INTEL_HOME/lib/intel64":$LD_LIBRARY_PATH
# CMAKE Path for Intel MKL
export CMAKE_INCLUDE_PATH=$CMAKE_INCLUDE_PATH:"$MKL_HOME/include"
export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:"$MKL_HOME/lib/intel64"


if [[ -a $HOME/torch/install/bin/torch-activate ]]; then
  . $HOME/torch/install/bin/torch-activate
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white,bold,bg=black'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold'
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

bindkey '^k' autosuggest-accept
bindkey "^f" beginning-of-line
bindkey "^g" end-of-line
bindkey "^n" forward-word
bindkey "^b" backward-word
bindkey "^e" kill-whole-line

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

export TRASH="$HOME/.local/share/Trash"
export XDG_RUNTIME_DIR="$HOME/run"
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}

# fzf options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1
# export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

if [ -f ~/.fzf_commands ]; then
    source ~/.fzf_commands
fi

export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME=$HOME/Devel
source "$HOME/.local/bin/virtualenvwrapper.sh"

export VIRTUAL_ENV_DISABLE_PROMPT=

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vchoutas/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vchoutas/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vchoutas/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vchoutas/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
