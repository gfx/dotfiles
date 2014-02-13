#!/usr/bin/env bash
echo "setup.sh for $HOME"

set -xe

ln -fs "$PWD/.bashrc"       ~/
ln -fs "$PWD/.bash_aliases" ~/
ln -fs "$PWD/.bash" ~/
ln -fs "$PWD/.inputrc" ~/

ln -fs "$PWD/.vimrc"        ~/
ln -fs "$PWD/.ackrc"        ~/
ln -fs "$PWD/.perltidyrc"   ~/
ln -fs "$PWD/.gitignore_global"    ~/
ln -fs "$PWD/.gitattributes_global"    ~/
ln -fs "$PWD/.gitconfig"    ~/
ln -fs "$PWD/.tmux.conf"    ~/

git submodule init && git submodule update

mkdir -p ~/bin
ln -fs "$PWD/perldoc-complete/perldoc-complete" ~/bin/

mkdir -p ~/.vim/bundle
if [ ! -e ~/.vim/bundle/neobundle.vim ] ; then
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

echo "done."

