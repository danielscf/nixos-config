{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    plugins = [
      inputs.hy3.packages.x86_64-linux.hy3
    ];

    settings = {
      "$primary_monitor" = "HDMI-A-1";
      "$secondary_monitor" = "DP-1";
      "$laptop_monitor" = "eDP-1";

      monitor = [
        ",preferred,auto,auto"
        "$laptop_monitor,disable"
        # "$laptop_monitor,1920x1080@144,0x0,1"
        "$primary_monitor,1920x1080@165,0x0,1"
        "$secondary_monitor,1366x768@60,auto-left,1,transform,1"
      ];

      exec-once = [
        "mako"
        "udiskie &"
        "swww-daemon"
        "swayosd-server"
        "waybar &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      env = [
        "QT_QPA_PPLATFORM,wayland"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDORr_LIBRARY_NAME,nvidia"
      ];

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

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = false;
        vrr = 1;
      };

      "$mainMod" = "SUPER";

      "$file_manager" = "nemo";
      "$terminal" = "kitty";
      "$launcher" = "rofi -show drun";
      "$browser" = "firefox";

      bind = [
        "$mainMod, Q, killactive"
        "$mainMod, R, exec, $launcher"
        "$mainMod, T, exec, $terminal"
        "$mainMod, E, exec, $file_manager"
        "$mainMod, B, exec, $browser"

        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, mouse_down, workspace, e+1"
      ];

      bindr = [
        "CAPS, Caps_Lock, exec, swayosd-client --caps-lock"
        "MOD2, Num_Lock, exec, swaposd-client --num-lock"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        "$mainMod, XF86AudioMute, exec, swayosd-client --input-volume mute-toggle"

        "$mainMod, XF86AudioRaiseVolume, exec, swayosd-client --brightness raise"
        "$mainMod, XF86AudioLowerVolume, exec, swayosd-client --brightness lower"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
