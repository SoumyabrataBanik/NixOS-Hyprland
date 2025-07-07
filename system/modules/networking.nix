{ config, pkgs, ... }:

{
    networking = {
        
        hostName = "nixstar";

        networkmanager.enable = true;

        firewall = {
            enable = true;
            allowedTCPPorts = [ 8080 ];
        };

    };
}
