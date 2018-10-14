PROMPT_COMMAND=smile_prompt

RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
BYELLOW='\[\e[1;33m\]'
BMAGENTA='\[\e[1;35m\]'
BCYAN='\[\e[1;36m\]'
BWHITE='\[\e[1;37m\]'

function smile_prompt
{
    if [ "$?" -eq "0" ]
    then
        #smiley
        SC="${GREEN}:)"
    else
        #frowney
        SC="${RED}:("
    fi
    if [ $UID -eq 0 ]
    then
        #root user color
        UC="${RED}"
    else
        #normal user color
        UC="${BMAGENTA}"
    fi
    #hostname color
    HC="${BYELLOW}"
    #regular color
    RC="${BWHITE}"
    #default color
    DF='\[\e[0m\]'
    DC="${BCYAN}"
    PS1="[${UC}\u${RC}@${HC}\h ${DC}\w${DF}] ${SC}${DF} "
}

export LANG=ja_JP.UTF-8
export KCODE=u
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export HISTSIZE=10000
export HISTFILESIZE=2000000


alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias rm='rm -I'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias du='du -h'
alias tmux='tmux -2'

. ~/.bashrc.local

## Create a $PATH file for eshell
echo "(setenv \"PATH\" \"$PATH\")" > ~/.emacs.d/shellenv.el
