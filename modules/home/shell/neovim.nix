{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = false;
    vimAlias = true;
  };
}
