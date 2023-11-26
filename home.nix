{ pkgs, ... }: {
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    nixpkgs-fmt
    btop
    bash

    # cli utilities
    bat
    bazelisk
    curl
    fd
    jq
    ripgrep
    scc
    wget
  ];
  programs.home-manager.enable = true;

  # tap "homebrew/bundle"
  # tap "homebrew/cask"
  # tap "homebrew/cask-fonts"
  # tap "homebrew/core"
  # brew "exa"
  # brew "fish"
  # brew "fzf"
  # brew "git"
  # brew "go"
  # brew "lastpass-cli"
  # brew "llvm"
  # brew "neovim"
  # brew "ninja"
  # brew "nvm"
  # brew "pkg-config"
  # brew "raylib"
  # brew "tmux"
  # cask "alacritty"
  # cask "dropbox"
  # cask "font-fira-code-nerd-font"
  # cask "google-chrome"
  # cask "texifier"
}
