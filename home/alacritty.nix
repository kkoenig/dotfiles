{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        # We set TERMINFO_DIRS in home manager session vars, but alacritty will run before this is set and set the incorrect default value
        # https://github.com/alacritty/alacritty/blob/5adfc4fb00d1b523bd17bbd73515d30636de0a0e/alacritty_terminal/src/tty/mod.rs#L103
        TERM = "alacritty";
      };
      font = {
        size = 20.0;
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
      shell = {
        program = "${pkgs.bashInteractive}/bin/bash";
        args = [
          "--login"
        ];
      };

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
}
