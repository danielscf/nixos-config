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
    initrd.kernelModules = [
      "nvidia"
      "i915"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    kernelParams = [
      "nvidia-drm.fbdev=1"
      "nvidia-drm.modeset=1"
    ];
  };

  environment = {
    variables = {
      NVD_BACKEND = "direct";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __NV_PRIME_RENDER_OFFLOAD = 1;
      __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
    };

    systemPackages = with pkgs; [
      lshw
      egl-wayland
    ];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      forceFullCompositionPipeline = true;
      nvidiaPersistenced = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        # WARNING: This varies between hardware
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:0:1:0";
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
