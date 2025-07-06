{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
    imports = [
        ./hiskingisdone
        ./scripts
    ];

    home.username = "hiskingisdone";
    home.homeDirectory = "/home/hiskingisdone";
    home.stateVersion = "25.05";

}
