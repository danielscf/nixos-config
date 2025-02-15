{ config, pkgs, ... }:

{
  home.username = "guest";
  home.homeDirectory = "/home/guest";

  home.stateVersion = "24.11";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    unzip
    unrar
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;

}
