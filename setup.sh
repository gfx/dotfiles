#!/usr/bin/env bash
echo "setup.sh for $HOME"

set -xe

ln -fs "$PWD/.zshrc" ~/
ln -fs "$PWD/.bashrc"       ~/
ln -fs "$PWD/.bash_aliases" ~/
ln -fs "$PWD/.bash" ~/
ln -fs "$PWD/.inputrc" ~/

ln -fs "$PWD/.tmux.conf"    ~/

mkdir -p ~/bin
ln -fs "$PWD/perldoc-complete/perldoc-complete" ~/bin/

echo "done."

