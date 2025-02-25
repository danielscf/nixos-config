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
      package = "${pkgs.kora-icon-theme}";
      dark = "kora";
      light = "kora";
    };

    targets = {
      tmux.enable = false;
    };
  };
}
