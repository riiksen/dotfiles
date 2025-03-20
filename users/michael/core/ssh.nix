{ pkgs, ... }:
{
  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;

      pinentryPackage = pkgs.pinentry-qt;
    };

  };

  programs = {
    gpg.enable = true;

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };

  home.packages = with pkgs; [
    gnupg
  ];
}
