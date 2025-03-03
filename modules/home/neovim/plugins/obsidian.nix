{
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      ui.enable = false;
      workspaces = [
        {
          name = "work";
          path = "~/notes";
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
