{
  programs.nixvim = {
    plugins.noice = {
      enable = true;
      settings = {
        presets = {
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = false;
        };

        routes = [
          {
            filter = {
              event = "msg_show";
              kind = "";
              find = "written";
            };
            opts.skip = true;
          }
        ];
      };
    };

    keymaps = [
      {
        key = "<leader>nd";
        action = "<cmd>Noice dismiss<cr>";
        mode = [ "n" ];
        options.desc = "Noice: Dismiss notifications";
      }
      {
        key = "<leader>nl";
        action = "<cmd>Noice last<cr>";
        mode = [ "n" ];
        options.desc = "Noice: Last notification";
      }
      {
        key = "<leader>nd";
        action = "<cmd>Noice errors<cr>";
        mode = [ "n" ];
        options.desc = "Noice: Error notifications";
      }
    ];
  };
}
