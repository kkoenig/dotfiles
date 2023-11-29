{
  programs.git = {
    enable = true;
    userName = "Killian Koenig";
    userEmail = "killiankoenig@gmail.com";
    delta = {
      enable = true;
      options = {
        side-by-side = true;
        line-numbers = true;
        syntax-theme = "Dracula";
      };
    };
    ignores = [
      ".direnv"
    ];
    extraConfig = {
      diff = {
        tool = "vimdiff";
      };
      difftool = {
        prompt = false;
      };
    };
  };
}
