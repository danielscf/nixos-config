{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.kernelModules = [ ];
  boot.initrd.supportedFilesystems = [ "btrfs" ];
  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];

  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5a2b825d-ecfa-4dde-b1ad-90e45c631628";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/d45e1964-170b-4e6e-993f-16a7e4a6eebc";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/5a2b825d-ecfa-4dde-b1ad-90e45c631628";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/5a2b825d-ecfa-4dde-b1ad-90e45c631628";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/5a2b825d-ecfa-4dde-b1ad-90e45c631628";
      fsType = "btrfs";
      options = [ "subvol=@var_log" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/5a2b825d-ecfa-4dde-b1ad-90e45c631628";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F221-21BB";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; }];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}
