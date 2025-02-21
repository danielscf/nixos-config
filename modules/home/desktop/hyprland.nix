{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      "monitor" = ",1920x1080,0x0,1";

      "$mainMod" = "SUPER";

      "$file_manager" = "nemo";
      "$terminal" = "kitty";
      "$terminal1" = "foot";
      "$launcher" = "rofi -show drun";
      "$browser" = "firefox";

      exec-once = [
        "mako"
        "udiskie"
        "swww-daemon"
        "swayosd-server"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      bind = [
        "$mainMod, Q, killactive"
        "$mainMod, R, exec, $launcher"
        "$mainMod, T, exec, $terminal"
        "$mainMod, F, exec, $terminal1"
        "$mainMod, E, exec, $file_manager"
        "$mainMod, B, exec, $browser"
      ];

      env = [
        "QT_QPA_PPLATFORM,wayland"
      ];

    };
  };
}
