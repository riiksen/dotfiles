{ pkgs, ... }:
{
  home.packages = with pkgs; [
    audacity
    obs-studio
  ];
}
