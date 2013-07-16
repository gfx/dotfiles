#!bash
# MacOSX-specific resources

if which brew > /dev/null ; then

	local BREW_PREFIX=`brew --prefix`

	sourceif "$BREW_PREFIX/etc/bash_completion"
	sourceif "$BREW_PREFIX/etc/profile.d/z.sh"

    export PATH="~/dex2jar:$PATH"
    export PATH="/usr/local/share/npm/bin:$PATH"
	export PATH="/Applications/dart/sdk/bin:$PATH"
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
	export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

	export ANDROID_SDK=`brew --prefix android-sdk`
	export ANDROID_NDK=`brew --prefix android-ndk`

    export GOROOT="`brew --prefix go`"
    export GOPATH=$HOME/.go
    export PATH="$GOPATH/bin:$PATH"
fi

export PATH="/Applications/MacVim.app/Contents/MacOS:/usr/local/sbin:$PATH"

export LANG=ja_JP.UTF-8

