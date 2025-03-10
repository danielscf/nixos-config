{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-yazi-plugins = {
      url = "github:lordkekz/nix-yazi-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    # pkgs = import nixpkgs {
    # inherit system;
    # };
    {
      nixosConfigurations.work = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };

        modules = [
          ./hosts/work/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };

        modules = [
          ./hosts/vm/configuration.nix
          inputs.disko.nixosModules.disko
          inputs.home-manager.nixosModules.default
        ];
      };

      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };

        modules = [
          ./hosts/wsl/configuration.nix
          inputs.nixos-wsl.nixosModules.default
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.default
        ];
      };

      # nixosConfigurations.oracle_vps = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/oracle_vps/configuration.nix
      #     inputs.home-manager.nixosModules.default
      #   ];
      # };

      nixosConfigurations.default = self.nixosConfigurations.work;
    };
}
