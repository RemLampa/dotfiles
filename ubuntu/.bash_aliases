alias pyserve="python -m SimpleHTTPServer 8000 --silent || python -m http.server 8000"

alias tmux='tmux -2'
alias ta="tmux attach -t"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -FG --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Switch between cpu performance and power saving
alias cpuboost='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpusave='echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

# Git
alias gitlog="git log --oneline --color --decorate | emojify"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gps="git push"
alias gf="git fetch"
alias gpl="git pull"
alias grbs="git rebase"
alias gb="git branch"
alias gco="git checkout"
alias gd="git diff"
alias grst="git reset"
alias gl="git log --oneline --graph --color --decorate | emojify | less -r"

# Connect to SSH agent
# eval "$(ssh-agent -s)"
# /usr/bin/keychain $HOME/.ssh/id_rsa
# source $HOME/.keychain/$HOSTNAME-sh
alias keychain="/usr/bin/keychain $HOME/.ssh/id_rsa && source $HOME/.keychain/$HOSTNAME-sh"

# NO-STACK LOCAL CLI
alias ns="node ~/Documents/projects/matchlynx/nostack-cli/bin/run"

# alias git=hub
# alias gitlog="hub log --oneline --color --decorate | emojify"
# alias gs="hub status"
# alias ga="hub add"
# alias gc="hub commit"
# alias gcm="hub commit -m"
# alias gca="hub commit --amend"
# alias gps="hub push"
# alias gf="hub fetch"
# alias gpl="hub pull"
# alias grbs="hub rebase"
# alias gb="hub branch"
# alias gco="hub checkout"
# alias gd="hub diff"
# alias grst="hub reset"
# alias gl="git log --oneline --graph --color --decorate"
