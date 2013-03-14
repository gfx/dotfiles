# If not running interactively, don't do anything
[ -z "$PS1" ] && return

function sourceif {
	if [ -f "$1" ]; then
		#echo $1
		source "$1"
	fi
}

sourceif /etc/bashrc

function title {
    echo -ne "\033]0;${1}\007"
}
title "reading ~/.bashrc ..."

PATH="$HOME/bin:$HOME/.cabal/bin:/usr/local/bin:$PATH"
PATH="~/.vim/bin:$PATH"
PATH="~/dev/depot_tools:$PATH"
export PATH

# OS specific resources
case "`uname`" in
    Linux)   sourceif ~/.bash/linux.sh  ;;
    Darwin)  sourceif ~/.bash/darwin.sh ;;
    CYGWIN*) sourceif ~/.bash/cygwin.sh ;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# ignore *~ and etc.
FIGNORE="~:.bak:.old:.o:.exe"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

color_prompt=yes

export PS1='\w\$ '

# enable color support of ls and also add handy aliases
if [ -x `which dircolors` ]; then
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

sourceif ~/.bash_aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix ; then
    sourceif /etc/bash_completion
fi

complete -C perldoc-complete -o nospace -o default perldoc
complete -C perldoc-complete -o nospace -o default cpandoc

sourceif ~/perl5/perlbrew/etc/bashrc
#sourceif ~/.rvm/scripts/rvm
sourceif ~/.pythonbrew/etc/bashrc
sourceif ~/.nvm/nvm.sh

export PATH="$HOME/.nodebrew/current/bin:$PATH"

export EDITOR="`which vim`"
export PAGER="`which less`"
#export PAGER="`which vimpager`"
#if [ -z $PAGER ] ; then
#    export PAGER='/usr/bin/less'
#fi

export LESS='-r -I' # --raw-control-chars and -IGNORE-CASE

export PERL_CPANM_OPT='-q'

export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# ------------------------------------------------------------------------------#

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


    PROMPT='\u@\h \w$(__git_ps1)';
    TITLEBAR='\[\033]0;\w$(__git_ps1) \u@\h\007\]'
    case "$TERM" in
        xterm*)
            # do nothing
        ;;
        screen*)
            # do nothing
        ;;
        *)
            TITLEBAR=""
        ;;
    esac

    PS1="$LIGHT_BLUE$PROMPT$TITLEBAR\n->> $LIGHT_GRAY"
    PS2="$LIGHT_GREEN> $LIGHT_GRAY"
    PS3="$LIGHT_RED+ $LIGHT_GRAY"
}
proml

# make PATH unique
export PATH=`perl -e 'print join ":", grep { !$u{$_}++ } split /:/, $ARGV[0]' "$PATH"`

title $PWD
# EOF

