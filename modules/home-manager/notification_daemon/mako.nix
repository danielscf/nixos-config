{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    actions = true;
    markup = true;
    icons = true;

    anchor = "top-right";
    defaultTimeout = 8000;
    font = "JetbrainsMono NF 11";
  };
}