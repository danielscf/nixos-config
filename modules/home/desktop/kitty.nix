{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      # name = lib.mkForce "JetbrainsMono NF";
      size = 18;
    };

    settings = {
      confirm_os_window_close = 0;
      disable_ligatures = "always";
      window_padding_width = "8 10";
      clear_all_shortcuts = "yes";
    };

    shellIntegration = {
      enableBashIntegration = true;
    };

  };
}
