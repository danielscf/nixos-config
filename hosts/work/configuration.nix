{
  system,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ../../modules/core/autoUpgrade.nix
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
    ../../modules/core/gnupg.nix
    ../../modules/core/udisks2.nix
    ../../modules/core/playerctld.nix
    ../../modules/core/bluetooth.nix
    ../../modules/core/blueman.nix
    ../../modules/core/security.nix
    ../../modules/core/external_drive.nix
    ../../modules/core/qt.nix
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  networking.hostName = "nixos";

  security.polkit.enable = true;

  # TODO: Create module?
  time = {
    timeZone = "America/Lima";
    # hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  services.libinput.enable = true;

  users.defaultUserShell = pkgs.bash;

  programs.zsh.enable = true;

  users.users.daniel = {
    isNormalUser = true;
    initialPassword = "12345";
    extraGroups = [
      "wheel"
      "video"
      "storage"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    man
    vim
    wget
    git
    curl
    tmux
    home-manager

    gcc
    ntfs3g
    unrar
    glib
    rustup
    libnotify
    gnumake
    unzip
    python313
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs system; };

    backupFileExtension = "bkp";
    useUserPackages = true;
    useGlobalPkgs = true;

    users.daniel = import ./home.nix;
  };

  system.stateVersion = "24.11";
}
