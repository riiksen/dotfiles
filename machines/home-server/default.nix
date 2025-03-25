{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = lib.flatten [
    (map lib.utils.fromRoot [
      "modules/home-assistant.nix"
      "modules/home-manager.nix"
      "modules/remote-access.nix"
    ])
  ];

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
