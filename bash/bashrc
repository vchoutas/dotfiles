# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000

# User specific aliases and functions

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


if [ -f ~/.git-completion.bash  ]; then
  . ~/.git-completion.bash
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d/pip ]; then
  . /etc/bash_completion.d/pip
fi

if [ -f ~/.git-prompt.sh ]; then
  source /home/vchoutas/.git-prompt.sh
fi

export TERM=xterm-256color

# if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    # source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
# fi


#Show git branch and add color to terminal
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"

function proml {
  local        BLUE="\[\033[0;34m\]"
  local        LIGHT_BLUE="\[\033[1;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local      YELLOW="\[\033[0;33m\]"
  local LIGHT_YELLOW="\[\033[1;33m\]"
  local        CYAN="\[\033[0;36m\]"
  local  LIGHT_CYAN="\[\033[1;36m\]"
  local      MAGENTA="\[\033[0;35m\]"
  local  LIGHT_MAGENTA="\[\033[1;35m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[1;37m\]"
# END OPTIONAL
  local     DEFAULT="\[\033[0m\]"

  PS1="$LIGHT_YELLOW\u$LIGHT_GREEN@$LIGHT_RED\h$LIGHT_YELLOW:$LIGHT_GRAY[\w] $LIGHT_RED\$(__git_ps1 \"(%s)\")$DEFAULT$LIGHT_YELLOW\$\n$LIGHT_GRAY>>> $DEFAULT"
}
# proml


export CXX=clang++-3.6
export CC=clang-3.6

export PATH=/usr/bin:$PATH

export PATH=/usr/local/cuda-7.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:/usr/lib/nvidia-346:$LD_LIBRARY_PATH

setxkbmap -model pc105 -layout us,gr -option grp:alt_shift_toggle
if [ -f /opt/ros/indigo/setup.bash ]; then
  source /opt/ros/indigo/setup.bash
fi

if [ -f /opt/ros/jade/setup.bash ]; then
  source /opt/ros/jade/setup.bash
fi

if [ -f ~/Programming/pandora_ws/devel/setup.bash ]; then
  source ~/Programming/pandora_ws/devel/setup.bash
fi

RBW_PATH=$HOME/.rainbow-bash
source $RBW_PATH/init.sh

PS1=$RBW_THEME_ADVANCED

export PIP_VIRTUALENV_BASE=/home/vchoutas/.virtualenvs
