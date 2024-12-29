{ pkgs, config, ... }:
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
  home.stateVersion = "24.11";
  home.packages = [
    pkgs.bashInteractive
    pkgs.gh
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

    # lanaguage servers
    pkgs.zls # zig
    pkgs.zig
    pkgs.lua-language-server
    pkgs.gopls
    pkgs.biome
    pkgs.deno

    # extra documentation (eg. man sprintf)
    # man-pages
    # man-pages-posix

    # build tools
    pkgs.bazelisk
    pkgs.gnumake
    pkgs.git
    pkgs.go
    pkgs.ninja

    # cli utilities
    pkgs.bat
    pkgs.btop
    pkgs.curl
    pkgs.eza
    pkgs.fd
    pkgs.jq
    pkgs.nixpkgs-fmt
    pkgs.ripgrep
    pkgs.scc
    pkgs.tree
    pkgs.wget
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

  programs.eza = {
    enable = true;
  };

  home.file."${config.xdg.configHome}" = {
    source = ./users/kkoenig/config;
    recursive = true;
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
    MANROFFOPT = "-c";
    SHELL = "${pkgs.bashInteractive}/bin/bash";
    TERMINFO_DIRS = "${pkgs.alacritty.terminfo.outPath}/share/terminfo";


    # Disable to avoid the following AddressSanitizer warnings
    # 'malloc: nano zone abandoned due to inability to reserve vm space."
    MallocNanoZone = 0;

    # Set help=1 to see all options
    ASAN_OPTIONS = "print_legend=false,log_path=stdout,color=always,dump_registers=false";
    ASAN_SYMBOLIZER_PATH = "${pkgs.llvm}/bin/llvm-symbolizer";
  };
}
