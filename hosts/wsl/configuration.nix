{ config, lib, pkgs, ... }:

{
  imports = [
    # <nixos-wsl/modules>
    inputs.home-manager.nixosModules.home-manager

    ../../modules/nixos/system_config/fonts.nix
    ../../modules/nixos/system_config/gc.nix
    ../../modules/nixos/system_config/nix-ld.nix

  ];

  networking.hostName = "nixwsl";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

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

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    backupFileExtension = "bkp";
    useUserPackages = true;
    useGlobalPkgs = true;

    users.daniel = {
      imports = [
        ./home.nix

        ../../modules/home-manager/cli_apps/btop.nix
        ../../modules/home-manager/cli_apps/yazi.nix

        ../../modules/home-manager/git/work.nix
        ../../modules/home-manager/neovim/neovim.nix

        ../../modules/home-manager/shell/bash.nix
        ../../modules/home-manager/shell/nushell.nix

        ../../modules/home-manager/shell/utilities/zoxide.nix
        ../../modules/home-manager/shell/utilities/carapace.nix
        ../../modules/home-manager/shell/utilities/starship.nix        
        ../../modules/home-manager/shell/utilities/tmux.nix
        ../../modules/home-manager/shell/utilities/shell-utilities.nix
      ];
    };
  };

  system.stateVersion = "24.11";
}