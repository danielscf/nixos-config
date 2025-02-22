{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image = ./wall.png;
    polarity = "dark";
    autoEnable = false;
    targets = {
      gtk.enable = true;
      qt.enable = true;
    };

    #cursor = {
    #package = "";
    #name = "";
    #size = "";
    #};

    fonts = {
      emoji = {
        package = "noto-fonts-emoji";
        name = "Noto Emoji";
      };

      monospace = {
        package = "nerd-fonts.jetbrains-mono";
        name = "JetBrainsMono NF";
      };

      sansSerif = {
        package = "noto-fonts";
        name = "Noto Sans";
      };

      serif = {
        package = "noto-fonts";
        name = "Noto Serif";
      };

      sizes = {
        applications = 14;
        desktop = 12;
        popups = 10;
        terminal = 16;
      };
    };
  };
}
