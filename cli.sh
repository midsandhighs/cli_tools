#!/bin/bash

# Tool to automagically move VIM and Bash profile customizations into the appropriate places when git pulled. 
# When you git clone/origin/whateverthefuck it creates a cli_tools folder, wherever you have done that. 
#
# On FreeBSD systems, this is typically going to happen wherever I am set for ~, so I'll be using that. 

# move the .bash_profile into the appropriate place

mv ~/cli_tools/.bash_profile ~/.bash_profile

# move the .vimrc file into the appropriate place

mv ~/cli_tools/,vim/.vimrc ~/.vimrc
