{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = "./winter.png";
    polarity = "dark";
    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };  
}
