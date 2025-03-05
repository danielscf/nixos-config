{
  programs.nixvim = {
    plugins.todo-comments = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>to";
        action = "<cmd>TodoTrouble<cr>";
        mode = [ "n" ];
        options.desc = "Todo-comments: Open todos using trouble";
      }
      {
        key = "<leader>tO";
        action = "<cmd>TodoTelescope<cr>";
        mode = [ "n" ];
        options.desc = "Todo-comments: Open todos using telescope";
      }
    ];
  };
}
