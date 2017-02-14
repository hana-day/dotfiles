function prompt {
    local B_PURPLE='\[\033[1;35m\]'
    local B_YELLOW='\[\033[1;33m\]'
    local B_GREEN='\[\033[1;32m\]'
    local DEFAULT='\[\033[0;37m\]'

    export PS1="${B_PURPLE}\u ${DEFAULT}at ${B_YELLOW}\h ${DEFAULT}in ${B_GREEN}\w${DEFAULT} "
}
prompt


export LANG=ja_JP.UTF-8
export KCODE=u
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1


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
perl -wle \
     'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
     PATH > ~/.emacs.d/shellenv.el
