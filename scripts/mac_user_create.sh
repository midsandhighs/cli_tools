#!/bin/sh

# real quick create macOS standard service user
# tested on 10.15 - all fields required.
# add ability to input from text file maybe?



# user
dscl . create /Users/autopkg
# shell 
dscl . create /Users/autopkg UserShell /bin/zsh
# description 
dscl . create /Users/autopkg RealName "AutoPkg"
# uid
dscl . create /Users/autopkg UniqueID 900
# gid
dscl . create /Users/autopkg PrimaryGroupID 20
# home
dscl . create /Users/autopkg NFSHomeDirectory /Local/Users/autopkg