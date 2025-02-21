{ config, pkgs, ... }:
{
  # TODO: Ask if efi/bios
  # TODO: Ask if encryption
  # TODO: Ask if OSProber
  boot = {
    kernelParms = [
      "loglevel=3"
    ];
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        enableCryptodisk = false;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
