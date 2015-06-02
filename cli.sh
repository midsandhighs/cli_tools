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

# install Vundle:

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# move the .vimrc file into the appropriate place

sudo cp ~/cli_tools/.vimrc ~/.vimrc
