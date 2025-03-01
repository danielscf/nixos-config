{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    autoLoad = true;
    settings = {
      disable_filetype = [
	"TelescopePrompt"
	"vim"
      ];
      fast_wrap = {
	end_key = "$";
	map = "<M-e>";
      };
    };
  };
}
