{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = true;
    vimAlias = true;
    clipboard.register = "unnamedplus";

    withNodeJs = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;
    
    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    plugins = {
      auto-session = {
	enable = true;
	autoLoad = true;
	lazyLoad.enable = false;
      };

      neoscroll = {
        enable = true;
	autoLoad = true;
      };

      tmux-navigator = {
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

      which-key = {
	enable = true;
	autoLoad = true;
	lazyLoad.enable = false;
	settings = {
	  delay = 500;
	  preset = "classic";
	};
      };

      oil = {
	enable = true;
	autoLoad = false;
	settings = {
	  delete_to_trash = true;
	  default_file_explorer = true;
	  skip_confirm_for_simple_edits = true;
	};
      };

      nvim-surround.enable = true;
      vim-be-good.enable = true;
    };

    keymaps = [
      {
        key = ";";
	action = ":";
      }
    ];
  };
}
