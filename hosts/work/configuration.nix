
{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ../../modules/nixos/fonts.nix
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
      useOSProber = false;
      efiSupport = true;
      enableCryptodisk = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";

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

      # "8.8.8.8"
      # "8.8.4.4"
      # "2001:4860:4860::8888"
      # "2001:4860:4860::8844"
    ];

    firewall = {
      enable = true;
      # allowedTCPPorts = [ 80 443 ];
      # allowedUDPPortRanges = [
        # { from = 4000; to = 4007; }
        # { from = 8000; to = 8010; }
      # ];
    };
  };

  security.polkit.enable = true;
  
  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    # xserver = {
      # enable = true;
      # displayManager.lightdm.enable = true;
      # desktopManager.xfce.enable = true;
    # };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;
  };

  users.users.daniel = {
    isNormalUser = true;
    initialPassword = "12345";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
      tree
    ];
  };

  users.defaultUserShell = pkgs.bash;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      man
      vim
      wget
      git
      curl
      tmux
      snapper
      home-manager

      kitty
      gtk3
      xdg-user-dirs
      wl-clipboard
      cliphist
    ];
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [
    "vmware"
  ];
  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [

  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "bkp";

    users.daniel = {
      imports = [
        ./home.nix
        ../../modules/home-manager/btop.nix
        ../../modules/home-manager/yazi.nix

        ../../modules/home-manager/neovim.nix

        ../../modules/home-manager/hyprland/hyprland.nix
        ../../modules/home-manager/firefox.nix
        ../../modules/home-manager/rofi.nix
        ../../modules/home-manager/kitty.nix
        ../../modules/home-manager/foot.nix

        ../../modules/home-manager/shell/bash.nix
        ../../modules/home-manager/shell/nushell.nix

        ../../modules/home-manager/shell/utilities/zoxide.nix
        ../../modules/home-manager/shell/utilities/carapace.nix
        ../../modules/home-manager/shell/utilities/starship.nix        
        ../../modules/home-manager/shell/utilities/shell-utilities.nix
      ];
    };
  };

  system.stateVersion = "24.11";
}

