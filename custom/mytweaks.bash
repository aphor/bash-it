#!/usr/bin/env bash

# unset things from .bash_it
unset t

# Better output
alias mount='mount |column -t'
alias j='jobs -l'
alias df='df -h'
alias du='du -h'
alias g='grep --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Safety Nets
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# custom variables
export HISTSIZE=100000

# set shell options
shopt -s cdspell
shopt -s dirspell

alias macvim='open -a '/Applications/MacVim.app''

# Override function from bobby theme
function prompt_command() {
    PS1="${purple}\u${red}@${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${green}→${reset_color} "
}

export PROMPT_COMMAND="history -a; history -c; history -r; prompt_command;$PROMPT_COMMAND"
