{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      exclude.filetypes = [
        "help"
        "checkhealth"
        "lspinfo"
        "TelescopePrompt"
        "TelescopeResults"
        "notify"
      ];

      indent = {
        char = "│";
        tab_char = "│";
      };

      scope = {
        enabled = true;
        show_end = false;
        show_start = false;
        show_exact_scope = true;
      };
    };
  };
}
