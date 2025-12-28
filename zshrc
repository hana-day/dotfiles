# PROMPT_COMMAND equivalent in zsh
function smile_prompt {
    if [[ $? -eq 0 ]]; then
        # smiley
        SC="%F{green}:)"
    else
        # frowney
        SC="%F{red}:("
    fi
    if [[ $UID -eq 0 ]]; then
        # root user color
        UC="%F{red}"
    else
        # normal user color
        UC="%F{magenta}"
    fi
    # hostname color
    HC="%F{yellow}"
    # regular color
    RC="%F{white}"
    # default color
    DF="%f"
    DC="%F{cyan}"
    # git branch color
    GC="%F{blue}"
    
    # Get git branch if in a git repository
    local git_branch=""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git_branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        if [[ -n $git_branch ]]; then
            git_branch=" ${GC}(${git_branch})${DF}"
        fi
    fi
    
    # Get Python virtual environment name
    local venv_prompt=""
    if [[ -n $VIRTUAL_ENV ]]; then
        venv_prompt="($(basename $VIRTUAL_ENV)) "
    fi
    
    PROMPT="${venv_prompt}[${UC}%n${RC}@${HC}%m ${DC}%~${DF}]${git_branch} ${SC}${DF} "
}

# Call the smile_prompt function before each prompt
precmd_functions+=(smile_prompt)

# Export variables
export LANG=ja_JP.UTF-8
export TERM='xterm-256color'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export HISTSIZE=10000
export HISTFILESIZE=2000000

# Aliases
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

. $HOME/.zshrc.local

. ~/.local/bin/env
