## Why?

Modern Vim distributions are really huge and bloated with way too many fancy
features that you won't ever use or need, for example directory trees like Nerd
tree, you don't need a tree, you can view a project structure with fzf which is
faster and has search. Another example is
[ThinkVim](https://github.com/hardcoreplayers/ThinkVim) has a separate extension
for formatting while also having ALE which can do that as well, this double
functionality is very common, thats one of the things this distro avoids, KISS!

## Features

- Single file (you don't want your dotfiles to be all Vim script)
- Super minimal (~400 lines)
- Super fast startup (less than 40ms!)
- Lazy loading plugins
- Highly customizable
- Beautiful [Material ocean](https://github.com/material-ocean/Material-Ocean)
  color scheme
- Various IDE features via [coc.nvim](https://github.com/neoclide/coc.nvim)
- Smooth Scrolling (its really smooth!)
- Fully integrated with fzf (see [demos](#demos))
- Live Markdown preview
- Simple, Intuitive shortcuts

## Requirements

- Linux (not tested on other platforms)
- Neovim (you can try regular Vim)
- Properly set up environment

## Setup

To check if your current environment is correctly set up run `:CheckHealth`.

### Environment

- python3: `pip3 install --user pynvim`
- javascript: `yarn global add neovim`

### Tools

- [Any patched nerd font](https://github.com/ryanoasis/nerd-fonts/)
- [tmux](https://github.com/tmux/tmux) (not required but recommended)
- [prettier](https://prettier.io/)
- clang (much better C and C++)
- [fuzzy finder (fzf)](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)
- [black](https://black.readthedocs.io/en/latest/) for python formatting

