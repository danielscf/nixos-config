{ config, pkgs, ... }:
{
  # TODO: Ask if efi/bios
  # TODO: Ask if encryption
  # TODO: Ask if OSProber
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = false;
      efiSupport = true;
      enableCryptodisk = true;
    };
    efi.canTouchEfiVariables = true;
  };
}