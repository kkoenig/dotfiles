{ pkgs, ... }: {
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    bashInteractive
    neovim
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

    # build tools
    bazelisk
    clang
    git
    go
    ninja

    # cli utilities
    bat
    btop
    curl
    eza
    fd
    jq
    nixpkgs-fmt
    ripgrep
    scc
    tree
    wget
  ];

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  programs.bat = {
    enable = true;
    config = {
      map-syntax = [
        "flake.lock:JSON"
      ];
      theme = "Dracula";
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
    };
  };

  # todo: get working on osx
  # programs.dircolors.enable = true;

  programs.eza = {
    enable = true;
    enableAliases = true;
  };

  home.sessionVariables = {
    VISUAL = "${pkgs.neovim}/bin/nvim";
    MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
    MANROFFOPT = "-c";
    SHELL = "${pkgs.bashInteractive}/bin/bash";
  };

  # todo
  # brew "lastpass-cli"
  # brew "tmux"
  # cask "dropbox"
  # cask "google-chrome"
  # cask "texifier"
}
