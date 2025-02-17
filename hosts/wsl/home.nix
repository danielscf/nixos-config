{ config, pkgs, ... }:

{
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.stateVersion = "24.11";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    pass
    unrar
    unzip
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

}