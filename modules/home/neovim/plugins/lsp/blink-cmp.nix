{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    autoLoad = true;
    settings = {
      completion = {
	documentation = {
	  auto_show = true;
	};
      };
      signature.enabled = true;
    };
  };
}
