{ pkgs, ... }:
{
  # TODO: Ask if efi/bios
  # TODO: Ask if encryption
  # TODO: Ask if OSProber
  # TODO: Ask if quiet boot
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "i915.fastboot=1"
      "plymouth.use-simpledrm"
      "boot.shell_on_fail"
      "udev.log_level=3"
      "udev.log_priority=3"
      "systemd.show_status=false"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
    ];

    loader = {
      timeout = null;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = false;

        splashImage = null;
        theme = "${pkgs.catppuccin-grub}";
      };
    };
  };
}
