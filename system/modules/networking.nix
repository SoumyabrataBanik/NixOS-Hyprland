{ config, pkgs, ... }:

{
    networking = {
        
        hostName = "nixstar";

        networkmanager.enable = true;
        
        firewall.enable = false;
    };
}
