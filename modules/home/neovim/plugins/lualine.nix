{
  programs.nixvim.plugins.lualine = {
    enable = true;

    luaConfig.post = builtins.readFile ./themes/lualine-base16.lua;

    settings = {
      options = {
        globalstatus = true;
        always_show_tabline = false;
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = {
          statusline = [
            "help"
            "lazy"
            "trouble"
          ];
          tabline = [
            "help"
            "lazy"
            "trouble"
          ];
          winbar = [
            "help"
            "lazy"
            "trouble"
          ];
        };
        ignore_focus = [
          "help"
          "lazy"
          "trouble"
        ];
      };

      tabline = {
        lualine_z = [ "tabs" ];
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "filetype";
            colored = true;
            icon_only = true;
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
            symbols = {
              modified = "●";
              readonly = "";
              unnamed = "[No Name]";
              newfile = "[New]";
            };
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "diagnostics";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
            };
          }
        ];
        lualine_c = [ "" ];
        lualine_x = [ "searchcount" ];
        lualine_y = [
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
          "branch"
        ];
        lualine_z = [ "mode" ];
      };
    };
  };
}
