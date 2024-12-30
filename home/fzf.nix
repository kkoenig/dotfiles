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
    colors = {
      fg = "#cdd6f4";
      bg = "#1e1e2e";
      hl = "#f38ba8";
      "fg+" = "#cdd6f4";
      "bg+" = "#313244";
      "hl+" = "#f38ba8";
      info = "#cba6f7";
      prompt = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#b4befe";
      spinner = "#f5e0dc";
      header = "#f38ba8";
      selected-bg = "#45475a";
    };
  };
}

