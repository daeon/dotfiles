export TERM='xterm-256color'

# remove docker untagged images
alias docker_rui='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
#
# remove stopped docker containers
alias docker_rsc='docker rm $(docker ps -a -q)'

# aliases
alias pubkey='cat ~/.ssh/id_git.pub'
alias pkey='cat ~/.ssh/id_git'
alias whatismyip='dig +short myip.opendns.com @resolver1.opendns.com'

