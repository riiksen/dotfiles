{ inputs, lib, ... }:
{
  imports = [ inputs.nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor" ];

  services."06cb-009a-fingerprint-sensor" = {
    enable = true;

    # python-validity backend works better for enrollment while libfprint-tod works better for scanning
    # backend = "python-validity";
    backend = "libfprint-tod";
    calib-data-file = lib.utils.fromRoot "configs/calib-data.bin";
  };
}
