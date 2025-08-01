{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
    imports = [
        ./hiskingisdone
        ./scripts
        inputs.sops-nix.homeManagerModules.sops
    ];

    home.username = "hiskingisdone";
    home.homeDirectory = "/home/hiskingisdone";
    home.stateVersion = "25.05";

}
