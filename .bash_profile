export PATH="$HOME/.rbenv/bin:/usr/local/bin:$HOME/bin:$PATH"
eval "$(rbenv init -)"

eval "$(hub alias -s)"

# Tell ls to be colourful
export CLICOLOR=1
export TERM=xterm-color

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export BUNDLER_EDITOR='/usr/local/bin/subl'


## Git CLI
# export GIT_PS1_SHOWUPSTREAM="auto"
# export GIT_PS1_SHOWDIRTYSTATE="1"
# export GIT_PS1_SHOWUNTRACKEDFILES="1"
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export PS1="\u@ \W\[\033[32m\]\$(__git_ps1)\[\033[00m\] $ "

alias bpe="subl --wait ~/.bash_profile && source ~/.bash_profile; echo 'Reloaded ~/.bash_profile'"

alias difflist="git diff --name-only `git merge-base origin/master HEAD`"
alias diffedit="(echo '.' && difflist) | xargs subl"

alias la="ls -lahFG"
alias psg="ps aux | grep $@"


### RAILS
alias be="bundle exec"
alias rc="rails console"
alias console="bundle exec rails console"
rt() {
  bin/rake test TEST=$1 TESTOPTS="--name=\"/$2/\""
}
alias rr="touch tmp/restart.txt && echo 'app restarted'"
alias rrg="rake routes | grep $@"
alias rdm="bundle exec rake db:migrate"
alias glg="gem list | grep $@"
alias jslint="bundle exec rake test:javascript_lint"
alias resque="QUEUE=* bundle exec rake resque:work"
alias redis="redis-server /usr/local/etc/redis.conf"
