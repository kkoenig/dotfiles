{ pkgs, ... }: {
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    nixpkgs-fmt
    btop
    bashInteractive

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

  programs.bat = {
    enable = true;
    config = {
      map-syntax = [
        "flake.lock:JSON"
      ];
      theme = "Dracula";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = false; # work around an issue with this temporarily
    historyControl = [ "erasedups" ];
  };

  home.sessionVariables = {
    VISUAL = "nvim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };

  # todo
  # -alacritty
  # -aria2

  # tap "homebrew/cask-fonts"
  # brew "exa"
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
