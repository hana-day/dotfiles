# --------------------------------------------------
# General Settings
# --------------------------------------------------
bindkey -e # vi mode

setopt no_beep
setopt auto_cd
setopt correct
setopt magic_equal_subst # complete after --prefix=
setopt notify 

autoload -U compinit
compinit
setopt auto_list # display completion list
setopt auto_menu
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt list_packed 
setopt list_types

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist # use ! history expantion
setopt extended_history # save execution time
setopt hist_ignore_dups
setopt share_history # share history with other shells
setopt hist_reduce_blanks

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

setopt multios # multiple redirect

# --------------------------------------------------
# Look Settings
# --------------------------------------------------
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
autoload -U colors; colors
PROMPT='%F{yellow}%B%n%b %F{blue}%B%~ $%b'
SPROMPT="%r is correct? [n,y,a,e]: " 

# --------------------------------------------------
# General Export Settings
# --------------------------------------------------
export EDITOR=emacs
export LANG=ja_JP.UTF-8 
export KCODE=u
export TERM='xterm-256color'

[ -f ~/.zshrc.private ] && source ~/.zshrc.private
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
[ -f ~/.zshrc.alias.private ] && source ~/.zshrc.alias.private

## create emacs env file
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/shellenv.el
