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
        "swaync"
        "swww-daemon"
        "swayosd-server"
        "waybar &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"

        "[workspace 2 silent] $browser"
        "[workspace 3 silent] obsidian --disable-gpu"
        #"[workspace 3 silent] $scripts/script-aliases/obsidian-default-vault"
        #"[workspace 4 silent] systemctl --user start docker-desktop"
        "[workspace 5 silent] youtube-music"
        #"[workspace 5 silent] $scripts/script-aliases/foobar2000"
        #"[workspace 8 silent] whatsie"
        "[workspace 8 silent] discord"
      ];

      env = [
        # TODO: Replace path with XDG_HOME
        "HYPRSHOT_DIR,/home/daniel/Pictures/screenshots"
        # "GSK_RENDERER,ngl"
        # "GDK_SCALE,1"
        # "GDK_BACKEND,wayland"
        # "SDL_VIDEODRIVER,wayland"
        # "MOZ_ENABLE_WAYLAND,1"
        # "WLR_RENDERER_ALLOW_SOFTWARE=1"
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
