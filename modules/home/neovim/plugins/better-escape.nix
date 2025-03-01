{
  programs.nixvim.plugins.better-escape = {
    enable = true;
    autoLoad = true;
    settings.mappings = {
      i.j.j = "<Esc>";
    };
  };
}
