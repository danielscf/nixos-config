{
  programs.nixvim.plugins.better-escape = {
    enable = true;

    settings.mappings = {
      i.j.j = "<Esc>";
    };
  };
}
