{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Basic keybinds
      "$mainMod, Q, killactive,"
      "$mainMod, S, togglesplit,"
      "$mainMod, V, togglefloating,"
      "$mainMod, P, pseudo,"
      "$mainMod, O, hy3:changegroup, toggletab"
      "$mainMod, R, exec, $launcher"
      "$mainMod, T, exec, $terminal"
      "$mainMod, E, exec, $file_manager"
      "$mainMod, B, exec, $browser"
      #"$mainMod, C, exec, $scripts/theme-change"
      #"$mainMod, W, exec, $scripts/theme-reload"
      #"$mainMod, Z, exec, $scripts/zen"
      #"$mainMod, X, exec, $scripts/theme-wlogout"
      "$mainMod, F1, exec, bluetoothctl power off"
      #"$mainMod, F2, exec, $scripts/script-aliases/bt-audio"

      # Hyprshot
      ", PRINT, exec, hyprshot -m output"
      "$mainMod, PRINT, exec, hyprshot -m region"
      "$shiftMod, PRINT, exec, hyprshot -m window"
    ];

    # Move/re-size windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Swayosd
    bindr = [
      "CAPS, Caps_Lock, exec, swayosd-client --caps-lock"
      "MOD2, Num_Lock, exec, swayosd-client --num-lock"
    ];

    binde = [
      # Swayosd
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ", XF86AudioMute, exec, swayosd-client --ouput-volume mute-toggle"
      "$mainMod, XF86AudioMute, exec, swayosd-client --input-volume mute-toggle"
      "$mainMod, XF86AudioLowerVolume, exec, swayosd-client --brightness lower"
      "$mainMod, XF86AudioRaiseVolume, exec, swayosd-client --brightness raise"

      # Window focus
      "$mainMod, left, hy3:movefocus, l"
      "$mainMod, H, hy3:movefocus, l"
      "$mainMod, right, hy3:movefocus, r"
      "$mainMod, L, hy3:movefocus, r"
      "$mainMod, up, hy3:movefocus, u"
      "$mainMod, K, hy3:movefocus, u"
      "$mainMod, down, hy3:movefocus, d"
      "$mainMod, J, hy3:movefocus, d"

      # Window position
      "$mainMod SHIFT, left, hy3:movewindow, l"
      "$mainMod SHIFT, H, hy3:movewindow, l"
      "$mainMod SHIFT, right, hy3:movewindow, r"
      "$mainMod SHIFT, L, hy3:movewindow, r"
      "$mainMod SHIFT, up, hy3:movewindow, u"
      "$mainMod SHIFT, K, hy3:movewindow, u"
      "$mainMod SHIFT, down, hy3:movewindow, d"
      "$mainMod SHIFT, J, hy3:movewindow, d"

      # Re-size window
      "$mainMod ALT, left, resizeactive, -10 0"
      "$mainMod ALT, H, resizeactive, -10 0"
      "$mainMod ALT, right, resizeactive, 10 0"
      "$mainMod ALT, L, resizeactive, 10 0"
      "$mainMod ALT, up, resizeactive, 0 -10"
      "$mainMod ALT, K, resizeactive, 0 -10"
      "$mainMod ALT, down, resizeactive, 0 10"
      "$mainMod ALT, J, resizeactive, 0 10"

      # Switch workspaces with mainMod + [0-9]
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

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
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
  };
}
