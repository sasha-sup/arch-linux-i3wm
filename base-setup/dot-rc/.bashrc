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
alias aws-login="aws sso login --profile " 

# Make admin great again
alias use-admin-profile='export AWS_PROFILE=""'
# Make terraform great again
alias use-tf-profile='export AWS_PROFILE="terraform"'

#sync aki-bot
alias sync-aki-bot='rsync -av /home/sasha/Pictures/akibot/  ubuntu@:/opt/project-fenix/content'

export AWS_PROFILE=""
export GOOGLE_APPLICATION_CREDENTIALS=""
# for ansible dynamic inventory plugin (gcp_compute)
export GCP_SERVICE_ACCOUNT_FILE="$GOOGLE_APPLICATION_CREDENTIALS"
export HEALTHCHECKSIO_API_KEY=
export GRAFANA_AUTH=
export TF_VAR_swc_cf_secret_header=
export TF_VAR_cloudflare_api_key=

# Screenshot 
alias scrot-area="scrot -s ~/Pictures/screenshot"
alias scrot="scrot ~/Pictures/screenshot"
alias scrot-window="scrot -u ~/Pictures/screenshot"

# vpn
alias vpn="sudo bash /home/sasha/Software/vpn.sh"

# Infra junp host
alias sshb="ssh -J swcb"
alias scpb="scp -J swcb"

