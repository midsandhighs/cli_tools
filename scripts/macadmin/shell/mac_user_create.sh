#!/bin/sh

# real quick create macOS standard service user
# tested on 10.15 - all fields required.
# add ability to input from text file maybe?



# user
echo " create user"
dscl . create /Users/midsandhighs
# shell 
echo " set shell"
dscl . create /Users/midsandhighs UserShell /bin/zsh
# description 
dscl . create /Users/midsandhighs RealName "Jonathan Haenchen"
# uid
echo "uid"
dscl . create /Users/midsandhighs UniqueID 502
# gid
echo "gid"
dscl . create /Users/midsandhighs PrimaryGroupID 20
#add to ARD groups on local device
dseditgroup -o edit -a jonathan.haenchen -t user com.apple.com.apple.access_screensharing
