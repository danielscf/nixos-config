{
  programs.nixvim.plugins.markdown-preview = {
    enable = true;
    settings = {
      auto_close = 0;
      browser = "zen"; # TODO: Add default browser variable
      port = "8100";
    };
  };
}
