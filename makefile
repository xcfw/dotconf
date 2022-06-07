wsl:
	stow -t ~ alacritty/ bpytop/ git/ kitty/ nvim/ tmux/ vifm/ zsh/ firefox/ lf/

mac:
	stow alacritty/ bpytop/ kitty/ nvim/ tmux/ vifm/ zsh/ lf/

SHELL := /bin/zsh
install:
	cd && git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
	cd && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	cd && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	stow bpytop/ kitty/ nvim/ vifm/ zsh/ lf/
