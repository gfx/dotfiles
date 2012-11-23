#!bash
# MacOSX-specific resources

if which brew > /dev/null ; then

	BREW_PREFIX=`brew --prefix`
	if [ -f "$BREW_PREFIX/etc/bash_completion" ]; then
		. "$BREW_PREFIX/etc/bash_completion"
	fi

	export PATH="/Applications/dart/sdk/bin:$PATH"
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
	export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

	export ANDROID_SDK=`brew --prefix android-sdk`
	export ANDROID_NDK=`brew --prefix android-ndk`

fi

export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"

export EDITOR="`which vim`"

export LANG=ja_JP.UTF-8

