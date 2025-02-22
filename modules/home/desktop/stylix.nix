{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;

    image = ./wall.png;
    polarity = "dark";

    iconTheme = {
      enable = true;
      package = "${pkgs.adwaita-icon-theme}";
    };
  };
}
