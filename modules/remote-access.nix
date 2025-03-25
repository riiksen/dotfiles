{
  config,
  pkgs,
  ...
}:

let
  sshPort = config.spec.networking.ports.tcp.ssh;
in
{
  services.openssh = {
    enable = true;
    ports = [ sshPort ];

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      StreamLocalBindUplink = "yes";
      GatewayPorts = "clientspecified";
    };

    hostKeys = [
      {
        path = "";
        type = "ed25519";
      }
    ];
  };

  security.pam = {
    rssh.enable = true;
    services.sudo.rssh = true;
  };

  networking.firewall.allowedTCPPorts = [ sshPort ];
}
