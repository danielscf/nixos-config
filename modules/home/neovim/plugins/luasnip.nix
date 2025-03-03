{helpers, ...}: {
  programs.nixvim = {
    plugins.luasnip = {
      enable = true;
      filetypeExtend = {
        typescript = ["tsdoc"];
        javascript = ["jsdoc"];
        lua = ["luadoc"];
        python = ["pydoc"];
        rust = ["rustdoc"];
        java = ["javadoc"];
        c = ["cdoc"];
        cpp = ["cppdoc"];
        php = ["phpdoc"];
        kotlin = ["kdoc"];
        ruby = ["rdoc"];
        sh = ["shelldoc"];
      };

      settings = {
      };
    };
  };
  keymaps = [
    {
      key = "<Tab>";
      action = helpers.mkRaw ''
        require("luasnip").expand_or_jump()
      '';
      mode = ["i"];
      options.silent = true;
    }
    {
      key = "<Tab>";
      action = helpers.mkRaw ''
        require("luasnip").jump(1)
      '';
      mode = ["i" "s"];
      options.silent = true;
    }
    {
      key = "<S-Tab>";
      action = helpers.mkRaw ''
        require("luasnip").jump(-1)
      '';
      mode = ["i" "s"];
      options.silent = true;
    }
    {
      key = "<C-E>";
      action = helpers.mkRaw ''
        require("luasnip").change_choice(1)
      '';
      mode = ["i" "s"];
      options.silent = true;
    }
  ];
}
