{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    core/debug.nix
    core/remote-access.nix
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
    stateVersion = "24.11";

    packages = with pkgs; [
      neofetch
    ];
  };

  programs.home-manager.enable = true;
}
