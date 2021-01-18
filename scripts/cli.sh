#!/bin/sh

# set -ex

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


echo 'Setting up bash'
cp ../configs/bashprofile $HOME/.bash_profile
cp ../configs/bashrc $HOME/.bashrc

echo 'Setting up vim'
cp ../configs/vimrc $HOME/.vimrc

# TODO: Need to properly nest the gitconfigurations for machines - dig into this later between your devices
#
# echo 'Configuring git'  
# if [ -d $HOME/src/fa/ ]; 
#     then
#         echo '/src/fa/ exists! This machine has FA repos'
#         echo 'copying employer git configuration'
#         cp ../configs/gitconfig-fa $HOME/.gitconfig-fa
#         echo 'copying personal git configuration'
#         cp ../configs/gitconfig $HOME/.gitconfig
# else
#         echo ' copying personal git configuation'
#         cp ../configs/gitconfig $HOME/.gitconfig

# fi
echo 'Tmux Config'
cp ../configs/tmux $HOME/.tmux.conf

# echo 'Installing ZSH'
# it might not be wise to have this here! 
# sudo apt install zsh 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ../configs/zshrc $HOME/.zshrc

#  Verify Vundle exists, install if necessary, and upload Vundles in .vimrc

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

# configure hammerspoon
cp ../configs/hammerspoon $HOME/.hammerspoon/init.lua


source $HOME/.bash_profile
source $HOME/.zshrc
