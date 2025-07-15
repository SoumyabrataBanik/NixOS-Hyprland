{ config, pkgs, lib, ... }:

{
    options.services.open-webui-vir.enable = lib.mkEnableOption "Open Webui container service";

    config = lib.mkIf config.services.open-webui-vir.enable {
        virtualisation.oci-containers.containers = {
            open-webui = {
                image = "ghcr.io/open-webui/open-webui:git-2470da8";
                ports = [ "3000:8080" ];
                volumes = [
                    "${config.users.users.hiskingisdone.home}/.open-webui:/app/backend/data"
                ];
                autoStart = false;
            };
        };
    };
}
