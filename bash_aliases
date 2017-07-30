alias ilabs='ssh man.cs.rutgers.edu'
alias grep='grep --color'
alias v='nvim'

if [[ $OSTYPE == "darwin"* ]]
then
    alias v='reattach-to-user-namespace -l nvim'
    alias ctags="`brew --prefix`/bin/ctags"
    alias ls='ls -G'
else
    alias ls='ls -hF --color=tty'
fi

alias ll='ls -alrth'
alias la='ls -a'

if [ -n `ls ~/.agignore` ]
then
    alias ag='ag --path-to-ignore ~/.agignore'
fi

if [ -n `which docker` ]
then
    alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
    alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
fi
