alias ilabs='ssh man.cs.rutgers.edu'
alias ls='ls -hF --color=tty'
alias ll='ls -alrth'
alias la='ls -a'
alias grep='grep --color'
alias v='nvim'

if [[ $OSTYPE == "darwin"* ]]
then
    alias v='reattach-to-user-namespace -l nvim'
    alias ctags="`brew --prefix`/bin/ctags"
    alias ls='ls -G'
fi
