{
  programs.nixvim = {
    plugins.fugitive = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>vertical Git<cr>";
        mode = ["n"];
      }
      {
        key = "<leader>gl";
        action = "<cmd>vertical Git log<cr>";
        mode = ["n"];
      }
      {
        key = "<leader>gp";
        action = "<cmd>Git push<cr>";
        mode = ["n"];
      }
      {
        key = "<leader>ga";
        action = "<cmd>Gwrite<cr>";
        mode = ["n"];
      }
      {
        key = "<leader>gu";
        action = "<cmd>Gread<cr>";
        mode = ["n"];
      }
    ];
  };
}
