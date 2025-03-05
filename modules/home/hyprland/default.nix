{
  system,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./keybinds.nix
    ./monitors.nix
    ./plugins.nix
    ./variables.nix
    ./windowrules.nix
    ./workspaces.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    plugins = [
      inputs.hy3.packages.${system}.hy3
    ];

    settings = {
      "$primary_monitor" = "HDMI-A-1";
      "$secondary_monitor" = "DP-1";
      "$laptop_monitor" = "eDP-1";

      "$mainMod" = "SUPER";

      "$browser" = "zen-beta";
      "$terminal" = "${lib.getExe pkgs.ghostty}";
      "$file_manager" = "${lib.getExe pkgs.nemo}";
      "$launcher" = "${lib.getExe pkgs.rofi-wayland} -show drun";

      exec-once = [
        # TODO: Replace with pkgs
        "${lib.getExe pkgs.waybar}"
        "${lib.getExe' pkgs.swww "swww-daemon"}"
        "${lib.getExe' pkgs.swayosd "swayosd-server"}"
        "${lib.getExe' pkgs.swaynotificationcenter "swaync"}"
        "${lib.getExe' pkgs.wl-clipboard "wl-paste"} --type text --watch cliphist store"
        "${lib.getExe' pkgs.wl-clipboard "wl-paste"} --type image --watch cliphist store"

        "[workspace 2 silent] $browser"
        "[workspace 3 silent] ${lib.getExe pkgs.obsidian} --disable-gpu"
        #"[workspace 4 silent] $scripts/script-aliases/foobar2000"
        "[workspace 5 silent] ${lib.getExe pkgs.youtube-music}"
        "[workspace 8 silent] ${lib.getExe pkgs.discord}"
        "[workspace 9 silent] ${lib.getExe pkgs.whatsie}"
      ];

      env = [
        # "GSK_RENDERER,ngl"
        # "GDK_SCALE,1"
        # "GDK_BACKEND,wayland"
        # "MOZ_ENABLE_WAYLAND,1"

        "HYPRSHOT_DIR,$HOME/Pictures/screenshots"
        "QT_QPA_PLATFORM,wayland"
        "CLUTTER_BACKEND,wayland"
        "GBM_BACKEND,nvidia-drm"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];
    };
  };
}
