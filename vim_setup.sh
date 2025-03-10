#!/bin/bash

cd ~/
# create folders
mkdir .vim
mkdir .vim/autoload
mkdir .vim/backup
mkdir .vim/colors
mkdir .vim/plugged

# install vim-plug manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
