#!/bin/sh

# This file sets up vim. It requires git installed.
# If you cloned my repository from GitHub you probably
# have it already ;-)

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup current vimrc and gvimrc files if exist
if [ -f ~/.vimrc ]
then
    echo "~/.vimrc file exists. Copying to ~/vim_backup/vimrc"
    mkdir -p ~/vim_backup
    mv ~/.vimrc ~/vim_backup/vimrc
fi
if [ -f ~/.gvimrc ]
then
    echo "~/.gvimrc file exists. Copying to ~/vim_backup/gvimrc"
    mkdir -p ~/vim_backup
    mv ~/.gvimrc ~/vim_backup/gvimrc
fi
if [ -d ~/.vim ] 
then
    echo "Moving ~/.vim directory to ~/vim_backup/vim"
    mkdir -p ~/vim_backup
    mv ~/.vim ~/vim_backup/vim
fi

ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/gvimrc ~/.gvimrc

mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

vim +BundleInstall +qall

echo "Congratulations! If everything went well you should have my vim configuration!"
