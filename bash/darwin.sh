#!bash
# MacOSX-specific resources

ANDROID_SDK="$HOME/dev/android-sdk-mac_x86"
ANDROID_NDK="$HOME/android/ndk-r4b"
export PATH="$ANDROID_NDK:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 "$EDITOR" "$@"'

