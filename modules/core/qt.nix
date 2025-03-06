{ pkgs, ... }:
{
  qt.enable = true;
  # qt.platformTheme = "gnome"; # This is set by stylix

  environment.systemPackages = [
    pkgs.libsForQt5.qt5.qtbase
    pkgs.libsForQt5.qt5.qttools
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.qt6gtk2
  ];
}
