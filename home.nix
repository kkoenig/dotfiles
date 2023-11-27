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
    defaultOptions = [
      "--margin 5,10%"
    ];
    historyWidgetOptions = [
      "--height 100%"
      "--preview 'echo {}' --preview-window up:3:hidden:wrap"
      "--bind 'ctrl-w:toggle-preview'"
      "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
    ];
    colors = {
      fg = "#f8f8f2";
      bg = "#282a36";
      hl = "#bd93f9";
      "fg+" = "#f8f8f2";
      "bg+" = "#44475a";
      "hl+" = "#bd93f9";
      info = "#ffb86c";
      prompt = "#50fa7b";
      pointer = "#ff79c6";
      marker = "#ff79c6";
      spinner = "#ffb86c";
      header = "#6272a4";
    };
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

      # Dracula theme for Alacritty
      # https://draculatheme.com/alacritty
      colors = {
        primary = {
          background = "#282a36";
          foreground = "#f8f8f2";
          bright_foreground = "#ffffff";
        };
        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };
        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        search = {
          matches = {
            foreground = "#44475a";
            background = "#50fa7b";
          };
          focused_match = {
            foreground = "#44475a";
            background = "#ffb86c";
          };
        };
        footer_bar = {
          background = "#282a36";
          foreground = "#f8f8f2";
        };
        hints = {
          start = {
            foreground = "#282a36";
            background = "#f1fa8c";
          };
          end = {
            foreground = "#f1fa8c";
            background = "#282a36";
          };
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        selection = {
          text = "CellForeground";
          background = "#44475a";
        };
        normal = {
          black = "#21222c";
          red = "#ff5555";
          green = "#50fa7b";
          yellow = "#f1fa8c";
          blue = "#bd93f9";
          magenta = "#ff79c6";
          cyan = "#8be9fd";
          white = "#f8f8f2";
        };
        bright = {
          black = "#6272a4";
          red = "#ff6e6e";
          green = "#69ff94";
          yellow = "#ffffa5";
          blue = "#d6acff";
          magenta = "#ff92df";
          cyan = "#a4ffff";
          white = "#ffffff";
        };
      };
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
