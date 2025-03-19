{ lib, pkgs, ... }:

{
  programs = {
    alacritty.enable = true;

    nushell = {
      enable = true;

      configFile.source = lib.shared.root "configs/nushell/config.nu";
      envFile.source = lib.shared.root "configs/nushell/env.nu";
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
