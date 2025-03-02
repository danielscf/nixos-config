{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    saveOnChange = true;
    keymaps = {
      addFile = "<leader>m";
      toggleQuickMenu = "<leader>sh";
      navFile = {
	"1" = "<A-1>";
	"2" = "<A-2>";
	"3" = "<A-3>";
	"4" = "<A-4>";
	"5" = "<A-5>";
	"6" = "<A-6>";
      };
    };
  };
}
