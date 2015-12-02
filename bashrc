# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

# Some useful aliases
alias hl="hg gl|less"
alias pw="python ~/repos/web2py/web2py.py"
alias inote="ipython2 notebook"
alias packer="PACMAN=pacmatic nice packer"
alias lw="ls | wc -l"

function pl { ps aux | grep "$1" | grep -v grep; }
export -f pl

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
source  ~/Dropbox/config/git.sh

# Add Mercurial prompt
hg_ps1(){
    hg prompt "[{-{incoming|count}}{+{outgoing|count}}]{status}" 2> /dev/null
}

# Add the current git branch to the prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"

#export PS1='\e[1;36m$(__git_ps1 " [%s]")$(hg_ps1)\e[m\e[1;32m \w \e[m\$ '
export PS1='\e[1;36m$(__git_ps1 " [%s]")\e[m\e[1;32m \w \e[m\$ '


# Tell python to load stuff in this script on startup
export PYTHONSTARTUP=~/.pythonrc

export PATH=$HOME/.gem/ruby/2.2.0/bin:$HOME/repos/coursera:$HOME/repos/writings:$HOME/simulation:~/bin:~/.cabal/bin:~/scripts:~/Dropbox/scripts:~/Downloads/hdf-java-2.10/usr/bin:$PATH
export PATH=$HOME/neovim/bin:$HOME/repos/wallpaper-switch:$PATH
export VMAIL_VIM=gvim
export GOPATH=$HOME/repos/gosource

alias android-connect="mtpfs -o allow_other /media/Galaxy"
alias android-disconnect="fusermount -u /media/Galaxy"

alias pg='ps aux | grep -v grep | grep --color=auto '
alias vphd='VMAIL_HOME=$HOME/.vmail/phd vmail'
alias wg='(wget www.google.com && rm index.html)'

function editmd() { 
    gvim $@ ; 
    pandocmk $@ ; 
}

_editmd(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -G "$cur*.md" -- $cur) )
}
complete -F _editmd editmd

function editlt() { 
    svim -G $@ ; 
    latexmk -pvc -pdf -synctex=1 $@ ; 
}

_editlt(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -G "$cur*.tex" -- $cur) )
}
complete -F _editlt editlt

hgrep () { 
    history | egrep --color=auto "$@" | grep --color=auto -v 'hgrep "$@"'
}

export EDITOR=gvim
