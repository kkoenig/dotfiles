{ pkgs, ... }: {
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    nixpkgs-fmt
    btop
    bashInteractive

    # build tools
    bazelisk
    ninja

    # cli utilities
    bat
    eza
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
    VISUAL = "nvim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };

  # todo
  # -alacritty
  # -aria2

  # tap "homebrew/cask-fonts"
  # brew "fzf"
  # brew "git"
  # brew "go"
  # brew "lastpass-cli"
  # brew "llvm"
  # brew "neovim"
  # brew "nvm"
  # brew "pkg-config"
  # brew "tmux"
  # cask "alacritty"
  # cask "dropbox"
  # cask "font-fira-code-nerd-font"
  # cask "google-chrome"
  # cask "texifier"
}
