set -o vi

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:~/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"

export ANDROID_HOME="/Volumes/Documents/ibleedfilm/Library/Android/sdk"
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv:$PATH"
eval "$(pyenv init -)"

export TERM=xterm-256color

export PATH="$HOME/.rbenv/shims:$PATH"

#export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# Swapping from PHP 5.5 to PHP 5.6
# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

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

#export PATH=$(echo $PATH | sed 's|/usr/local/bin||; s|/usr/local/sbin||; s|::|:|; s|^:||; s|\(.*\)|/usr/local/bin:/usr/local/sbin:\1|')

export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

#alias vim="/usr/local/bin/vim"
alias git=hub
alias gitlog="hub log --oneline --color --decorate | emojify"
alias pyserve="python -m SimpleHTTPServer 8000 --silent || python -m http.server 8000"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

