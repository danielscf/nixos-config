{
  programs.nixvim = {
    # TODO: Finish default keymaps
    globals.mapleader = " ";

    keymaps = [
      {
        key = ";";
        action = ":";
      }
    ];
  };
}
