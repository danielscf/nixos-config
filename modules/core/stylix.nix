{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = "/home/daniel/wallpapers/wallhaven-42kmd9_2560x1440.png";
    polarity = "dark";
    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };  
}
