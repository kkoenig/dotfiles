{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    #extraConfig =
    # "set-option -g terminal-overrides \",alacritty:RGB\""
    #;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set-option -g @dracula-plugins " "
          set-option -g @dracula-show-powerline true
          set-option -g @dracula-show-flags false
          set -g @dracula-show-left-icon session
        '';
      }
    ];
  };
}
