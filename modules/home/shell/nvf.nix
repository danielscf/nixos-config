{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    viAlias = true;

    settings.vim = {
      lsp.enable = true;
      languages.nix.enable = true;

      autocomplete.nvim-cmp.enable = true;
      binds.whichKey.enable = true;
    };
  };
}
