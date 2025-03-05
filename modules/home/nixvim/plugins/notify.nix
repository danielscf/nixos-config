{
  programs.nixvim.plugins.notify = {
    enable = true;
    settings = {
      level = "warn";
      render = "compact";
      stages = "fade";
      top_down = false;
    };
  };
}
