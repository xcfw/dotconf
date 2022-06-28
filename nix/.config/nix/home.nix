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

      # installs different langauge servers for neovim-lsp
      # have a look on the link below to figure out the ones for your languages
      # https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
      nodePackages.typescript nodePackages.typescript-language-server
      gopls
      nodePackages.pyright
      rust-analyzer
    ];
    plugins = with pkgs.vimPlugins; [
      # you can use plugins from the pkgs
      sqlite-lua
      vim-which-key
      telescope-frecency-nvim

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
    luajit
    luajitPackages.lua
    luajitPackages.luv
    luajitPackages.luarocks-nix
    luajitPackages.luasql-sqlite3
    luajitPackages.plenary-nvim
    cmake
    aspell
    sqlite
    stow
    tree-sitter
    redli
    mosh
    yarn
    fasd
    gnused
    gnugrep
    gpgme
    gawk
    cmake
    python2
    python3
    mkcert
    nss

    # Dev stuff
    # (agda.withPackages (p: [ p.standard-library ]))
    google-cloud-sdk
    /* (google-cloud-sdk.withPackages (p: [ p.gke-gcloud-auth-plugin ])) */

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
    nodePackages.node2nix
    cargo

  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

  # Misc configuration files --------------------------------------------------------------------{{{

  # https://docs.haskellstack.org/en/stable/yaml_configuration/#non-project-specific-config
#  home.file.".stack/config.yaml".text = lib.generators.toYAML {} {
#    templates = {
#      scm-init = "git";
#      params = {
#        author-name = "Your Name"; # config.programs.git.userName;
#        author-email = "youremail@example.com"; # config.programs.git.userEmail;
#        github-username = "yourusername";
#      };
#    };
#    nix.enable = true;
#  };

}
