if [ -f  ~/.bashrc ]; then
    source ~/.bashrc
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias sockstoggle="networksetup -setsocksfirewallproxystate Wi-Fi \`if [ \\`networksetup -getsocksfirewallproxy Wi-Fi | awk '{ print $2 }' | head -1\\` == 'Yes' ]; then echo 'off'; else echo 'on'; fi\`"

export PATH="$HOME/.cargo/bin:$PATH"
