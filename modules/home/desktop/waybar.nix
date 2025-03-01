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
          "custom/power"
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
            "class<com.mitchellh.ghostty>" = "";
            "class<nemo>" = "";
            "class<firefox>" = "";
            "class<zen>" = "";
            "class<(Chromium)|(Chrome)>" = "";
            "class<discord>" = "";
            "class<whatsie>" = "";
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
          on-click = "exec nm-applet --indicator";
          tooltip-format-wifi = "Signal Strenght: {signalStrength}% | Down Speed: {bandwidthDownBits}, Up Speed: {bandwidthUpBits}";
        };
        bluetooth = {
          format-on = " On";
          format-off = "";
          format-connected = " On ({num_connections})";
          format-disabled = "";
          on-click = "bluetoothctl power on";
          on-click-right = "bluetoothctl power off";
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          scroll-step = 5;
          max-volume = 100;
          on-click = "pavucontrol";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" "󰕾" " "];
          };
        };

        "custom/power" = {
          format = " ⏻ ";
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

    style = ''
      * {
        border: none;
        border-radius: 0px;
        font-family: JetBrainsMono NF;
        font-weight: bold;
        font-size: 14px;
      }

      window#waybar {
        background: transparent;
      }

      tooltip {
        color: #${config.lib.stylix.colors.base01};
        background: #${config.lib.stylix.colors.base05};
        border-radius: 10px;
        border-color: #${config.lib.stylix.colors.base05};
      }

      #workspaces {
        margin: 8px;
      }

      #workspaces button {
        color: #${config.lib.stylix.colors.base00};
        border-radius: 10px;
        font-size: 16px;
        background: #${config.lib.stylix.colors.base08};
        padding: 5px 20px;
        box-shadow: rgba(0, 0, 0, 0.1) 2px 2px 5px 2px;
      }

      #workspaces button.active {
        color: #${config.lib.stylix.colors.base00};
        background: #${config.lib.stylix.colors.base08};
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
      }

      /* All components */
      #mpris,
      #tray,
      #bluetooth,
      #privacy,
      #wireplumber,
      #clock,
      #network,
      #language,
      #battery,
      #custom-power {
        color: #${config.lib.stylix.colors.base00};
        border-radius: 10px;
        background: #${config.lib.stylix.colors.base08};
        padding: 0px 10px;
        margin: 8px 5px;
      }

      /* Component groups */
      /* Group 1 */
      #mpris {
        color: #${config.lib.stylix.colors.base00};
        background: #${config.lib.stylix.colors.base06};
        margin: 8px 0px;
        margin-left: 2px;
        margin-right: 5px;
        padding: 0px 15px 0px 10px;
      }

      /* Group 2 */
      #tray {
        background: #${config.lib.stylix.colors.base02};
        margin: 8px 5px;
      }

      /* Group 3 */
      #bluetooth,
      #privacy,
      #wireplumber {
        background: #${config.lib.stylix.colors.base04};
        margin: 8px 0px;
      }
      #bluetooth {
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
      }
      #privacy {
        border-radius: 0px;
      }
      #wireplumber {
        margin: 8px 5px 8px 0px;
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
      }

      /* Group 4 */
      #clock {
        background: #${config.lib.stylix.colors.base02};
        margin: 8px 5px;
      }

      /* Group 5 */
      #network,
      #language,
      #battery {
        background: #${config.lib.stylix.colors.base06};
        margin: 8px 0px;
      }
      #network {
        margin: 8px 0px 8px 2px;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
      }
      #language {
        border-radius: 0px;
      }
      #battery {
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
      }

      /* Group 6 */
      #custom-power {
        margin: 8px;
        background: #${config.lib.stylix.colors.base08};

        padding-right: 13px;
      }
    '';
  };
}
