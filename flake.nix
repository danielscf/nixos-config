{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    disko = { 
      url = "github:nix-community/disko/master"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };

    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # nixosConfigurations.work = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   specialArgs = { inherit inputs; };
    #   modules = [
    #     ./hosts/work/configuration.nix
    #     inputs.home-manager.nixosModules.default
    #   ];
    # };

    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        # ./hosts/vm/configuration.nix
        # inputs.home-manager.nixosModules.default
        inputs.disko.nixosModules.disko
        {
          disko.devices.disk.main = {
            type = "disk";
            device = "/dev/sda";
            content = {
              type = "gpt";

              partitions = {
                ESP = {
                  size = "500M";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };

                root = {
                  size = "100%";
                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
                
              };
            };
          };
        }
      ];
    };

    # nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
    #   specialArgs = { inherit inputs; };
    #   modules = [
    #     ./hosts/wsl/configuration.nix
    #     inputs.home-manager.nixosModules.default
    #   ];
    # };

    # nixosConfigurations.oracle_vps = nixpkgs.lib.nixosSystem {
    #   specialArgs = { inherit inputs; };
    #   modules = [
    #     ./hosts/oracle_vps/configuration.nix
    #     inputs.home-manager.nixosModules.default
    #   ];
    # };

    # nixosConfigurations.default = self.nixosConfigurations.work;
    nixosConfigurations.default = self.nixosConfigurations.vm;
  };
}
