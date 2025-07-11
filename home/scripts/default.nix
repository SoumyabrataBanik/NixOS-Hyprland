{ pkgs, ... }:

{
    imports = [
        ./nix-update.nix
        ./reload-waybar.nix
        ./toggle-waybar.nix
    ];
}
