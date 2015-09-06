#cli tools

The repo for tools to make my life easier in multiple environments.
###.vimrc  
My vim customization file, including Vundles. Verifed working on Debian Wheezy, OS X 10.9, 10.10, and 10,11, FreeBSD 10.1 Release  

####Vundles
* vim-plist: for plist files
* vim-ragtag: for web files
* vim-markdown: for markdown files
* vim-fugitive: Git status in vim (this is less  

###.bash_profile:   
placeholder for a bash profile, but it seems to be too subjective per machine. keeping it here until I decide what to do with it. Currently for OS X machines. Not even going to go there regarding .bashrc files and whether or not I need to get a tcsh thing going   
####Future looking
* tcsh? 
* do I need to put a .bashrc in here?

###cli.sh:
a dumb script to install my .vimrc and pull Vundles on any BSD system.  
####Future looking 
* moving the .bashrc? regexp? better exploration is commented out in the script

###irc.sh:   
a dumber script that I hope I can turn into a really simply way to launch my IRSSI screen regardless of whether the screen is attached or detached.  
#### Current blockers:
* Need to figure out how to parse screen output in bash
* or maybe a python script?

Who even knows, this document is evolving as all things do.

More later.  
