{
  programs.nixvim.plugins.mini = {
    enable = true;

    # TODO: Indent scope removed animation
    luaConfig.post = ''
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.indentscope").setup()
    '';
  };
}
