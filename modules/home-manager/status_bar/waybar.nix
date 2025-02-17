{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 55;

        modules-left = [ 
          "hyprland/workspaces"
          "mpris"
          "tray" 
        ];
        modules-center = [ ];
        modules-right = [ 
          "bluetooth"
          "privacy"
          "wireplumber"
          "clock"
          "network"
          "hyprland/language"
          "battery"
          # "custom/power"
        ];

      }
    ];
  };
}