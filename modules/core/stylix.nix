{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = "/home/daniel/wallpapers/winter.png";
    polarity = "dark";
    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };  
}
