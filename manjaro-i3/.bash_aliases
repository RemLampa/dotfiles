alias pyserve="python -m SimpleHTTPServer 8000 --silent || python -m http.server 8000"

alias tmux="tmux -2"
alias ta="tmux attach -t"
alias ssh-on='eval ssh-agent -s'

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

alias keychain="/usr/bin/keychain $HOME/.ssh/id_rsa && source $HOME/.keychain/$HOSTNAME-sh"

# colorls
alias cls='colorls'
alias lc='colorls -lA --sd'

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
