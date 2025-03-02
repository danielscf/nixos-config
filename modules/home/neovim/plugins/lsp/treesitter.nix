{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    autoLoad = true;

    nixGrammars = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;

    settings = {
      highlight.enable = true;
      indent.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_decremental = "<C-space>";
          node_incremental = "<bs>";
          scope_incremental = false;
        };
      };
    };
  };
}
