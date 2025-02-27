{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,latam";
      kb_options = "grp:win_space_toggle";
      follow_mouse = 1;
      touchpad.natural_scroll = "yes";
      sensitivity = 0;
    };

    general = {
      layout = "hy3";
      gaps_in = 5;
      gaps_out = 30;
      border_size = 0;
      allow_tearing = false;
    };

    decoration = {
      rounding = 10;

      blur = {
        enabled = true;
        size = 8;
        passes = 2;
        new_optimizations = true;
        ignore_opacity = true;
        noise = 0;
        brightness = 1;
      };

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        # color = "rgba(1a1a1aee)";
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "overshot, 0.05, 0.9, 0.1, 1.05"
        "smoothOut, 0.36, 0, 0.66, -0.56"
        "smoothIn, 0.25, 1, 0.5, 1"
      ];
      animation = [
        "windows, 1, 3, overshot, slide"
        "windowsOut, 1, 3, smoothOut, slide"
        "windowsMove, 1, 3, default"
        "border, 1, 3, default"
        "fade, 1, 3, smoothIn"
        "fadeDim, 1, 3, smoothIn"
        "workspaces, 1, 3, default"
      ];
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    gestures = {
      workspace_swipe = "off";
    };

    device = [
      {
        name = "logitech-g-pro-gaming-mouse";
        sensitivity = 0.4;
        accel_profile = "flat";
      }
      {
        name = "royuan-2.4g-wireless-mouse";
        sensitivity = 0.4;
        accel_profile = "flat";
      }
    ];

    cursor = {
      no_hardware_cursor = 0;
      default_monitor = "HDMI-A-1";
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      disable_autoreload = false;
      vrr = 1;
    };

    xwayland = {
      use_nearest_neighbor = true;
      force_zero_scaling = false;
    };
  };
}
