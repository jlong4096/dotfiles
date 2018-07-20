# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_k8s_cluster() {
    kubectl config current-context 2> /dev/null | sed -e 's/\(.*\)\..*\..*$/\[\1\]/'
}

export PS1="\w \[\033[01;34m\]$(parse_k8s_cluster)\[\033[01;31m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

source $HOME/.aliases

