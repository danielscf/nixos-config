{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = true;
    vimAlias = true;
    clipboard.register = "unnamedplus";

    withNodejs = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;
    
    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    keymaps = [
      {
        key = ";";
	action = ":";
      }
    ];
  };
}
