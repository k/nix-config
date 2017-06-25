if [ -f  ~/.bashrc ]; then
    source ~/.bashrc
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="/usr/local/apache-maven-3.5.0/bin:$PATH"
