{
  programs.nixvim.plugins.mini = {
    enable = true;

    luaConfig.pre = ''
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.indentscope").setup()
    '';
  };
}
