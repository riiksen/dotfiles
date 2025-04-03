{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    core/development.nix
    core/plasma.nix
    core/shell.nix
    core/ssh.nix
    core/tools.nix
  ];

  fonts.fontconfig.enable = true;

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    stateVersion = "24.11";

    packages = with pkgs; [
      home-manager

      # Core packages
      pinentry

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
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
        ];
      })
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };

  pam = {
    sessionVariables = {
      EDITOR = "vim";
    };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
