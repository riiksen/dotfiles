{
  description = "How I computer";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Hardware
    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Services
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # KDE
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (self) outputs;
      inherit (nixpkgs) lib;

      forAllSystems = nixpkgs.lib.genAttrs systems;

      mkHostConfigs =
        machines: lib.foldl (acc: set: acc // set) { } (lib.map (host: mkMachine host) machines);

      mkMachine = machine: {
        ${machine} = lib.nixosSystem {
          system = system;

          lib = nixpkgs.lib.extend (self: super: { utils = import ./lib { inherit (nixpkgs) lib; }; });
          modules = [ ./machines/${machine} ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };

      machines = lib.attrNames (builtins.readDir ./machines);
      system = "x86_64-linux";
      systems = [ system ];
    in
    {
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = lib.fold (acc: set: acc // set) { } (
        lib.map (machine: mkMachine machine) machines
      );

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;

    };
}
