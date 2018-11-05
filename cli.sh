#!/bin/sh

#set -ex

# Script for doing some preliminary setup for customizing my CLI environment
# 
# - move the .bash_profile
# - move the .vimrc file 
# - Verify Vundle is installed
# - Install Vundle if not
# - run the command line Vundle tool to install plugins
# 
#When you git pull, you can run this to overwrite the older .vimrc
#
# On BSD systems, this is typically going to happen wherever I am set for ~, so I'll be using that. 
# Move the .vimrc file



echo 'Moving .bash_profile'
cp .bash_profile $HOME/.bash_profile

echo 'Moving .bashrc'
cp .bashrc $HOME/.bashrc

echo 'Moving .vimrc'
cp .vimrc $HOME/.vimrc

echo 'Moving .gitconfig'
cp .gitconfig $HOME/.gitconfig

echo 'Moving .tmux.conf'
cp .vimrc $HOME/.tmux.conf

echo 'Moving .zshrc'
cp .zshrc $HOME/.zshrc


. $HOME/.bash_profile

source $HOME/.zshrc

# Verify Vundle exists, install if necessary, and upload Vundles in .vimrc

if [ -d "$HOME/.vim/bundle" ];
    then
        echo 'Vundle folder exists!'
        sleep 5s
        vim +PluginInstall +qall
        echo 'Vundles updated.'
else    
    
        echo 'Vundle is not installed! '
        sleep 10s
        echo 'Cloning Vundle.vim'  
        git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
        sleep 5s
        echo 'Vundle Installed!'
        sleep 3s 
        vim +PluginInstall +qall
        echo 'Vundles updated.'
fi


