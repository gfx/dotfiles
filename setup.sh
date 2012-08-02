#!/usr/bin/env bash
echo "setup.sh for $HOME"

ln -fs "$PWD/.bashrc"       ~/.bashrc
ln -fs "$PWD/.bash_aliases" ~/.bash_aliases
ln -fs "$PWD/.bash" ~/.bash

ln -fs "$PWD/.vimrc"        ~/.vimrc
ln -fs "$PWD/.ackrc"        ~/.ackrc
ln -fs "$PWD/.perltidyrc"   ~/.perltidyrc
ln -fs "$PWD/.gitignore_global"    ~/.gitignore_global
ln -fs "$PWD/.gitconfig"    ~/.gitconfig
ln -fs "$PWD/.tmux.conf"    ~/.tmux.conf

git submodule init && git submodule update

mkdir -p ~/bin
ln -fs "$PWD/perldoc-complete/perldoc-complete" ~/bin/

mkdir -p ~/.vim/bundle
ln -fs "$PWD/vundle" ~/.vim/bundle/vundle

echo "done."

