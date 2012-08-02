#!bash
# MacOSX-specific resources

BREW_PREFIX=`brew --prefix`
if [ -f "$BREW_PREFIX/etc/bash_completion" ]; then
    . "$BREW_PREFIX/etc/bash_completion"
fi

export PATH="/Applications/dart/sdk/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

ANDROID_SDK=`brew --prefix android-sdk`
ANDROID_NDK=`brew --prefix android-ndk`

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='"$EDITOR" "$@"'

export LANG=ja_JP.UTF-8

