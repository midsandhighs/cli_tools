#---------------------------------------------------------------------------
#
# Bash is love, Bash is life
#
# 1. Sourcing .bashrc if .bash_profile is not necessarily available 
#   - Allows me to put this in multiple systems and create some useful tricks
# 2. Navigation
# 3. Dumb tricks/miscellaneous
#
#---------------------------------------------------------------------------

# 1. Sourcing .bashrc if present, other wise, .bash_profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# 2. File Navigation
alias ls='ls -lFha'
alias cd..='cd ../' # Theoretically this will let me navigate backwards
alias ..='cd ../'   # This may be quicker though
alias :q='exit'


