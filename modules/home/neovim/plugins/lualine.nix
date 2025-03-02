{
  programs.nixvim.plugins.lualine = {
    enable = true;
    autoLoad = true;
    settings = {
      extensions = [
	"fugitive" 
	"lazy"
	"nvim-dap-ui"
	"trouble"
      ];
      options = {
        icons_enabled = true;
        theme = "auto";
        component_separators = { 
	  left = "";
	  right = "";
	};
        section_separators = { 
	  left = "";
	  right = "";
	};
        disabled_filetypes = {
          statusline =  [ "help" "lazy" "trouble" ]; 
          tabline =  [ "help" "lazy" "trouble" ]; 
          winbar =  [ "help" "lazy" "trouble" ]; 
        };
	ignore_focus =  [ "help" "lazy" "trouble" ]; 
        always_divide_middle = true;
        globalstatus = true;
        refresh = {
          statusline = 1000;
          tabline = 1000;
          winbar = 1000;
        };
      };
      tabline = {};
      sections = {
        lualine_a = [
          {
            _unkeyed-1 = "filetype";
            colored = true;
            icon_only = true;
            padding = { 
	      left = 1;
	      right = 0;
	    };
            # color = {
            #   fg = require("lualine.themes.lushwal").normal.c.fg;
            #   bg = require("lualine.themes.lushwal").normal.c.bg;
            # };
          }
          {
            _unkeyed-1 = "filename";
            symbols = {
              modified = "●";
              readonly = "";
              unnamed = "[No Name]";
              newfile = "[New]";
            };
            path = 1;
            # color = {
            #   fg = require("lualine.themes.lushwal").normal.c.fg,
            #   bg = require("lualine.themes.lushwal").normal.c.bg,
            # };
          }
        ];
        lualine_b = [
          {
            _unkeyed-1 = "diagnostics";
            # color = {
            #   fg = require("lualine.themes.lushwal").normal.c.fg,
            #   bg = require("lualine.themes.lushwal").normal.c.bg,
            # },
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
            };
          }
        ];
        lualine_c = [];
        lualine_x = [
          {
            _unkeyed-1 = "searchcount";
          }
          # {
          #   require("noice").api.statusline.mode.get,
          #   cond = require("noice").api.statusline.mode.has,
          #   color = require("lualine.themes.lushwal").normal.fg,
          # }
	];
        lualine_y = [
          {
            _unkeyed-1 = "diff";
            # color = {
            #   fg = require("lualine.themes.lushwal").normal.c.fg,
            #   bg = require("lualine.themes.lushwal").normal.c.bg,
            # },
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
          {
            _unkeyed-1 = "branch";
            # color = {
            #   fg = require("lualine.themes.lushwal").normal.c.fg,
            #   bg = require("lualine.themes.lushwal").normal.c.bg,
            # },
          }
        ];
        lualine_z = [
          {
            _unkeyed-1 = "mode";
            # color = {
            #   fg = require("lualine.themes.lushwal").normal.c.fg,
            #   bg = require("lualine.themes.lushwal").normal.c.bg,
            # },
          }
        ];
      };
      inactive_sections = {
        lualine_a = {};
        lualine_b = {};
        lualine_c = {};
        lualine_x = {};
        lualine_y = {};
        lualine_z = {};
      };
      winbar = {};
      inactive_winbar = {};
    };
  };
}
