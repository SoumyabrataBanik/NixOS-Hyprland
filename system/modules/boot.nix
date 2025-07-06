{ config, pkgs, ... }:

{
    boot = {
        kernelPackages = pkgs.linuxPackages_latest;

        loader = {
            efi.canTouchEfiVariables = true;

            grub = {
                enable = true;
                efiSupport = true;
                devices = [ "nodev" ];
                useOSProber = true;
            };

            timeout = 60;
        };
    };
}
