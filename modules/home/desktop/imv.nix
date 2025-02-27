{ config, pkgs, ... }:
{
  programs.imv = {
    enable = true;

    # TODO: Check man page for imv options
    settings = {};
  }
}
