{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      lsp.enable = true;
      languages.nix.enable = true;
    };
  };
}
