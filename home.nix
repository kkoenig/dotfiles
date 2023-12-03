{ pkgs, ... }:
let
  xcrun-disable-prompt = pkgs.writeScriptBin "xcrun" ''
    exit 1
  '';
  scripts = [
    xcrun-disable-prompt
  ];
in
{
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    bashInteractive
    gh
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

    lua-language-server
    clang-tools

    clang
    llvm
    libcxx
    libcxxabi

    # build tools
    bazelisk
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
  ] ++ scripts;

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  programs.man = {
    enable = true;
    generateCaches = true;
  };

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
  # cask "dropbox"
  # cask "google-chrome"
  # cask "texifier"
}
