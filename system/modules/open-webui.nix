{ config, pkgs, lib, ... }:

{
    options.services.open-webui.enable = lib.mkEnableOption "Open Webui container service";

    config = lib.mkIf config.services.open-webui.enable {
        virtualisation.oci-containers.containers = {
            image = "ghcr.io/open-webui/open-webui:main";
            ports = [ "3000:8000" ];
            volumes = [
                "${config.users.users.hiskingisdone.home}/.open-webui:/app/backend/data";
            ];
            autoStart = false;
        };

        networking.firewall.allowedTCPPorts = [ 3000 ];

    };
}
