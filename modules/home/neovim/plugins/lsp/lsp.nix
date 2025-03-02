{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      autoLoad = true;

      capabilities = ''
	capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)	
      '';

      servers = {
	nixd = {
	  enable = true;
	};
      };
    };
  };
}

