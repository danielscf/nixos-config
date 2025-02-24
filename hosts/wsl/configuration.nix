{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ../../modules/core/allowUnfree.nix
    ../../modules/core/gc.nix
    ../../modules/core/nix-ld.nix
  ];

  networking.hostName = "nixwsl";

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  wsl = {
    enable = true;
    defaultUser = "daniel";
    docker-desktop.enable = true;
    usbip.enable = false; # USB/IP Integration
  };

  users.defaultUserShell = pkgs.bash;

  users.users.daniel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.nushell;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    backupFileExtension = "bkp";
    useUserPackages = true;
    useGlobalPkgs = true;

    users.daniel = import ./home.nix;
  };

  system.stateVersion = "24.11";
}