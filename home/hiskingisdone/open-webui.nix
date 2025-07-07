{ config, pkgs, lib, ... }:

    let
        cfg = config.programs.open-webui;
    in
{
        options.programs.open-webui = {
            enable = lib.mkEnableOption "Open Webui Service (Home Manager)";

            dataDir = lib.mkOption {
                type = lib.types.str;
                default = "${config.home.homeDirectory}/.open-webui";
                description = "The Directory used to store Open Webui data.";
            };

            host = lib.mkOption {
                type = lib.types.str;
                default = "127.0.0.1";
                description = "The host address for Open Webui to listen on.";
            };

            port = lib.mkOption {
                type = lib.types.port;
                default = 8080;
                description = "The port for Open Webui to listen on.";
            };
        };
 
        config = lib.mkIf cfg.enable {
            
            systemd.user.services.open-webui = {
                Unit = {
                    Description = "Open Webui User Service (Home Manager)";
                    After = "network-online.target";
                };
                Service = {
                    Restart = "on-failure";
                    RestartSec = 5;
                    ExecStart = ''
                        ${pkgs.steam-run}/bin/steam-run sh -c " \
                        export DATA_DIR=${cfg.dataDir} && \
                        ${pkgs.uv}/bin/uvx --python 3.11 open-webui@latest serve --host ${cfg.host} --port ${toString cfg.port} \
                        "
                    '';
                };
                #Install = {
                #    WantedBy = [ "default.target" ];
                #};
            };
        };
}
