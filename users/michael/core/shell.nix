{ lib, pkgs, ... }:

{
  programs = {
    alacritty.enable = true;

    nushell = {
      enable = true;

      configFile.source = lib.shared.root "./config.nu";
      envFile.source = lib.shared.root "./env.nu";
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
