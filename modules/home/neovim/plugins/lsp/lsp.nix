{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      autoLoad = true;
      servers = {
	nixd = {
	  enable = true;
	};
      };
    };
  };
}

