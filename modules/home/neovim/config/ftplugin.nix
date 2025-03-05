{
  programs.nixvim.extraFiles = {
    "ftplugin/markdown.lua".text = import ../ftplugin/markdown.nix;
    "ftplugin/python.lua".text = import ../ftplugin/python.nix;
  };
}
