# cli tools

```
The cool kids call these "dotfiles"
```

configs, tools, scripts to "get things done."



## Config files

### hammerspoon

I use [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) to handle window management on macOS devices. It allows me to use .lua files to bind keyboard commands to variety of actions. 
#### Enabled:
* Window Mgmt
* *  Shift - Ctrl - `$arrowkeys`
* * * Left & Right - folds focused window in half horizontally and chooses side of screen
* * * Up & Down - fold focused window in half vertically and chooses top / bottom half of screen
* [Nethack](https://nethackwiki.com/wiki/Direction) Movement
* * Alt/Opt - Ctrl - `$numpad`
* * * moves focused window in compass rose directions
* reloadConfig()
* * function to autoreload configuration on a change 
#### Disabled:
* Debug function
* * Shift - Ctrl - R
* * Manual reload with `hs.alert` which is more prominent than `hs.notify`

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

### config.yml

wtfutil vars

### .zshrc

making zsh useful for me on macOS

## Scripts

### cli.sh:
a script to install my .vimrc and pull Vundles on any BSD system. It also attempts to move .bashrc and .bash_profile into place, then `source .bash_profile` to get the changes. It also puts my global .gitconfig in place. It can also install and / or configure `Oh My Zsh`. 

Tested on macOS 10.11 thru 10.16/11.0, along with all stable Ubuntus and FreeBSDs. 

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
