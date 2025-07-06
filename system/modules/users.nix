{ config, pkgs, ... }:

{
    
    users.users.hiskingisdone = {
        isNormalUser = true;
        description = "HisKingIsDone";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    environment.localBinInPath = true;

    environment.homeBinInPath = true;
}
