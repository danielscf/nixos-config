{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      font = "JetbrainsMono NF:size=18";
    };
  };
}
