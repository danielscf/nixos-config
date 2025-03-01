{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    # TODO: Switch between setups if main external is detected on startup

    # Main setup
    # monitor = [
      # ",preferred,auto,auto"
      # "$laptop_monitor,disable"
      # "$primary_monitor,1920x1080@165,0x0,1"
      # "$secondary_monitor,1366x768@60,auto-left,1,transform,1"
    # ];

    # On the go setup
    monitor = [
      ",preferred,auto,auto"
      "$laptop_monitor,1920x1080@144,0x0,1"
    ];
  };
}
