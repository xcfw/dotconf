# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#nanotech,
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="nanotech"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
Plugins=(
  asdf
  docker
  make
  fzf
  gcloud
  git
  kubectl
  npm
  tmux
  yarn
  zsh-fzf-history-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# source $HOME/.asdf/asdf.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# source <(kubectl completion zsh)

# universal aliases
alias tu='tmux -2'
alias op=~/dev/powr
alias sz='source ~/.zshrc'
alias l='ls -lahtr --color'
alias lss='ls -lahSr --color'
alias v='nvim'
#alias vim='nvim'
alias vz="nvim ~/.zshrc && source ~/.zshrc"
alias vvs="nvim ~/.config/nvim/init.lua"
alias dc="docker-compose"
alias dcb="dc build"
alias dcup="dc up --remove-orphans"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias cl="clear"
alias fgif="ffmpeg -y -filter_complex 'fps=12,scale=512:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=32[p];[s1][p]paletteuse=dither=bayer' -i"
alias c="batcat"
alias tt="bpytop"

# wslpaths
alias wslshutdown="wsl.exe --terminate $WSL_DISTRO_NAME"
alias cdd="cd /mnt/c/Users/chill/Downloads"

# universal paths
alias vdd="v ~/dev/docs/docs/new.md"
alias cdp="cd ~/dev/powr"
alias cdn="cd ~/dev/next/"
alias cdt="cd ~/tools"
alias cdv="cd ~/dev/docs"
alias cdc="cd ~/.dotconf/"
alias cdn="cd ~/.config/nix"

# mcd is mkdir and cd in one
mcd(){
    mkdir -p "$1"
    cd "$1"
}

# projects folder shortcut
d(){ cd ~/dev/"$@"; }
t(){ cd ~/tools/"$@"; }

# yarn paths
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#new gke auth
USE_GKE_GCLOUD_AUTH_PLUGIN=True
alias duu='du -h -d 1 .'

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/ranger/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ranger/dev/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/ranger/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ranger/dev/google-cloud-sdk/completion.zsh.inc'; fi

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
eval "$(direnv hook zsh)"
