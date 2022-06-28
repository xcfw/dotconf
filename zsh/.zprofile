# eval "$(/opt/homebrew/bin/brew shellenv)"
#\. "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
#\. "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
zstyle ':completion:*:*:make:*' tag-order 'targets'
export TERM=xterm-256color
eval "$(/opt/homebrew/bin/brew shellenv)"
