#!/bin/bash

# Tool to automagically move VIM (.vimrc) customizations into the appropriate places when git pulled. 
# When you git clone it creates a cli_tools folder, wherever you have done that. 
#
# When you git pull, you can run this to overwrite the older .vimrc
#
# On BSD systems, this is typically going to happen wherever I am set for ~, so I'll be using that. 


# move the .vimrc file into the appropriate place

sudo cp ~/cli_tools/.vimrc ~/.vimrc
