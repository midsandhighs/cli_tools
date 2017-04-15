#cli tools

The repo for tools to make my life easier in multiple environments.
###.vimrc  
My vim customization file, including Vundles. Verifed working on 
* Debian Wheezy, Jessie
* OS X 10.9, 10.10, and 10,11, 12
* FreeBSD 10.1, 10.2, 10.3, 11 Release.

####Vundles
* vim-plist: for plist files
* vim-ragtag: for web files
* vim-markdown: for markdown files
* vim-fugitive: Git status in vim (this is less important) 

###.bash_profile:   
Currently, this only has my preferred way to ls, and the path for munki commands. some ideas:
* 'cd' behavior changes; trailing dots for navigation inside file systems?
* ssh aliases for servers? (could we script this based on whether or not on a private connection?)   

####Future looking
* tcsh? 
* do I need to put a .bashrc in here?

###cli.sh:
a dumb script to install my .vimrc and pull Vundles on any BSD system.  

* needs updated for bash path

####Future looking 
* moving the .bashrc? regexp? better exploration is commented out in the script

###irc.sh:   
a dumber script that I hope I can turn into a really simply way to launch my IRSSI screen regardless of whether the screen is attached or detached.  
#### Current blockers:
* Need to figure out how to parse screen output in bash
* or maybe a python script?

Who even knows, this document is evolving as all things do.

More later.  
