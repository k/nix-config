alias ilabs='ssh kmb394@man.cs.rutgers.edu'
alias ls='ls -hF --color=tty'
alias ll='ls -alrth'
alias la='ls -a'
alias grep='grep --color'

if [[ $OSTYPE == "darwin"* ]]
then
    alias ctags="`brew --prefix`/bin/ctags"
    alias ls='ls -G'
fi
