{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = false;
    enableZshIntegration = false;
    defaultOptions = [
      "--margin 4,8%"
      "--height 100%"
    ];
    historyWidgetOptions = [
      "--height 100%"
      "--preview 'echo {}' --preview-window up:3:hidden:wrap"
      "--bind 'ctrl-w:toggle-preview'"
      "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
      "--info=hidden"
      "--no-scrollbar"
    ];
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type f --strip-cwd-prefix";
    fileWidgetOptions = [
      "--preview '${pkgs.bat}/bin/bat --style=changes --color=always {}'"
      "--bind 'ctrl-w:change-preview-window(down|hidden|)'"
      "--preview-window border-sharp"
      "--layout default"
      "--info hidden"
      "--no-scrollbar"
    ];
  };
}

