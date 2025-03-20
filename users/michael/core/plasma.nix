{ inputs, pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    kwin = {
      virtualDesktops = {
        number = 15;
        rows = 3;
      };
    };
  };

  home.packages = with pkgs; [
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    kdePackages.krohnkite
  ];
}
