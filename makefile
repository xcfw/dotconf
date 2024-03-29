wsl:
	stow -t ~ bpytop/ git/ nvim/ tmux/ vifm/ zsh/ lf/

mac:
	stow bpytop/ kitty/ nvim/ vifm/ zsh/ lf/ nix/

SHELL := /bin/zsh
install:
	git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	stow bpytop/ kitty/ nvim/ vifm/ zsh/ lf/ nix/
	#nix build .#darwinConfigurations.Macas-Macbook-Air.system
	#cd ~/.config/nix/; sudo ./result/bin/sw/darwin-rebuild switch --flake .
