#!/usr/bin/env bash
echo "setup.sh for $HOME"

ln -s "$PWD/.bashrc"       ~/.bashrc
ln -s "$PWD/.bash_aliases" ~/.bash_aliases

ln -s "$PWD/.bash" ~/.bash

ln -s "$PWD/.vimrc"        ~/.vimrc
ln -s "$PWD/.ackrc"        ~/.ackrc
ln -s "$PWD/.perltidyrc"   ~/.perltidyrc
ln -s "$PWD/gitignore"     ~/.gitignore
ln -s "$PWD/.tmux.conf"    ~/.tmux.conf

git submodule init && git submodule update

mkdir -p ~/bin
ln -s "$PWD/perldoc-complete/perldoc-complete" ~/bin/

echo "done."

