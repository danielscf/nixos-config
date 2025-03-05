{
  programs.nixvim.plugins.which-key = {
    enable = true;

    settings = {
      delay = 500;
      preset = "modern";
      icons.mappings = false;
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "File";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Dap/Db";
        }
        {
          __unkeyed-1 = "<leader>e";
          group = "Editor";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "Language";
        }
        {
          __unkeyed-1 = "<leader>n";
          group = "Notifications";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Search";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Trouble";
        }
      ];
    };
  };
}
