{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 55;
        output = ["eDP-1" "HDMI-A-1"];
        reload_style_on_change = true;

        modules-left = [
          "hyprland/workspaces"
          "mpris"
          "tray"
        ];
        modules-center = [];
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

        "hyprland/workspaces" = {
          active-only = true;
          on-click = "activate";
          format = "{name}  {windows}";
          format-window-separator = "  ";
          window-rewrite-default = "󰲌";
          window-rewrite = {
            # https://www.nerdfonts.com/cheat-sheet
            # https://fontawesome.com/icons
            "class<Alacritty>" = "";
            "class<Foot>" = "";
            "class<Kitty>" = "";
            "class<nemo>" = "";
            "class<firefox>" = "";
            "class<zen-alpha>" = "";
            "class<(Chromium)|(Chrome)>" = "";
            "class<discord>" = "";
            "class<whatsdesk>" = "";
            "class<obsidian>" = "󱞁";
            "class<vlc>" = "󰕼";
            "class<Spotify>" = "";
            "class<Code>" = "󰨞";
            "class<com.obsproject.Studio|zoom>" = "";
            "class<pavucontrol>" = "";
            "class<Docker Desktop>" = "";
            "class<qt5ct|wpgtk|nwg-look|nvidia-settings>" = "";
            "class<sqlitebrowser|DBeaver>" = "";
          };
        };

        "hyprland/window" = {
          format = "{class}";
        };

        mpris = {
          player = "playerctld";
          max-length = 60;
          format = " {status_icon}  {player_icon}  {dynamic}";
          dynamic-order = ["title" "artist"];
          player-icons = {
            "default" = "";
            "vlc" = "󰕼";
            "spotify" = "";
            "ncspot" = "";
            "firefox" = "";
            "chromium" = "";
          };
          status-icons = {
            paused = "";
            playing = "";
          };
        };

        tray = {
          icon-size = 13;
          spacing = 10;
        };

        "hyprland/language" = {
          format-en = "⌨ EN";
          format-es = "⌨ ES";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        clock = {
          format = " {:%I:%M %p |  %d/%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        network = {
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈀 Ethernet";
          format-linked = "{ifname} (No IP)  ";
          format-disconnected = " Disconnected";
          on-click = "exec kitty -e nmtui-connect";
          tooltip-format-wifi = "Signal Strenght: {signalStrength}% | Down Speed: {bandwidthDownBits}, Up Speed: {bandwidthUpBits}";
        };
        bluetooth = {
          format-on = " On";
          format-off = "";
          format-connected = " On ({num_connections})";
          format-disabled = "";
          on-click = "bluetoothctl power on";
          on-click-right = "bluetoothctl power off";
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          scroll-step = 10;
          max-volume = 100;
          on-click = "pavucontrol";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" "󰕾" ""];
          };
        };

        "custom/power" = {
          format = "⏻";
          on-click = "~/scripts/theme-wlogout";
        };
        "custom/theme" = {
          format = "󰌁";
          on-click = "~/scripts/theme-change";
          on-click-right = "~/scripts/theme-reload";
        };

        privacy = {
          icon-spacing = 4;
          icon-size = 18;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-out";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
        };
      }
      {
        output = "DP-1";
        start_hidden = true;
      }
    ];
  };
}
