#!bash
# aliases for bash

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias pad="plackup -s Starlet -MPlack::App::Directory \
           -e 'Plack::App::Directory->new->to_app' --port 1234"

alias be='bundle exec'
alias ce='carotn exec'

alias got=git

alias perldoc="perldoc -M Pod::Text::Color::Delight"

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
