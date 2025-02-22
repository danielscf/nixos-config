{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;

    image = ./wall.png;
    polarity = "dark";

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
        applications = 14;
        desktop = 12;
        popups = 10;
        terminal = 16;
      };
    };
  };
}
