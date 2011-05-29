#!/usr/bin/env bash
echo "setup.sh for $HOME"

ln bashrc       ~/.bashrc
ln bash_aliases ~/.bash_aliases
mkdir ~/.bash
    ln bash/linux.sh  ~/.bash/
    ln bash/darwin.sh ~/.bash/
    ln bash/cygwin.sh ~/.bash/

ln vimrc        ~/.vimrc
ln ackrc        ~/.ackrc
ln perltidyrc   ~/.perltidyrc

mkdir ~/bin
git submodule init && git submodule update
ln perldoc-complete/perldoc-complete ~/bin/
