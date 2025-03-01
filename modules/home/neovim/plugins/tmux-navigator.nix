{
  programs.nixvim.plugins.tmux-navigator = {
    enable = true;
    autoLoad = true;
    keymaps = [
      {
	action = "left";
	key = "<C-h>";
	mode = ["n"];
      }
      {
	action = "down";
	key = "<C-j>";
	mode = ["n"];
      }
      {
	action = "up";
	key = "<C-k>";
	mode = ["n"];
      }
      {
	action = "right";
	key = "<C-l>";
	mode = ["n"];
      }
    ];
  };
}
