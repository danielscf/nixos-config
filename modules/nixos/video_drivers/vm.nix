{ config, pkgs, ... }:

{
  # TODO: Ask if `vmware` or `virtualbox`
  services.xserver.videoDrivers = [
    "vmware"
    "virtualbox"
  ];
}