
fish_vi_key_bindings

alias v nvim
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin
set -g fish_user_paths "/usr/local/opt/node@8/bin" $fish_user_paths
set -gx KUBECONFIG $HOME/.kube/config
set -gx KUBECONFIG $KUBECONFIG:$HOME/.kube/aot_config
