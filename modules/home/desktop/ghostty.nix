{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    clearDefaultKeybinds = true;
    settings = {
      font-feature = "-calt, -liga, -dLig";

      window-padding-x = 12;
      window-padding-y = 8;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-decoration = "none";
    };
  };
}
