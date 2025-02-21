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
      "$launcher" = "rofi -show drun";
      "$browser" = "firefox";

      exec-once = [
        "mako"
        "udiskie &"
        "swww-daemon"
        "swayosd-server"
	"waybar &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

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

      env = [
        "QT_QPA_PPLATFORM,wayland"
      ];

      input = {
        kb_layout = "us,latam";
	kb_options = "grp:win_space_toggle";
	follow_mouse = 1;
	touchpad.natural_scroll = "yes";
	sensitivity = 0;
      };


    };
  };
}
