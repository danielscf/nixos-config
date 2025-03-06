{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.where-is-my-sddm-theme.override {
      themeConfig.General.passwordCursorColor = "#FFFFFF";
    })
    (pkgs.pkgs.callPackage ./custom_derivations/sddm-astronaut-theme.nix {
      theme = "black_hole";
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    package = pkgs.kdePackages.sddm;

    # theme = "where_is_my_sddm_theme";
    theme = "sddm-astronaut-theme";
  };
}
