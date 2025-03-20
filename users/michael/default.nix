{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    core/development.nix
    core/plasma.nix
    core/shell.nix
    core/ssh.nix
    core/tools.nix
  ];

  home.username = "michael";
  home.homeDirectory = "/home/michael";
  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;

  pam = {
    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

      enable = true;
    };
  };

  home.packages = with pkgs; [
    home-manager

    # Core packages
    pinentry

    # Programs
    warp-terminal

    # Terminal utilities
    neofetch
    bat

    fzf
    file
    which
    tree
    btop
    iotop
    iftop

    zip
    unzip
    rar

    sysstat
    lm_sensors
    ethtool
    dnsutils
    mtr
    nmap

    # Fonts
    dina-font
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
