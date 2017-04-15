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

# 3. File Navigation
alias ls='ls -lFG'
alias cd..='cd ../' # Theoretically this will let me navigate backwards
alias ..='cd ../'   # This may be quicker though
alias :q='exit'

# 4. Links for ssh 
alias midsnode='mosh midsandhighs@midsandhighs.com' 
