{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./rofi-theme.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    location = "center";
    font = lib.mkForce "JetbrainsMono NF 12";

    # TODO: Set default terminal and use variable
    terminal = "ghostty";

    plugins = with pkgs; [
      rofi-top
      rofi-mpd
      rofi-calc
      rofi-systemd
      rofi-bluetooth
      rofi-power-menu
      rofi-screenshot
      rofi-emoji-wayland
    ];

    # extraConfig = {
    # };
  };
}
