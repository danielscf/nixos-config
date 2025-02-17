{ config, pkgs, ... }:

{
  services.swayosd = {
    enable = true;
    # display = ""; # Monitor
  };
}