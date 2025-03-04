{
  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;
      settings.telescope_borders = true;
    };

    clipboard.register = "unnamedplus";

    withNodeJs = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;

    globals = {
      mapleader = " ";
      splitbelow = true;
      splitright = true;
    };

    opts = {
      termguicolors = true;

      number = true;
      relativenumber = true;
      shiftwidth = 2;
      smartindent = true;
      fillchars.eob = " ";

      autoindent = true;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;

      ignorecase = true;
      smartcase = true;

      spell = true;
      spelllang = "en_us";

      mouse = "a";

      undofile = true;

      sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
    };
  };
}
