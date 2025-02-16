{ config, pkgs, ... }:

{
  services.sddm = {
    enable = true;
    # TODO: Ask if wayland should be enable
    wayland.enable = true;
  }
}
