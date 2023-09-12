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

# Update system
alias update='sudo pacman -Syu'
# Show system information
alias sysinfo='neofetch'

# Enable 256 color
export TERM="xterm-256color"

# AWS SSO login
alias aws-login="aws sso login --profile ######" 

# Make admin great again
alias use-admin-profile='export AWS_PROFILE="#########"'
# Make terraform great again
alias use-tf-profile='export AWS_PROFILE="terraform"'

# Screenshot 
alias scrot-area="scrot -s ~/Pictures/screenshot"
alias scrot="scrot ~/Pictures/screenshot"
alias scrot-window="scrot -u ~/Pictures/screenshot"

# vpn
alias vpn="sudo bash /home/sasha/Software/vpn.sh"

#tg
alias tg="/home/sasha/Software/Telegram/Telegram &"