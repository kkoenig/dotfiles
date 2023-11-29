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

      # Configure lsp
      lsp-zero-nvim
      nvim-lspconfig

      # Autocompletion
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-nvim-lsp
      luasnip

      nvim-treesitter.withAllGrammars
    ];
    extraConfig = /* vimscript */ ''
      set expandtab       " use spaces instead of tabs in insert mode
      set number          " show line numbers
      set shiftwidth=4    " number of spaces to use for each autoindent
      set ignorecase      " ignore case when matching
      set smartcase       " override ignorecase setting if search contains uppercase
      set softtabstop=-1  " use shiftwidth to insert spaces when <TAB> is pressed
      set tabstop=4       " number of spaces that a tab in a file counts for
      set splitright      " open new vertical panes right
      set list listchars=tab:>-\ ,eol:\ ,trail:~,extends:>,precedes:< " display trailing whitespace
      set clipboard+=unnamedplus

      inoremap jj <ESC>
    '';
    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
