export TERM='tmux-256color'

# remove docker untagged images
alias docker_rui='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
#
# remove stopped docker containers
alias docker_rsc='docker rm $(docker ps -a -q)'

# aliases
alias pubkey='cat ~/.ssh/id_git.pub'
alias pkey='cat ~/.ssh/id_git'
alias whatismyip='dig +short myip.opendns.com @resolver1.opendns.com'


function queen() {
     ip=`echo $@ | sed 's/\./-/g'`
     ssh -q root@ec2-$ip.compute-1.amazonaws.com
}

alias worker=queen

function egw() {
     lb=$1
     q=$2
     ssh -o IdentityFile="$HOME/.ssh/verdi-dev" \
         -o StrictHostKeyChecking="no" \
         -o UserKnownHostsFile="/dev/null" \
         -o ProxyCommand="ssh -o IdentityFile='$HOME/.ssh/verdi-dev' -o StrictHostKeyChecking='no' -o UserKnownHostsFile='/dev/null' -W %h:%p root@$q"\
         -q ec2-user@$lb $3
}

## ~/.zlogin
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Initialization for FDK command line tools.Wed Sep  2 13:25:13 2015
FDK_EXE="/home/damoncz/bin/FDK/Tools/linux"
PATH=${PATH}:"/home/damoncz/bin/FDK/Tools/linux"
export PATH
export FDK_EXE

. /home/damoncz/torch/install/bin/torch-activate
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# zstyle ':prezto:module:autosuggestions' color 'yes'

