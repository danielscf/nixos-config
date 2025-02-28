{
  config,
  pkgs,
  inputs,
  ...
}: {
  system.autoUpgrade = {
    enable = true;
    dates = "Sun *-*-* 10:00:00";
    operation = "switch";
    persistent = true;
    allowReboot = false;
    flake = inputs.self.outPath;
    flags = [
      "-L"
      "--commit-lock-file"
      "--update-input"
      "nixpkgs"
    ];
  };
}
