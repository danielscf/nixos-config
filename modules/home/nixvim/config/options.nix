{
  programs.nixvim = {
    clipboard.register = "unnamedplus";

    withNodeJs = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;

    colorschemes.base16 = {
      enable = true;
      settings.telescope_borders = true;
    };

    globals = {
      splitbelow = true;
      splitright = true;
    };

    opts = {
      mouse = "a";
      laststatus = 3;
      fillchars.eob = " ";
      termguicolors = true;

      number = true;
      shiftwidth = 2;
      undofile = true;
      timeoutlen = 300;
      smartindent = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      autoindent = true;

      ignorecase = true;
      smartcase = true;

      spell = true;
      spelllang = "en_us";

      sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
    };
  };
}
