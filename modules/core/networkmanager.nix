{
  config,
  pkgs,
  ...
}: {
  networking.networkmanager = {
    enable = true;
  };

  programs.nm-applet = {
    enable = true;
    indicator = false;
  };
}
