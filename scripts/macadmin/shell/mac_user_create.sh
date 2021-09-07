#!/bin/sh

# real quick create macOS standard service user
# tested on 10.15 - all fields required.
# add ability to input from text file maybe?



# user
echo " create user"
dscl . create /Users/$USER
# shell 
echo " set shell"
dscl . create /Users/$USER UserShell /bin/zsh
# description 
dscl . create /Users/$USER RealName "$USER"
# uid
echo "uid"
dscl . create /Users/$USER UniqueID 502
# gid
echo "gid"
dscl . create /Users/$USER PrimaryGroupID 20
#add to ARD groups on local device
dseditgroup -o edit -a $USER -t user com.apple.com.apple.access_screensharing
