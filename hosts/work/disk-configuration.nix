{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
            };

            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            primary = {
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "nixos-vg";
              }
            };

          };
        };
      };
    };

    lvm_vg = {
      nixos-vg = {
        type = "lvm_vg";
        lvs = {

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
            };
          };

          swap = {
            size = "24G";
            content = {
              type = "swap";
            }
          };

        };
      };
    };
  };
}