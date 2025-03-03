{
  pkgs,
  lib,
  ...
}: {
  home.activation.nixvimDirTheme = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ~/.config/colors/
    touch ~/.config/colors/stylix.lua
  '';

  stylix = {
    enable = true;
    autoEnable = true;

    image = ./wall.png;
    polarity = "dark";

    iconTheme = {
      enable = true;
      package = "${pkgs.kora-icon-theme}";
      dark = "kora";
      light = "kora";
    };

    targets = {
      tmux.enable = false;

      nixvim = {
        enable = true;
        plugin = "mini.base16";
      };
    };
  };
}
