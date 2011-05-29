# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

function title {
    echo -ne "\033]0;${1}\007"
}
title "reading ~/.bashrc ..."

# for performance
if [ -e /dev/cgroup ] ; then
    mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
    echo $$ > /dev/cgroup/cpu/user/$$/tasks
    echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

color_prompt=yes

export PS1='\w\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

#PATH="/usr/local/mysql/bin:$PATH"

PATH="~/.vim/bin:$PATH"
PATH="~/bleadperl/bin:~/ancientperl/bin:$PATH"
export PATH

if [ -s ~/perl5/perlbrew/etc/bashrc ] ; then
    source ~/perl5/perlbrew/etc/bashrc
fi

if [ -s ~/.rvm/scripts/rvm ] ; then
    source ~/.rvm/scripts/rvm
fi

if [ -s ~/.pythonbrew/etc/bashrc ] ; then
    source ~/.pythonbrew/etc/bashrc
fi

# make PATH unique
export PATH=`perl -e 'print join ":", grep { !$u{$_}++ } split /:/, $ARGV[0]' "$PATH"
`

export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/less'
export LESS='-r'

export PERL_CPANM_OPT='-q'

# ------------------------------------------------------------------------------#

function pm {
    PERLDOC_PAGER=$EDITOR perldoc -m $*
}

function pm-update {
    cpan-updated -p | cpanm -q
}

function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
    local        BLUE="\[\033[0;34m\]"
    local  LIGHT_BLUE="\[\033[1;34m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    case "$TERM" in
        xterm*)
        TITLEBAR='\[\033]0;\w $(git_branch) \u@\h\007\]'
        ;;
        *)
        TITLEBAR=""
        ;;
    esac

    PS1="$TITLEBAR$LIGHT_BLUE\w\$ $LIGHT_GRAY"
    PS2='> '
    PS4='+ '
}
proml

# OS specific resources
case "`uname`" in
    Linux)   source ~/.bash/linux.sh ;;
    Darwin)  source ~/.bash/darwin.sh ;;
    CYGWIN*) source ~/.bash/cygwin.sh ;;
esac

titie "$HOME"
