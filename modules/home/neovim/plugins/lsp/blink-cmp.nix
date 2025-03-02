{
  # TODO: Add cargo pkg dependency option
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    autoLoad = true;
    
    settings = {
      completion = {
	documentation = {
	  auto_show = true;
	};
      };
      fuzzy.implementation = "prefer_rust";
      signature.enabled = true;
    };
  };
}
