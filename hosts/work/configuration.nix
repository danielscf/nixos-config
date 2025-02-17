{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ../../modules/nixos/system_config/fonts.nix
    ../../modules/nixos/system_config/gc.nix
    ../../modules/nixos/system_config/nix-ld.nix

    ../../modules/nixos/audio/pipewire.nix

    ../../modules/nixos/bootloader/grub.nix

    ../../modules/nixos/display_manager/sddm.nix
    
    ../../modules/nixos/network/networkmanager.nix
    ../../modules/nixos/network/dns.nix
    ../../modules/nixos/network/firewall.nix

    ../../modules/nixos/video_drivers/vm.nix

  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  networking.hostName = "nixos";

  security.polkit.enable = true;
  
  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  services.libinput.enable = true;

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
      home-manager

      kitty
      gtk3
      xdg-user-dirs
      wl-clipboard
      cliphist
    ];
  };

  hardware.graphics.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    backupFileExtension = "bkp";
    useUserPackages = true;
    useGlobalPkgs = true;

    users.daniel = {
      imports = [
        ./home.nix

        ../../modules/home-manager/app_launcher/rofi.nix
        ../../modules/home-manager/browser/firefox.nix

        ../../modules/home-manager/cli_apps/btop.nix
        ../../modules/home-manager/cli_apps/yazi.nix

        ../../modules/home-manager/git/work.nix
        ../../modules/home-manager/hyprland/hyprland.nix
        ../../modules/home-manager/neovim/neovim.nix
        ../../modules/home-manager/notification_daemon/mako.nix
        ../../modules/home-manager/osd/swayosd.nix

        ../../modules/home-manager/shell/bash.nix
        ../../modules/home-manager/shell/nushell.nix

        ../../modules/home-manager/shell/utilities/zoxide.nix
        ../../modules/home-manager/shell/utilities/carapace.nix
        ../../modules/home-manager/shell/utilities/starship.nix        
        ../../modules/home-manager/shell/utilities/tmux.nix
        ../../modules/home-manager/shell/utilities/shell-utilities.nix

        ../../modules/home-manager/status_bar/waybar.nix

        ../../modules/home-manager/terminal/kitty.nix
        ../../modules/home-manager/terminal/ghostty.nix
        ../../modules/home-manager/terminal/foot.nix

      ];
    };
  };

  system.stateVersion = "24.11";
}