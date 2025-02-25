{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ../../modules/core/allowUnfree.nix
    ../../modules/core/fonts.nix
    ../../modules/core/gc.nix
    ../../modules/core/nix-ld.nix
    ../../modules/core/pipewire.nix
    ../../modules/core/grub.nix
    ../../modules/core/sddm.nix
    ../../modules/core/networkmanager.nix
    ../../modules/core/dns.nix
    ../../modules/core/firewall.nix
    ../../modules/core/nvidia.nix
    ../../modules/core/hyprland.nix
    ../../modules/core/stylix.nix
    ../../modules/core/gnupg.nix
    ../../modules/core/udisks2.nix
    ../../modules/core/playerctld.nix
    ../../modules/core/bluetooth.nix
    ../../modules/core/blueman.nix
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
  };

  networking.hostName = "nixos";

  security.polkit.enable = true;

  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  services.libinput.enable = true;

  users.defaultUserShell = pkgs.bash;

  users.users.daniel = {
    isNormalUser = true;
    initialPassword = "12345";
    extraGroups = [
      "wheel"
      "networkmanager"
      "storage"
    ];
    shell = pkgs.nushell;
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      man
      vim
      neovim
      wget
      git
      curl
      tmux
      home-manager
      gcc
      rustup
      python313

      kitty
      gtk3
      xdg-user-dirs
      wl-clipboard
      cliphist
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    backupFileExtension = "bkp";
    useUserPackages = true;
    useGlobalPkgs = true;

    users.daniel = import ./home.nix;
  };

  system.stateVersion = "24.11";
}
