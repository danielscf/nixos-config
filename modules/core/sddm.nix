{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.pkgs.callPackage ./custom_derivations/sddm-astronaut-theme.nix {
      theme = "japanese_aesthetic";
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;

    theme = "sddm-astronaut-theme";
  };
}
