{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    prefix = "C-a";
    # plugins = with pkgs; [

    # ];

    # extraConfig = ''
    #   set -g set-clipboard on 
    # '';

  };
}