if [ -f  ~/.bashrc ]; then
    source ~/.bashrc
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH="/usr/local/apache-maven-3.5.0/bin:$PATH"

export PATH="$HOME/.fastlane/bin:$PATH"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias sockstoggle="networksetup -setsocksfirewallproxystate Wi-Fi \`if [ \\`networksetup -getsocksfirewallproxy Wi-Fi | awk '{ print $2 }' | head -1\\` == 'Yes' ]; then echo 'off'; else echo 'on'; fi\`"
