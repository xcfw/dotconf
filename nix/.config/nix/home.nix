{ config, pkgs, lib, ... }:

{
  home.stateVersion = "22.05";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.neovim.enable = true;
  /* xdg.configFile."nvim/lua".source = mkOutOfStoreSymlink "${nixConfigDirectory}/configs/nvim/lua";
  xdg.configFile."nvim/colors".source = mkOutOfStoreSymlink "${nixConfigDirectory}/configs/nvim/colors"; */
  programs.neovim.extraConfig = "lua require('init')";

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
    ripgrep
    bpytop
    cmake
    lua
    luarocks
    sqlite
    stow
    tree-sitter

    # Dev stuff
    # (agda.withPackages (p: [ p.standard-library ]))
    google-cloud-sdk
    heroku
    # haskellPackages.cabal-install
    # haskellPackages.hoogle
    # haskellPackages.hpack
    # haskellPackages.implicit-hie
    # haskellPackages.stack
    # idris2
    jq
    nodePackages.typescript
    nodejs
    purescript

    # Useful nix related tools
    cachix # adding/managing alternative binary caches hosted by Cachix
    # comma # run software from without installing it
    niv # easy dependency management for nix projects
    nodePackages.node2nix

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
