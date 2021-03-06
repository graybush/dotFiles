# aliases

# Turn on colors if they are available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -N --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias ll='ls -lhN'
    alias la='ls -AhN'

    alias grep='grep --color=auto --exclude-dir={.hg,target} --exclude=tags'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias grep='grep --color=auto'
    alias ll='ls -lh'
    alias la='ls -Ah'

fi

alias dirs='dirs -v'
alias duall="echo 'du -sch .[!.]* * | sort -h'; du -sch .[!.]* * | sort -h"
alias fixterm='stty sane; stty erase ^h'
alias gtags='ctags -R $(pwd)/ 2>&1 > /dev/null &'
alias me='ps -fU $(whoami)'
alias pdb='python -m pdb'
alias serv='python -m SimpleHTTPServer 9876'
# alias ssh='ssh -XC -L 9876:localhost:9786'

# Deep file explorer
alias dirtree="find . -maxdepth 4 -name '\.[^.]*' -prune -o -print | sed -e 's/\.\///' -e 's/[^/^|]*\// --- /g' -e 's/---  / |  /g '"

screen_ssh() {
    args=$#
    screen -t ${!args} ssh -X -C $@
}
screen_vim() {
    args=$#
    screen -t ${!args} vim $@
}
screen_cd() {
    cd "$*"
    screen -X chdir "$PWD"
}

if [[ -n $(ps aux -U $(whoami) | awk '{print $11}' | grep -x 'screen') ]]; then
  alias cd=screen_cd
  alias ssh=screen_ssh
  # alias vim=screen_vim
fi
