{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    enableBashIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {
        sort_by = "extension";
        sort_dir_first = false;
        sort_sensitive = true;
        sort_reverse = true;
        show_hidden = true;
        show_symlink = true;
      };
    };

    # plugins = 
    # initLua = 
    # keymap = 
    
  };
}