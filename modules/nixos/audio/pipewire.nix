{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    # TODO: Add jack and alsa support
  }
}
