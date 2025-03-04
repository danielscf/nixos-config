{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>td";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        mode = [ "n" ];
        options.desc = "Trouble: Buffer diagnostics";
      }
      {
        key = "<leader>tw";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        mode = [ "n" ];
        options.desc = "Trouble: Workspace diagnostics";
      }
      {
        key = "<leader>tq";
        action = "<cmd>Trouble diagnostics quickfix<cr>";
        mode = [ "n" ];
        options.desc = "Trouble: Quickfix list";
      }
      {
        key = "<leader>tl";
        action = "<cmd>Trouble loclist toggle<cr>";
        mode = [ "n" ];
        options.desc = "Trouble: Location list";
      }
    ];
  };
}
