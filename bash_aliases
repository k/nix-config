alias ilabs='ssh man.cs.rutgers.edu'
alias grep='grep --color'
alias v='nvim'

if [[ $OSTYPE == "darwin"* ]]
then
    alias v='reattach-to-user-namespace -l nvim'
    alias ctags="`brew --prefix`/bin/ctags"
    alias ls='ls -G'
    alias eth-wallet='/Applications/Ethereum\ Wallet.app/Contents/MacOS/Ethereum\ Wallet'
else
    alias ls='ls -hF --color=tty'
fi

alias ll='ls -alrth'
alias la='ls -a'

if [ -n `which docker` ]
then
    alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
    alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
fi

alias aws-login-docker="eval $(aws ecr get-login | sed 's/-e none//')"
alias l5d-admin="kubectl -n linkerd port-forward \$(kubectl -n linkerd get pod -l app=l5d -o jsonpath='{.items[0].metadata.name}') 9990"
alias kube-not-running="watch 'kubectl get po --all-namespaces | grep -v Running'"
alias aot-mongo="mongo mongodb://admin:adsontop@ds129440-a0.mlab.com:29440"
alias chaos-monkey="kubectl get --no-headers po -l app=killer-otter-chaoskube | awk '{ print \$1 }' | xargs kubectl logs"

alias grep-tag="grep -o -e '[0-9]\.[0-9]\.[0-9]\.\([0-9]+[a-zA-Z0-9]*\)*'"
alias copy-tag="grep-tag | awk 'NR==1' | pbcopy"
