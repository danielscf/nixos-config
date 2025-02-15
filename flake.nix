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
        inputs.disko.nixosModules.disko
        # ./hosts/vm/configuration.nix
        # inputs.home-manager.nixosModules.default
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
