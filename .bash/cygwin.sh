#!bash
# Cygwin-specific resources

if [ "$_PWD" ] ; then
    cd "`cygpath "$_PWD"`"
    unset _PWD
fi

export CYGWIN=title
export TERM=xterm


