{
  programs.nixvim = {
    plugins.oil = {
      enable = true;

      settings = {
        delete_to_trash = true;
        default_file_explorer = true;
        skip_confirm_for_simple_edits = true;
        use_default_keymaps = true;
        keymaps = {
          "<C-l>" = false;
          "<C-h>" = false;
        };
      };
    };

    keymaps = [
      {
        key = "-";
        action = "<cmd>Oil<cr>";
        mode = ["n"];
      }
    ];
  };
}
