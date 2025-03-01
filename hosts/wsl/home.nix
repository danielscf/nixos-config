{ config, system, pkgs, lib, inputs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "daniel";
    homeDirectory = "/home/daniel";
    stateVersion = "24.11";
  
    packages = with pkgs; [
      unrar
      unzip
      gnupg
      glib

      pass
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  imports = [
    ../../modules/home/desktop/xdg-user-dirs.nix
    ../../modules/home/desktop/stylix.nix

    ../../modules/home/shell/btop.nix
    ../../modules/home/shell/fastfetch.nix
    ../../modules/home/shell/bash.nix
    ../../modules/home/shell/nushell.nix
    ../../modules/home/shell/zoxide.nix
    ../../modules/home/shell/yazi.nix
    ../../modules/home/shell/fzf.nix
    ../../modules/home/shell/fd.nix
    ../../modules/home/shell/ripgrep.nix
    ../../modules/home/shell/carapace.nix
    ../../modules/home/shell/starship.nix        
    ../../modules/home/shell/tmux.nix
    ../../modules/home/shell/git.nix

    ../../modules/home/neovim/nixvim.nix
  ];
}