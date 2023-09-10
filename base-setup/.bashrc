# ~/.bashrc for Arch Linux

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        startx
fi

alias chrome="google-chrome-stable &"
alias dolphin="dolphin &"
alias tg="/home/sasha/Software/Telegram/Telegram &"


# Update system
alias update='sudo pacman -Syu'
# Show system information
alias sysinfo='neofetch'

# Enable 256 color
export TERM="xterm-256color"