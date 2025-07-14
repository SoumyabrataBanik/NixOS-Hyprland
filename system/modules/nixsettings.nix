{ config, pkgs, ... }:

{
    documentation.nixos.enable = true;

    nixpkgs.config.allowUnfree = true;

    nix = {
        settings = {
            experimental-features = [ "nix-command" "flakes" ];

            auto-optimize-store = true;
        };

        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };
}
