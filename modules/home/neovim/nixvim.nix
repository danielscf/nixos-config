{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./config
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    vimAlias = true;
  };
}
