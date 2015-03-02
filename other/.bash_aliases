#!/bin/bash

# some more ls aliases
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'

# navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# misc aliases
alias sshy='ssh -Y'
alias e='emacs -nw'

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
