{ self, config, pkgs, ... }:
    let
        rcloneConfigFile = config.sops.secrets.rclone-conf;
    in
{
    programs.rclone.enable = true;

    systemd.user.services.rclone-gdrive = {
        Unit = {
            Description = "rclone mount for Google Drive";

            After = [ "network-online.target" ];
            Wants = [ "network-online.target" ];
        };

        Service = {
            Type = "notify";

            ExecStart = ''
                ${pkgs.rclone}/bin/rclone mount \
                    --vfs-cache-mode writes \
                    --dir-cache-time 1m \
                    --network-mode \
                    --fast-list \
                gdrive: ${config.home.homeDirectory}/gdrive
            '';
            ExecStop = "${pkgs.fuse}/bin/fusermount -u ${config.home.homeDirectory}/gdrive";
            Restart = "on-failure";
            RestartSec = "10s";
        };

        Install = {
            WantedBy = [ "default.target" ];
        };
    };
}
