{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./options.nix
    ./keymaps.nix

    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    vimAlias = true;
  };
}
