# cli tools

The repo for tools to make my life easier in multiple environments.

## Config files

### .vimrc  
My vim customization file, including Vundles. macOS, Debian, Ubuntu and FreeBSD tested

#### Vundles
* vim-plist: for plist files
* vim-ragtag: for web files
* vim-markdown: for markdown files
* vim-fugitive: Git status in vim (this is less important) 

### .bash_profile and .bashrc   

.bash_profile calls .bashrc at the beginning for showing pwd and git status if it is a branch.

.bashrc also contains Tiny Care Terminal values now.

### .gitconfig
Configuration for git type things. 

### .tmux.config
Config for tmux

### .zshrc

making zsh useful on macOS

## Scripts

### cli.sh:
a script to install my .vimrc and pull Vundles on any BSD system. It also attempts to move .bashrc and .bash_profile into place, then `source .bash_profile` to get the changes. It also puts my global .gitconfig in place. 

### pingtimestamp.sh

This is dumb and runs ping with an audio queue when it doesn't pong and with a timestamp. If you need this I'm sorry. 

Use like 

`./pingtimestamp.sh $site`

yay.

### crontabs.sh

Get's a list of every user's crontab on a FreeBSD machine. Needs sudo. 

### Current blockers:

Who even knows, this document is evolving as all things do.

More later.  
