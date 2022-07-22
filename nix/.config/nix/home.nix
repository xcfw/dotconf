{ config, pkgs, lib, ... }:

{
  home.stateVersion = "22.11";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  /* xdg.configFile."nvim/init.lua".source = ~/.config/nvim/init.lua; */
  /* xdg.configFile."nvim/init.vim".source = ~/.config/nvim/init.vim; */
  programs.neovim = {
    enable = true;

    # read in the vim config from filesystem
    # this enables syntaxhighlighting when editing those
    # config = "let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.dylib'";
     extraConfig = builtins.concatStringsSep "\n" [
      #(lib.strings.fileContents ./base.vim)
      #(lib.strings.fileContents ./plugins.vim)
      #(lib.strings.fileContents ./lsp.vim)

      # this allows you to add lua config files
      ''
        lua << EOF
        let g:sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.dylib'
        EOF
      ''
    ];

    # install needed binaries here
    extraPackages = with pkgs; [
      # used to compile tree-sitter grammar
      tree-sitter
      luajit
      luajitPackages.lua
      luajitPackages.luv
      luajitPackages.luarocks-nix
      luajitPackages.luasql-sqlite3
      luajitPackages.plenary-nvim
      sqlite
      tree-sitter
      aspell

      # installs different langauge servers for neovim-lsp
      # have a look on the link below to figure out the ones for your languages
      # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
      /* nodePackages.typescript nodePackages.typescript-language-server */
      gopls
      /* nodePackages.pyright */
      rust-analyzer
    ];
    plugins = with pkgs.vimPlugins; [
      # you can use plugins from the pkgs
      sqlite-lua
      vim-which-key
      telescope-frecency-nvim
      vim-tmux-navigator
      vim-tmux-focus-events
      vim-tmux-clipboard

      # or you can use our function to directly fetch plugins from git
      /* (plugin "neovim/nvim-lspconfig") */
      /* (plugin "hrsh7th/nvim-compe") # completion */

      # this installs the plugin from 'lua' branch
      # (pluginGit "lua" "lukas-reineke/indent-blankline.nvim")

      # syntax highlighting
      # (plugin "nvim-treesitter/nvim-treesitter")
      # (plugin "p00f/nvim-ts-rainbow") # bracket highlighting
    ];
  };

  programs.tmux.enable = true;
  programs.alacritty.enable = true;

  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.packages = with pkgs; [
    # Some basics
    coreutils
    curl
    wget
    vifm
    fzf
    bat
    tree
    ripgrep-all
    ripgrep
    bpytop
    cmake
    stow
    redli
    mosh
    yarn
    fasd
    gnused
    gnugrep
    gpgme
    gawk
    python2
    python3
    mkcert
    nss
    asdf-vm
    inetutils
    shared-mime-info

    # Dev stuff
    /* (agda.withPackages (p: [ p.standard-library ])) */
    google-cloud-sdk
    /* (google-cloud-sdk.withPackages (p: [ p.gke-gcloud-auth-plugin ])) */

    #projects deps
    heroku
    fd
    jq
    nodePackages.typescript
    nodejs
    purescript
    shared-mime-info
    postgresql.lib
    pgcli
    imagemagick6

# Useful nix related tools
    cachix # adding/managing alternative binary caches hosted by Cachix
    # comma # run software from without installing it
    niv # easy dependency management for nix projects
    /* nodePackages.node2nix */
    cargo

  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

}
