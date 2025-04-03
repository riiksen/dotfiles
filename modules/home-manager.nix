{ config, inputs, lib, pkgs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = {
    inherit inputs pkgs;
  };

  home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  home-manager.users.michael = import (lib.utils.fromRoot "users/michael");
}
