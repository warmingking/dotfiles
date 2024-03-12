## aliases

source $HOME/.zsh/git_aliases.zsh

alias vi="vim"
alias lessf="less +F"
#alias tmux="TERM=xterm-256color tmux"

alias c=clear

# less Colours
if [[ ${PAGER} == 'less' ]]; then
    (( ! ${+LESS_TERMCAP_mb} )) && export LESS_TERMCAP_mb=$'\E[1;31m'   # Begins blinking.
    (( ! ${+LESS_TERMCAP_md} )) && export LESS_TERMCAP_md=$'\E[1;31m'   # Begins bold.
    (( ! ${+LESS_TERMCAP_me} )) && export LESS_TERMCAP_me=$'\E[0m'      # Ends mode.
    (( ! ${+LESS_TERMCAP_se} )) && export LESS_TERMCAP_se=$'\E[0m'      # Ends standout-mode.
    (( ! ${+LESS_TERMCAP_so} )) && export LESS_TERMCAP_so=$'\E[7m'      # Begins standout-mode.
    (( ! ${+LESS_TERMCAP_ue} )) && export LESS_TERMCAP_ue=$'\E[0m'      # Ends underline.
    (( ! ${+LESS_TERMCAP_us} )) && export LESS_TERMCAP_us=$'\E[1;32m'   # Begins underline.
fi

# if eza exist, alias to ls
if (( ${+commands[eza]} )); then
    alias ls='eza'
    alias l='ls'
    alias ll='eza -l'
    alias lll='eza -l | less'
    alias lla='eza -la'
    alias llt='eza -T'
    alias llfu='eza -bghHliS --git'
else
    alias l='ls -1A'         # Lists in one column, hidden files.
    alias ll='ls -lh'        # Lists human readable sizes.
    alias lr='ll -R'         # Lists human readable sizes, recursively.
    alias la='ll -A'         # Lists human readable sizes, hidden files.
    alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
    alias lx='ll -XB'        # Lists sorted by extension (GNU only).
    alias lk='ll -Sr'        # Lists sorted by size, largest last.
    alias lt='ll -tr'        # Lists sorted by date, most recent last.
    alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
    alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
fi

alias sl='ls' # I often screw this up.

if (( $+commands[nvim] )); then
    alias vim="nvim"
fi

if (( $+commands[emacsclient] )); then
    alias e='emacsclient -c -n -a ""'
fi

alias editor='$EDITOR'
alias v='vim'

if (( $+commands[pacman] )); then
    alias pacall='sudo pacman -Syyu'
    alias paci='sudo pacman -S'
    alias pacrdeps='sudo pacman -Rsn'
fi

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias s="sudo"

if (( $+commands[chezmoi] )); then
    alias cza="chezmoi apply -v"
    alias czadd="chezmoi add -v"
    alias czd="chezmoi diff"
    alias czl="chezmoi git log"
fi

if [[ ${TERM} == 'foot' ]]; then
    alias ssh="TERM=xterm-256color ssh"
fi
