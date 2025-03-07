{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;

    image = ../../../assets/wall.png;
    polarity = "dark";

    targets = {
      tmux.enable = false;
      rofi.enable = false;

      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };
    };

    iconTheme = {
      enable = true;
      package = "${pkgs.kora-icon-theme}";
      dark = "kora";
      light = "kora";
    };

    cursor = {
      package = "${pkgs.google-cursor}";
      name = "Google cursor";
      size = 12;
    };

    fonts = {
      emoji = {
        package = "${pkgs.noto-fonts-emoji}";
        name = "Noto Emoji";
      };

      monospace = {
        package = "${pkgs.nerd-fonts.jetbrains-mono}";
        name = "JetBrainsMono NF";
      };

      sansSerif = {
        package = "${pkgs.noto-fonts}";
        name = "Noto Sans";
      };

      serif = {
        package = "${pkgs.noto-fonts}";
        name = "Noto Serif";
      };

      sizes = {
        applications = 12; # Default: 12
        desktop = 12; # Default: 10
        popups = 10; # Default: 10
        terminal = 16; # Default: 12
      };
    };
  };
}
