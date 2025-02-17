{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetbrainsMono NF";
    font.size = "18";
    shellIntegration = {
      enableBashIntegration = true;
    };
    keybindings = {

    };
    settings = {
      confirm_os_window_close = 0;
      disable_ligatures = "always";
    };
  };
}