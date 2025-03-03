{
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      ui.enable = false;
      workspaces = [
        {
          name = "buf-parent";
          path = ''
            function()
               return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
             end,
          '';
        }
      ];
      mappings = {
        gf = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            buffer = true;
            expr = true;
            noremap = false;
          };
        };
      };
    };
  };
}
