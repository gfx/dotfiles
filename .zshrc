# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler cpanm gem npm gradle perl)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=ja_JP.UTF-8

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# non-standard PATHs
export PATH="$HOME/.vim/bin:$PATH"
export PATH="$HOME/dev/devopt_tools:$PATH"
export PATH="$HOME/repo/emscripten:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"

export MANPATH="/usr/local/man:$MANPATH"

function source-if-exists {
  if [[ -s $1 ]] then
    source $1
  fi
}


source-if-exists ~/perl5/perlbrew/etc/bashrc
source-if-exists ~/.pythonbrew/etc/bashrc
source-if-exists ~/.nvm/nvm.sh

if which rbenv >/dev/null ; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if which plenv >/dev/null ; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(plenv init -)"
fi

if which brew >/dev/null ; then
    local BREW_PREFIX=`brew --prefix`

    export PATH="$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="$BREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"

    export ANDROID_SDK="$BREW_PREFIX/opt/android-sdk"
    export ANDROID_NDK="$BREW_PREFIX/opt/android-ndk"
    export ANDROID_HOME="$ANDROID_SDK"
fi

export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH"

export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export JAVA_HOME=`/usr/libexec/java_home`

export EDITOR=`which vim`
alias ls="ls --color -G"

# zaw-settings
source-if-exists "$HOME/.zaw/zaw.zsh"

bindkey '^r' zaw-history
