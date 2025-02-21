{ config, lib, pkgs, inputs, ... }:

{
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
    ../../modules/core/xdg-userdirs.nix
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
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
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
      tree
    ];
  };

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

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    backupFileExtension = "bkp";
    useUserPackages = true;
    useGlobalPkgs = true;

    users.daniel = {
      imports = [
        ./home.nix

        ../../modules/home/btop.nix
        ../../modules/home/cmus.nix
        ../../modules/home/fastfetch.nix
        ../../modules/home/ncspot.nix
        ../../modules/home/yt-dlp.nix

        ../../modules/home/desktop/rofi.nix
        ../../modules/home/desktop/firefox.nix
        ../../modules/home/desktop/waybar.nix
        ../../modules/home/desktop/kitty.nix
        ../../modules/home/desktop/ghostty.nix
        ../../modules/home/desktop/foot.nix
        ../../modules/home/desktop/mako.nix
        ../../modules/home/desktop/swayosd.nix
        ../../modules/home/desktop/hyprland.nix

        ../../modules/home/shell/bash.nix
        ../../modules/home/shell/nushell.nix
        ../../modules/home/shell/zoxide.nix
        ../../modules/home/shell/yazi.nix
        ../../modules/home/shell/carapace.nix
        ../../modules/home/shell/starship.nix        
        ../../modules/home/shell/tmux.nix
        ../../modules/home/shell/git.nix
        ../../modules/home/shell/neovim.nix

      ];
    };
  };

  system.stateVersion = "24.11";
}