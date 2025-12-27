#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\033[38;2;148;226;213m\]\u@\h \[\033[38;2;245;194;231m\]\w \[\033[38;2;148;226;213m\]\$ \e[0m'
