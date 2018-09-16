set -o vi

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:~/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv:$PATH"
eval "$(pyenv init -)"

export TERM=xterm-256color

export PATH="$HOME/.rbenv/shims:$PATH"

export GOPATH="$HOME/Documents/projects/go"

# Git branch in prompt
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\n\u @ \H\n\[\033[33m\]$(p=${PWD/#"$HOME"/~};((${#p}>30))&&echo "${p::10}…${p:(-19)}"||echo "\w")\[\033[00m\]\[\033[32m\]$(parse_git_branch)\[\033[00m\]\n\[\033[33m\]$\[\033[00m\] '

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias ls='ls -FG'

alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'

eval "$(jenv init -)"

export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

alias git=hub
alias gitlog="hub log --oneline --color --decorate | emojify"
alias pyserve="python -m SimpleHTTPServer 8000 --silent || python -m http.server 8000"

alias ta="tmux attach -t"
alias gs="hub status"
alias ga="hub add"
alias gc="hub commit"
alias gcm="hub commit -m"
alias gca="hub commit --amend"
alias gps="hub push"
alias gf="hub fetch"
alias gpl="hub pull"
alias grbs="hub rebase"
alias gb="hub branch"
alias gco="hub checkout"
alias gd="hub diff"
alias grst="hub reset"
alias gl="git log --oneline --graph --color --decorate"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

