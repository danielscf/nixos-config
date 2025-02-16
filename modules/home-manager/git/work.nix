{ config, pkgs, ... }:

{
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
}