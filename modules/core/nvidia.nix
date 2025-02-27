{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelParams = ["module_blacklist=i915"];

  environment = {
    variables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    systemPackages = with pkgs; [
      lshw
      egl-wayland
    ];
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
