{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };

  boot = {
    initrd.kernelModules = ["nvidia" "i915" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
    kernelParams = [
      "nvidia-drm.fbdev=1"
      "nvidia-drm.modeset=1"
    ];
  };

  environment = {
    variables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
    };

    systemPackages = with pkgs; [
      lshw
      egl-wayland
      nvidia-vaapi-driver
    ];
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      forceFullCompositionPipeline = true;
      # WARNING: This varies between hardware
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
