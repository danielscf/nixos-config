{
  programs.nixvim.extraFiles = {
    "ftplugin/markdown.lua" = import ../ftplugin/markdown.nix;
    "ftplugin/python.lua" = import ../ftplugin/python.nix;
  };
}
