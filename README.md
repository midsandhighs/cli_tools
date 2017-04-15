# cli tools

The repo for tools to make my life easier in multiple environments.
### .vimrc  
My vim customization file, including Vundles. Verifed working on 
* Debian Wheezy, Jessie
* macOS - 10.9 to current.
* FreeBSD 10.1, 10.2, 10.3, 11 Release.

#### Vundles
* vim-plist: for plist files
* vim-ragtag: for web files
* vim-markdown: for markdown files
* vim-fugitive: Git status in vim (this is less important) 

### .bash_profile and .bashrc   
Contains aliases for navigation some $PATH work (macOS specific)

.bash_profile calls .bashrc at the beginning for showing pwd and git status if it is a branch.

#### Future looking
* Shell agnositc? Compatibility with sh? tcsh? different bash paths? 
* tmux/mosh one way in for IRC access

### cli.sh:
a dumb script to install my .vimrc and pull Vundles on any BSD system. It also attempts to move .bashrc and .bash_profile into place, then `source .bash_profile` to get the changes

#### Future looking 

## The Attic

### irc.sh:   
a dumber script that I hope I can turn into a really simply way to launch my IRSSI screen regardless of whether the screen is attached or detached.  
#### Current blockers:
* Need to figure out how to parse screen output in bash
* or maybe a python script?

Who even knows, this document is evolving as all things do.

More later.  
