{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    prefix = "C-a";

    plugins = with pkgs; [
      tmuxPlugins.open
      tmuxPlugins.yank
      {
          plugin = tmuxPlugins.vim-tmux-navigator;
      }
      {
          plugin = tmuxPlugins.resurrect;
      }
      {
          plugin = tmuxPlugins.continuum;
      }
      {
          plugin = tmuxPlugins.fzf;
      }
    ];

    extraConfig = ''
      set -g set-clipboard on 
      set -g renumber-windows on
    '';

  };
}
