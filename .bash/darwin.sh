#!bash
# MacOSX-specific resources

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

ANDROID_SDK="$HOME/dev/android-sdk-mac_x86"
ANDROID_NDK="$HOME/android/ndk-r4b"
export PATH="$ANDROID_NDK:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='"$EDITOR" "$@"'

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export LANG=ja_JP.UTF-8

