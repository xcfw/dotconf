# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#export adb path
export PATH=$HOME/tools/platform-tools/:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  aws
  terraform
  minikube
  fzf
	git
  heroku
  docker
	asdf
	fasd
	gcloud
	kubectl
  nomad
	helm
	tmux
  brew
  yarn
)

ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
alias vz="nvim ~/.zshrc; source ~/.zshrc"
alias vim="nvim"
alias cdp="cd ~/dev/powr"
alias cdt="cd ~/tools"
alias cdd="cd ~/Downloads"
alias cdc="cd ~/.config/"
alias c="bat"
alias mk="minikube kubectl --"
alias la="ls -lahtr"

alias curltestp='cd /Users/xcfw/dev/; echo ":::random:::"; for i in $(seq 1 200); do sleep 1;
echo "..."; curl -w "@fspeedcurl.txt" -s "https://www.powr.io/commit-sha.html"
done;'
alias curltests='cd /Users/xcfw/dev/; echo ":::random:::"; for i in $(seq 1 200); do sleep 1;
echo "..."; curl -w "@fspeedcurl.txt" -s "https://www.powr-staging.io/commit-sha.html"
done;'
# K8S aliases
alias gkes="gcloud container clusters get-credentials staging --region us-east1 --project powr-staging; kubectl config set-context --current --namespace=staging"
alias gkep="gcloud container clusters get-credentials main --region us-east1 --project powr-prod; kubectl config set-context --current --namespace=main"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
