#---------------------------------------------------------------------------
#
# Bash is love, Bash is life
#
# 1. Sourcing .bashrc if .bash_profile is not necessarily available 
#   - Allows me to put this in multiple systems and create some useful tricks
# 2. Paths
#   - munki and associated tools
#   - /usr/local/bin
#   - /usr/local/sbin <- to keep homebrew from yelling at me
# 3. Navigation
# 4. Dumb tricks/miscellaneous
#
#---------------------------------------------------------------------------

# 1. Sourcing .bashrc if present, other wise, .bash_profile
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# 2. Paths
export PATH="/usr/local/munki:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# 3. Navigation
alias ls='ls -lFGa'
alias cd..='cd ../' # Theoretically this will let me navigate backwards
alias ..='cd ../'   # This may be quicker though

# 4. Dumb tricks/misc/aliases
alias midsnode='mosh --ssh="ssh -p 5003" midsandhighs@midsandhighs.com' 
alias graceful='ssh -Av -p 2222 jonathanh@graceful.hou.flightaware.com'
alias alfa='ssh -Av jonathanh@alfa.hou.corp.flightaware.com'
alias eyes='ssh -Av jonathanh@eyes.flightaware.com'
alias ebere='ssh -Av jonathanh@ebere.hou.flightaware.com'
alias gmann='ssh -Av jonathanh@gmann.hou.flightaware.com'
alias cidel='ssh -Av jonathanh@cidel.hou.flightaware.com'
alias bedlm='ssh -Av jonathanh@bedlm.hou.flightaware.com'
alias bluuz='ssh -Av jonathanh@bluuz.hou.flightaware.com'
alias owwls='ssh -Av jonathanh@owwls.hou.flightaware.com'
alias hetug='ssh -Av jonathanh@hetug.hou.flightaware.com'
alias delta='ssh -Av jonathanh@delta.gwp.corp.flightaware.com'
alias hntrr='ssh -Av jonathanh@hntrr.hou.flightaware.com'
alias gappi='ssh -Av jonathanh@gappi.hou.flightaware.com'
alias welbo='ssh -Av jonathanh@welbo.hou.flightaware.com'
alias wlmor='ssh -Av jonathanh@wlmor.hou.flightaware.com'
alias zevax='ssh -Av jonathanh@zevax.hou.flightaware.com'



