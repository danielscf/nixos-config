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
      splitbelow = true;
      splitright = true;
    };

    opts = {
      termguicolors = true;

      number = true;
      relativenumber = true;
      shiftwidth = 2;
      smartindent = true;
      fillchars.eob = " ";

      ignorecase = true;
      smartcase = true;

      spell = true;
      spelllang = "en_us";

      mouse = "a";

      undofile = true;

      sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
    };

    plugins = {
      auto-session = {
	enable = true;
	autoLoad = true;
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
	settings = {
	  delay = 500;
	  preset = "classic";
	};
      };

      oil = {
	enable = true;
	autoLoad = true;
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
