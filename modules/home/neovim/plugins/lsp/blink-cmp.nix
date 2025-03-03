{
  # TODO: Add cargo pkg dependency option
  programs.nixvim.plugins.blink-cmp = {
    enable = true;

    settings = {
      completion = {
        documentation = {
          auto_show = true;
        };
      };
      # fuzzy.implementation = "prefer_rust";
      signature.enable = true;

      sources = {
        default = ["lsp" "buffer" "snippets" "path"];
        per_filetype = {
          sql = ["snippets" "buffer" "dadbod"];
        };
        providers = {
          dadbod = {
            name = "Dadbod";
            module = "vim_dadbod_completion.blink";
          };
        };
      };
    };
  };
}
