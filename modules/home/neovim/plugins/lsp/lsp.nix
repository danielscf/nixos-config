{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      capabilities = ''
        capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
      '';

      servers = {
        nixd.enable = true;
        lua_ls.enable = true;
      };
    };
  };
}
