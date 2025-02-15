{ config, pkgs, ... }:

{
  programs = {
    
    fzf =  {
      enable = true;
    };

    ripgrep = {
      enable = true;
    };

  };
}