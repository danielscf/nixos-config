{ config, pkgs, ... }:

{
  home.username = "daniel";
  home.homeDirectory = "/home/daniel";

  home.stateVersion = "24.11";
  
  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName  = "danielscf";
    userEmail = "fdanielsantacruz@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      safe.directory = "/mnt/media/external/vaults/personal";
    };
  };

  home.packages = with pkgs; [
    cht-sh
    cmatrix
    pass
    udiskie
    unrar
    unzip

    nemo
    vscode
    firefox
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

}
