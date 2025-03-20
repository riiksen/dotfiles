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

    shortcuts = {
      accessibility = {
        "Toggle Screen Reader On and Off" = "";
      };

      kwin = {
        "Krohnkite: Focus Previous" = "";
        "Krohnkite: Decrease" = "Meta+Shift+I";
        "Krohnkite: Rotate" = "Meta+R";
        "Krohnkite: Rotate Part" = "Meta+Shift+R";
        "Krohnkite: Floating Layout" = "Meta+Ctrl+F";
        "Krohnkite: Tile Layout" = "Meta+Ctrl+T";
        "Krohnkite: Toggle Float" = "Meta+Ctrl+F";
        "Krohnkite: Toggle Float All" = "Meta+Shift+F";
        "Move Window To Next Screen" = "Meta+Shift+Right";
        "Move Window To Previous Screen" = "Meta+Shift+Left";
      };

      plasmashell = {
        "Show Desktop" = "";
      };
    };
  };

  home.packages = with pkgs; [
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    kdePackages.krohnkite
  ];
}
