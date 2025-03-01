{pkgs, ... }:

{
  programs.nixvim.plugins.treesiter = {
    enable = true;
    autoLoad = true;
    folding = true;

    nixGrammar = true;
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
