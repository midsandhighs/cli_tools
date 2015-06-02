#!/bin/bash

# Fun little tool for doing some preliminary setup for using vim 
# 
# - move the .vimrc file 
# - Verify Vundle is installed
# - Install Vundle if not
# - run the command line Vundle tool to install plugins
# When you git pull, you can run this to overwrite the older .vimrc
#
# On BSD systems, this is typically going to happen wherever I am set for ~, so I'll be using that. 
# Move the .vimrc file

echo 'Moving .vimrc'
sudo cp $HOME/cli_tools/.vimrc $HOME/.vimrc

# Verify and Install Vundle

if [ -d "$HOME/.vim/bundle" ];
    then
    echo 'Vundle folder exists!'
    else 
    echo 'There is no Vundle!' 
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

# Install Vundle Plugins

vim +PluginInstall +qall

#SUCCESS!

echo 'Vundles installed.'


