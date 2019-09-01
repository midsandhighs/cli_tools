#!/bin/sh

set -ex

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
cp $HOME/cli_tools/configs/bashprofile $HOME/.bash_profile
cp $HOME/cli_tools/configs/bashrc $HOME/.bashrc

echo 'Setting up vim'
cp $HOME/cli_tools/configs/vimrc $HOME/.vimrc

echo 'Configuring git'
cp $HOME/cli_tools/configs/gitconfig $HOME/.gitconfig

echo 'Tmux Config'
cp $HOME/cli_tools/configs/tmux $HOME/.tmux.conf

echo 'Installing ZSH'
sudo apt install zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp $HOME/cli_tools/configs/zshrc $HOME/.zshrc


. $HOME/.bash_profile
source $HOME/.zshrc

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


