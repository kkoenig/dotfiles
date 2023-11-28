{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      dracula-nvim
      lualine-nvim
      fzf-lua
    ];
    extraLuaConfig = /* lua */ ''
      vim.o.termguicolors = true
      vim.cmd('colorscheme dracula')

      vim.o.expandtab = true
      vim.o.number = true

      require('lualine').setup()
      require("fzf-lua").setup({ 
        "fzf-vim",
        winopts = { border = "none" }
      })
      vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
    '';
  };
}
