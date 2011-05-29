LANG=C

cpanm Daiku
cpanm IPC::System::Simple # for autodie 'system'

ln bashrc       ~/.bashrc
ln bash_aliases ~/.bash_aliases
mkdir ~/.bash
    ln bash/linux.sh  ~/.bash/
    ln bash/darwin.sh ~/.bash/
    ln bash/cygwin.sh ~/.bash/

ln vimrc        ~/.vimrc
ln ackrc        ~/.ackrc
ln perltidyrc   ~/.perltidyrc

