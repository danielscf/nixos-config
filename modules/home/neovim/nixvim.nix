{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./config/options.nix
    ./config/keymaps.nix

    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    vimAlias = true;
  };
}
