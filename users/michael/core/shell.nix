{ lib, pkgs, ... }:

{
  programs = {
    alacritty.enable = true;

    nushell = {
      enable = true;

      configFile.source = lib.utils.fromRoot "configs/nushell/config.nu";
      envFile.source = lib.utils.fromRoot "configs/nushell/env.nu";
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
  };

  home.packages = with pkgs; [
    # Testing
    warp-terminal
    ghostty
    zellij

    strace
    ltrace
    lsof

    # Utilities
    neofetch
    bat

    fzf
    file
    which
    tree
    btop
    iotop
    iftop
  ];
}
