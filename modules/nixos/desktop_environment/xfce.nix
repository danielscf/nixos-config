{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    # TODO: Make script that will override or alert if displayManager is already setup
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  }
}