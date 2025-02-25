{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Transparent windows
      #"opacity 0.85 0.85,class:^(Docker Desktop)$"
      "opacity 0.8 0.8,class:^(steam_proton|Spotify|VSCodium|Code|obsidian|nemo)$"
      "opacity 0.8 0.8,class:^(Alacritty|kitty|com.mitchellh.ghostty)$"

      # Transparent window exceptions
      "opacity 1 1,class:^(firefox)$,title:^(.*YouTube.*)$"
      "opacity 1 1,class:^(firefox)$,title:^(.*Twitch.*)$"
      "opacity 1 1,class:^(zen)$,title:^(.*YouTube.*)$"
      "opacity 1 1,class:^(zen)$,title:^(.*Twitch.*)$"

      # Float to tile window
      "tile,class:^(steam_proton)$"

      # Tile to float  window
      "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "pin,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "float,class:^(zen)$,title:^(Picture-in-Picture)$"
      "pin,class:^(zen)$,title:^(Picture-in-Picture)$"

      # Default workspaces
      "workspace 1, class:^(vlc)$"
      "workspace 2, class:^(firefox)$"
      "workspace 2, class:^(zen)$"
      "workspace 3, class:^(obsidian)$"
      #"workspace 4, class:^(Docker Desktop)$"
      #"workspace 5, class:^(Spotify)$"
      #"workspace 5, class:^(steam_proton)$"
      "workspace 6, class:^(pavucontrol)$"
      "workspace 7, class:^(nemo)$"
      "workspace 8, class:^(discord)$"
      #"workspace 8, class:^(whatsdesk)$"
    ];
  };
}
