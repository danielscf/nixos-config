{
  config,
  system,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.home-manager.enable = true;

  home = {
    username = "daniel";
    homeDirectory = "/home/daniel";
    stateVersion = "24.11";

    packages = with pkgs; [
      cht-sh
      cmatrix
      ntfs3g
      unrar
      unzip
      vlc
      zoom-us
      swww
      discord
      pass
      pavucontrol
      whatsie
      filezilla
      tenacity
      mupdf
      youtube-music
      bottles
      glib
      libnotify
      via
      hyprshot
      obsidian
      jetbrains.idea-ultimate

      nemo
      vscode
      inputs.zen-browser.packages.${system}.beta
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  imports = [
    ../../modules/home/btop.nix
    ../../modules/home/cmus.nix
    ../../modules/home/fastfetch.nix
    ../../modules/home/ncspot.nix
    ../../modules/home/yt-dlp.nix

    ../../modules/home/desktop/stylix.nix
    ../../modules/home/desktop/rofi.nix
    ../../modules/home/desktop/firefox.nix
    ../../modules/home/desktop/waybar.nix
    ../../modules/home/desktop/kitty.nix
    ../../modules/home/desktop/ghostty.nix
    ../../modules/home/desktop/foot.nix
    ../../modules/home/desktop/swaync.nix
    ../../modules/home/desktop/udiskie.nix
    ../../modules/home/desktop/swayosd.nix
    ../../modules/home/desktop/xdg-user-dirs.nix
    ../../modules/home/desktop/gtk.nix
    ../../modules/home/desktop/qt.nix
    ../../modules/home/desktop/imv.nix
    ../../modules/home/desktop/obs-studio.nix

    ../../modules/home/hyprland/hyprland.nix

    ../../modules/home/shell/bash.nix
    ../../modules/home/shell/nushell.nix
    ../../modules/home/shell/zoxide.nix
    ../../modules/home/shell/yazi.nix
    ../../modules/home/shell/carapace.nix
    ../../modules/home/shell/starship.nix
    ../../modules/home/shell/tmux.nix
    ../../modules/home/shell/git.nix
    ../../modules/home/shell/ripgrep.nix
    ../../modules/home/shell/fzf.nix
    # ../../modules/home/shell/neovim.nix
  ];
}
