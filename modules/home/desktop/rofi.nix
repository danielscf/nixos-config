{
  pkgs,
  lib,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    location = "center";
    font = lib.mkForce "JetbrainsMono NF 12";

    # TODO: Set default terminal and use variable
    terminal = "ghostty";

    plugins = with pkgs; [
      rofi-top
      rofi-mpd
      rofi-calc
      rofi-systemd
      rofi-bluetooth
      rofi-power-menu
      rofi-screenshot
      rofi-emoji-wayland
    ];

    theme = import ./rofi-theme.nix;

    # theme =
    #   let
    #     inherit (config.lib.formats.rasi) mkLiteral;
    #   in
    #   {
    #     "*" = {
    #       # font = mkLiteral "Roboto 12";
    #       background-color = mkLiteral "transparent";
    #       text-color = mkLiteral "#E6E6E6";
    #       margin = mkLiteral "0px";
    #       padding = mkLiteral "0px";
    #       spacing = mkLiteral "0px";
    #     };
    #
    #     "window" = {
    #       location = mkLiteral "north";
    #       y-offset = mkLiteral "calc(50% - 176px)";
    #       width = 480;
    #       border-radius = mkLiteral "24px";
    #       background-color = mkLiteral "#212121F2";
    #     };
    #
    #     "mainbox" = {
    #       padding = mkLiteral "12px";
    #     };
    #
    #     "inputbar" = {
    #       background-color = mkLiteral "#2A2A2A";
    #       border-color = mkLiteral "#1A73E8F2";
    #
    #       border = mkLiteral "2px";
    #       border-radius = mkLiteral "16px";
    #       padding = mkLiteral "8px 16px";
    #       spacing = mkLiteral "8px";
    #       children = map mkLiteral [
    #         "prompt"
    #         "entry"
    #       ];
    #     };
    #
    #     "prompt" = {
    #       text-color = mkLiteral "#969696";
    #     };
    #
    #     "entry" = {
    #       placeholder = "Search";
    #       placeholder-color = mkLiteral "#3D3D3D";
    #     };
    #
    #     "message" = {
    #       margin = mkLiteral "12px 0 0";
    #       border-radius = mkLiteral "16px";
    #       border-color = mkLiteral "#3D3D3D80";
    #       background-color = mkLiteral "#3D3D3D80";
    #     };
    #
    #     "textbox" = {
    #       padding = mkLiteral "8px 24px";
    #     };
    #
    #     "listview" = {
    #       background-color = mkLiteral "transparent";
    #       margin = mkLiteral "12px 0 0";
    #       lines = 8;
    #       columns = 1;
    #       fixed-height = false;
    #     };
    #
    #     "element" = {
    #       padding = mkLiteral "8px 16px";
    #       spacing = mkLiteral "8px";
    #       border-radius = mkLiteral "16px";
    #     };
    #
    #     "element normal active" = {
    #       text-color = mkLiteral "#1A73E8F2";
    #     };
    #
    #     "element alternate active" = {
    #       text-color = mkLiteral "#1A73E8F2";
    #     };
    #
    #     "element selected normal" = {
    #       background-color = mkLiteral "#1A73E8F2";
    #     };
    #
    #     "element selected active" = {
    #       background-color = mkLiteral "#1A73E8F2";
    #     };
    #
    #     "element-icon" = {
    #       size = mkLiteral "1em";
    #       vertical-align = mkLiteral "0.5";
    #     };
    #
    #     "element-text" = {
    #       text-color = mkLiteral "inherit";
    #     };
    #   };
    # extraConfig = {
    # };
  };
}
