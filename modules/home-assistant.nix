{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  networking.firewall.allowedTCPPorts = [ 8123 ];

  virtualisation.oci-cointainers = {
    backend = "podman";
    containers.homeassistant = {
      volumes = [ "home-assistant:/config" ];
      environment.TZ = "Europe/Warsaw";
      extraOptions = [
        "--network=host"
        "--device=/dev/ttyACM0:/dev/ttyACMO0"
      ];
    };
  };


}
