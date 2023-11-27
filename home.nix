{ pkgs, ... }: {
  home.username = "kkoenig";
  home.homeDirectory = "/Users/kkoenig";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    nixpkgs-fmt
    btop
    bashInteractive
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

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

  programs.bash = {
    enable = true;
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

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = false;
    enableZshIntegration = false;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 22.0;
        normal = {
          style = "Medium";
          family = "FiraCode Nerd Font";
        };
        bold = {
          style = "Bold";
          family = "FiraCode Nerd Font";
        };
        italic = {
          style = "Italic";
          family = "FiraCode Nerd Font";
        };
      };
      program = "${pkgs.bashInteractive}/bin/bash";
      args = [
        "--login"
      ];
    };
  };

  home.sessionVariables = {
    VISUAL = "nvim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
    SHELL = "${pkgs.bashInteractive}/bin/bash";
  };

  # todo
  # -aria2

  # tap "homebrew/cask-fonts"
  # brew "git"
  # brew "go"
  # brew "lastpass-cli"
  # brew "llvm"
  # brew "neovim"
  # brew "nvm"
  # brew "pkg-config"
  # brew "tmux"
  # cask "dropbox"
  # cask "google-chrome"
  # cask "texifier"
}
