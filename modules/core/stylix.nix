{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ./wall.png;
    polarity = "dark";
    targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };  
}
