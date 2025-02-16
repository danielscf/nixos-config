{
  disko.devices.disk.main = {
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

        luks = {
          size = "100%";
          content = {
            type = "luks";
            name = "cryptroot";
            # disable settings.keyFile if you want to use interactive password entry
            #passwordFile = "/tmp/secret.key"; # Interactive
            # settings = {
            #   allowDiscards = true;
            #   keyFile = "/tmp/secret.key";
            # };
            # additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/@" = {
                  mountpoint = "/";
                  mountOptions = [ 
                    "ssd"
                    "noatime"
                    "discard=async"
                    "compress=zstd"
                    "space_cache=v2"
                  ];
                };
                "/@home" = {
                  mountpoint = "/home";
                  mountOptions = [ 
                    "ssd"
                    "noatime"
                    "discard=async"
                    "compress=zstd"
                    "space_cache=v2"
                  ];
                };
                "/@nix" = {
                  mountpoint = "/nix";
                  mountOptions = [ 
                    "ssd"
                    "noatime"
                    "discard=async"
                    "compress=zstd:3"
                    "space_cache=v2"
                  ];
                };
                "/@var_log" = {
                  mountpoint = "/var/log";
                  mountOptions = [ 
                    "ssd"
                    "noatime"
                    "nodatacow"
                    "compress=no"
                    "space_cache=v2"
                  ];
                };
                "/@snapshots" = {
                  mountpoint = "/.snapshots";
                  mountOptions = [ 
                    "ssd"
                    "noatime"
                    "discard=async"
                    "compress=zstd:3"
                    "space_cache=v2"
                  ];
                };
                "/@swap" = {
                  mountpoint = "/swap";
                  swap.swapfile = {
                    size = "24G";
                    path = "swapfile";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}