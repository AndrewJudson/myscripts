#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# misc aliases
# use history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}'|sort -rn |head -n 20 to get most used
# commands, so you can pick things most in need of aliases
alias sshy='ssh -Y'
alias e='emacs -nw'
alias i='ipython'
alias t='tmux'
alias p='python'

# git
alias gb='git branch'
alias gsno='git show --name-only'
alias gri='git rebase -i'
alias gca='git commit -a --amend --no-edit'
alias gco='git checkout'

# git aliases
git config --global alias.lg "log --color --graph \
--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset \
%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
