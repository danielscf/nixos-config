{
  programs.nixvim = {
    plugins.vim-be-good = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>ep";
        action = "<cmd>VimBeGood<cr>";
        mode = [ "n" ];
        options.desc = "Vim-be-good: Practice motions";
      }
    ];
  };
}
