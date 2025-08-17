{ config, pkgs, ... }:

{
    sops = {
        age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

        secrets = {

            rclone-conf = {
                sopsFile = ../../secrets/rclone.yaml;
                key = "rclone_conf";
                mode = "0400";
                path = "${config.home.homeDirectory}/.config/rclone/rclone.conf";
            };
        };
    };
}
