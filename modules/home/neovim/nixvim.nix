{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix

    ./plugins/oil.nix
    ./plugins/which-key.nix
    ./plugins/auto-session.nix
    ./plugins/tmux-navigator.nix
    ./plugins/neoscroll.nix
    ./plugins/nvim-surround.nix
    ./plugins/vim-be-good.nix
    ./plugins/fugitive.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    vimAlias = true;
  };
}
