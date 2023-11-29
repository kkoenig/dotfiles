{ pkgs, ... }: {
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    bashInteractive
    gh
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

    lua-language-server

    # build tools
    bazelisk
    llvm
    clang
    gnumake
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = false;
    enableFishIntegration = false;
    enableNushellIntegration = false;
    nix-direnv.enable = true;
  };

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
    MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
    MANROFFOPT = "-c";
    SHELL = "${pkgs.bashInteractive}/bin/bash";
    TERMINFO_DIRS = "${pkgs.alacritty.terminfo.outPath}/share/terminfo";
  };

  # todo
  # brew "lastpass-cli"
  # brew "tmux"
  # cask "dropbox"
  # cask "google-chrome"
  # cask "texifier"
}
