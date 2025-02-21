{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        # font = "JetbrainsMono NF:size=18";
      };
    };
  };
}
