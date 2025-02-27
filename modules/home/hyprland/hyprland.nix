{
  config,
  system,
  pkgs,
  lib,
  inputs,
  ...
}: {
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

      "$file_manager" = "nemo";
      "$terminal" = "ghostty";
      "$launcher" = "rofi -show drun";
      "$browser" = "zen-beta";

      "$mainMod" = "SUPER";

      exec-once = [
        # TODO: Replace with pkgs
        "mako"
        "udiskie &"
        "swww-daemon"
        "swayosd-server"
        "waybar &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"

        "[workspace 2 silent] $browser"
        #"[workspace 3 silent] $scripts/script-aliases/obsidian-default-vault"
        #"[workspace 4 silent] systemctl --user start docker-desktop"
        #"[workspace 5 silent] spotify-launcher"
        #"[workspace 5 silent] $scripts/script-aliases/foobar2000"
        #"[workspace 8 silent] whatsdesk"
        "[workspace 8 silent] discord"
      ];

      env = [
        # TODO: Replace path with XDG_HOME
        "HYPRSHOT_DIR,/home/daniel/Pictures/screenshots"
        # "GSK_RENDERER,ngl"
        # "GDK_SCALE,1"
        # "XCURSOR_SIZE,24"
        # "GDK_BACKEND,wayland"
        # "QT_QPA_PLATFORM,wayland"
        # "SDL_VIDEODRIVER,wayland"
        # "CLUTTER_BACKEND,wayland"
        # "XDG_CURRENT_DESKTOP,Hyprland"
        # "XDG_SESSION_TYPE,wayland"
        # "XDG_SESSION_DESKTOP,Hyprland"
        # "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        # "QT_QPA_PLATFORM,wayland"
        # "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # "QT_QPA_PLATFORMTHEME,qt5ct"
        # "MOZ_ENABLE_WAYLAND,1"
        # "WLR_RENDERER_ALLOW_SOFTWARE=1"
        # "WLR_RENDERER=vulkan"
        # "__GL_VRR_ALLOWED,1"

        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];
    };
  };
}
