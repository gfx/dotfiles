#!bash
# aliases for bash

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias g++="g++ -Wall -Wextra -g"
alias gcc="gcc -Wall -Wextra -g"


function pm {
    PERLDOC_PAGER="$EDITOR" perldoc -m "$1" ;
}

function pm-update {
    cpan-outdated -p | cpanm -q
}

function pm-version {
    perl -e "use $1;print qq|$1: \$$1::VERSION\n|;" ;
}

function pm-ack { # pm-ack $pettern $module
    ack --color --context 3 --no-recurse "$1" `perldoc -l $2` | less ;
}

complete -C perldoc-complete -o nospace -o default pm
complete -C perldoc-complete -o nospace -o default pm-version
complete -C perldoc-complete -o nospace -o default pm-ack



