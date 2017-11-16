#!/usr/bin/env bash

# Fun little tool for doing some preliminary setup for customizing my CLI environment
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
sleep 3s
cp $HOME/cli_tools/.bash_profile $HOME/.bash_profile

echo 'Moving .bashrc'
sleep 3s
cp $HOME/cli_tools/.bashrc $HOME/.bashrc

echo 'Moving .vimrc'
sleep 3s
cp $HOME/cli_tools/.vimrc $HOME/.vimrc

source $HOME/.bash_profile

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


