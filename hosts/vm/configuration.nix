{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # ./disk-configuration.nix
    (import ./disk-configuration.nix { device = "/dev/sda"; })

    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixvm";

    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      dns = "none";
    };

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    firewall = {
      enable = true;
    };
  };

  security.polkit.enable = true;
  
  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;
      videoDrivers = [
        "virtualbox"
      ];
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;
  };

  users.users.guest = {
    isNormalUser = true;
    initialPassword = "12345";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bash;
  };

  users.defaultUserShell = pkgs.bash;

  environment = {
    systemPackages = with pkgs; [
      man
      vim
      wget
      git
      curl
      home-manager
    ];
  };

  hardware.graphics.enable = true;
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "bkp";

    users.guest = {
      imports = [
        ./home.nix
      ];
    };
  };

  system.stateVersion = "24.11";
}

